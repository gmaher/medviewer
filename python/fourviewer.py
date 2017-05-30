import vtk

def read_mha(fn):
    reader = vtk.vtkMetaImageReader()
    reader.SetFileName(fn)
    reader.SetDataOrigin(0.0, 0.0, 0.0)
    reader.Update()
    return reader

def read_dicom(dir_):
  reader = vtk.vtkDICOMImageReader()
  reader.SetDirectoryName('/full/path/to/my/dicom/images/')
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
iren.SetRenderWindow(rw)
# Define viewport ranges
xmins=[0,.5,0,.5]
xmaxs=[0.5,1,0.5,1]
ymins=[0,0,.5,.5]
ymaxs=[0.5,0.5,1,1]
views = ['axial','volume','coronal','sagittal']
viewer = {}
viewer['window'] = rw
viewer['interactor'] = iren
viewer['views'] = {}

r = read_mha("/home/gabriel/dropbox/vascular_data/OSMSC0101/OSMSC0101-cm.mha")

for i in range(4):
    v = views[i]
    viewer['views'][v] = vtk.vtkRenderer()
    viewer['window'].AddRenderer(viewer['views'][v])
    viewer['views'][v].SetViewport(xmins[i],ymins[i],xmaxs[i],ymaxs[i])
    viewer['views'][v].AddActor(cut(r))
    viewer['views'][v].ResetCamera()
#add_pd(viewer,sphereSource)

viewer['window'].Render()
viewer['window'].SetWindowName('Medview FourView')
viewer['interactor'].Start()
