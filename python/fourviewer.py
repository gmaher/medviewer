import vtk
from slicer import Slicer

def read_mha(fn):
    reader = vtk.vtkMetaImageReader()
    reader.SetFileName(fn)
    reader.SetDataOrigin(0.0, 0.0, 0.0)
    reader.Update()
    return reader

def read_dicom(dir_):
  reader = vtk.vtkDICOMImageReader()
  reader.SetDirectoryName(dir_)
  reader.SetDataOrigin(0.0,0.0,0.0)
  reader.Update()

def read_vti(fn):
    reader = vtk.vtkXMLImageDataReader()
    reader.SetFileName(fn)
    reader.SetDataOrigin(0.0, 0.0, 0.0)
    reader.Update()
    return reader

def add_pd(viewer, pd):
    #Create a mapper and actor
    for k in viewer['views'].keys():
        mapper = vtk.vtkPolyDataMapper()
        mapper.SetInputConnection(pd.GetOutputPort())
        actor = vtk.vtkActor()
        actor.SetMapper(mapper)
        viewer['views'][k].AddActor(actor)
        viewer['views'][k].ResetCamera()

def cut(source):
    #create a plane to cut,here it cuts in the XZ direction (xz normal=(1,0,0);XY =(0,0,1),YZ =(0,1,0)
    plane=vtk.vtkPlane()
    plane.SetOrigin(0,0,0)
    plane.SetNormal(1,0,0)

    #create cutter
    cutter=vtk.vtkCutter()
    cutter.SetCutFunction(plane)
    cutter.SetInputConnection(source.GetOutputPort())
    cutter.Update()
    cutterMapper=vtk.vtkPolyDataMapper()
    cutterMapper.SetInputConnection(cutter.GetOutputPort())

    #create plane actor
    planeActor=vtk.vtkActor()
    planeActor.GetProperty().SetColor(1.0,1,0)
    planeActor.GetProperty().SetLineWidth(2)
    planeActor.SetMapper(cutterMapper)

    return planeActor

'''One render window, multiple viewports'''
rw = vtk.vtkRenderWindow()
iren = vtk.vtkRenderWindowInteractor()

interactorStyle = vtk.vtkInteractorStyleImage()
iren.SetInteractorStyle(interactorStyle)

iren.SetRenderWindow(rw)
# Define viewport ranges
xmins=[0,.5,0,.5]
xmaxs=[0.5,1,0.5,1]
ymins=[0,0,.5,.5]
ymaxs=[0.5,0.5,1,1]
views = ['coronal','sagittal','axial','volume']
viewer = {}
viewer['window'] = rw
viewer['interactor'] = iren
viewer['views'] = {}

r = read_mha("/home/gabriel/dropbox/vascular_data/OSMSC0101/OSMSC0101-cm.mha")

for i in range(4):
    v = views[i]
    viewer['views'][v] = {}
    viewer['views'][v]['renderer'] = vtk.vtkRenderer()
    viewer['window'].AddRenderer(viewer['views'][v]['renderer'])
    viewer['views'][v]['renderer'].SetViewport(xmins[i],ymins[i],xmaxs[i],ymaxs[i])
    viewer['views'][v]['slicer'] = Slicer(r,v)
    viewer['views'][v]['renderer'].AddActor(viewer['views'][v]['slicer'].actor)
    viewer['views'][v]['renderer'].ResetCamera()
#add_pd(viewer,sphereSource)

def MouseCallback(obj,event):

    (mouseX, mouseY) = iren.GetEventPosition()
    s = viewer['window'].GetSize()
    mouseX = float(mouseX)/s[0]
    mouseY = float(mouseY)/s[1]

    for k in viewer['views'].keys():
        v = viewer['views'][k]['renderer'].GetViewport()

        if mouseX > v[0] and mouseX < v[2] and mouseY > v[1] and mouseY < v[3]:
            viewer['views'][k]['slicer'].update(obj,iren,event)
    viewer['window'].Render()

interactorStyle.AddObserver("MouseMoveEvent", MouseCallback)
interactorStyle.AddObserver("LeftButtonPressEvent", MouseCallback)
interactorStyle.AddObserver("LeftButtonReleaseEvent", MouseCallback)

viewer['window'].Render()
viewer['window'].SetWindowName('Medview FourView')
viewer['interactor'].Start()
