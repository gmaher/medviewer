import vtk

def add_pd(viewer, pd):
    #Create a mapper and actor
    for k in viewer['views'].keys():
        mapper = vtk.vtkPolyDataMapper()
        mapper.SetInputConnection(pd.GetOutputPort())
        actor = vtk.vtkActor()
        actor.SetMapper(mapper)
        viewer['views'][k].AddActor(actor)
        viewer['views'][k].ResetCamera()

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
for i in range(4):
    v = views[i]
    viewer['views'][v] = vtk.vtkRenderer()
    viewer['window'].AddRenderer(viewer['views'][v])
    viewer['views'][v].SetViewport(xmins[i],ymins[i],xmaxs[i],ymaxs[i])

#Create a sphere
sphereSource = vtk.vtkSphereSource()
sphereSource.SetCenter(0.0, 0.0, 0.0)
sphereSource.SetRadius(5)

add_pd(viewer,sphereSource)

viewer['window'].Render()
viewer['window'].SetWindowName('Medview FourView')
viewer['interactor'].Start()
