import vtk
import itk
image_type = itk.Image[itk.SS,3]
CF_image_type = itk.Image[itk.F,3]

reader = vtk.vtkMetaImageReader()
reader.SetFileName("/home/gabriel/dropbox/vascular_data/OSMSC0101/OSMSC0101-cm.mha")
reader.SetDataScalarTypeToUnsignedChar()
reader.Update()

#convert vtk to itk
vtkToItk = itk.VTKImageToImageFilter[image_type].New()
vtkToItk.SetInput(reader.GetOutput())
vtkToItk.Update()
itk_image = vtkToItk.GetOutput()

#Cast image for colliding fronts
caster = itk.CastImageFilter[image_type,CF_image_type].New()
caster.SetInput(itk_image)

scaler = itk.RescaleIntensityImageFilter[CF_image_type,CF_image_type].New()
scaler.SetInput(caster.GetOutput())
scaler.SetOutputMinimum(0.0)
scaler.SetOutputMaximum(1.0)

#Colliding fronts filter
CF = itk.CollidingFrontsImageFilter[CF_image_type,CF_image_type].New()

spacing = [0.12,0.0683,0.0683]
origin = itk_image.GetOrigin()

p1 = itk.Index[3]()
p1[0]=30
p1[1]=220
p1[2]=311
p2 = itk.Index[3]()
p2[0]=32
p2[1]=234
p2[2]=80

node1 = itk.LevelSetNode[itk.F,3]()
node1.SetIndex(p1)
node1.SetValue(0.0)

node2 = itk.LevelSetNode[itk.F,3]()
node2.SetIndex(p2)
node2.SetValue(0.0)

seed1 = itk.VectorContainer[itk.UI,itk.LevelSetNode[itk.F,3]].New()
seed1.Initialize()
seed1.InsertElement(0,node1)

seed2 = itk.VectorContainer[itk.UI,itk.LevelSetNode[itk.F,3]].New()
seed2.Initialize()
seed2.InsertElement(0,node2)

#Set inputs for colliding fronts
CF.SetInput(scaler.GetOutput())
CF.SetSeedPoints1(seed1)
CF.SetSeedPoints2(seed2)
# CF.ApplyConnectivityOn()
# CF.StopOnTargetsOn()
CF.Update()

#Get output
seg = CF.GetOutput()

writer = itk.ImageFileWriter[itk.Image[itk.F,3]].New()
writer.SetFileName('seg.mha')
writer.SetInput(seg)
writer.Update()

#write seed points for vizualization
#Create a sphere

c1 = vtk.vtkSphereSource()
c1.SetCenter(origin[0]+30*spacing[0], origin[1]+220*spacing[1], origin[2]+311*spacing[2])
c1.SetRadius(1)

c2 = vtk.vtkSphereSource()
c2.SetCenter(origin[0]+32*spacing[0], origin[1]+234*spacing[1], origin[2]+80*spacing[2])
c2.SetRadius(1)

#Create a mapper and actor
mapper = vtk.vtkPolyDataMapper()
mapper.SetInputConnection(c1.GetOutputPort())

writer_pd = vtk.vtkPolyDataWriter()
writer_pd.SetFileName('c1.vtk')
writer_pd.SetInputConnection(c1.GetOutputPort())
writer_pd.Write()

mapper.SetInputConnection(c2.GetOutputPort())
writer_pd.SetFileName('c2.vtk')
writer_pd.SetInputConnection(c2.GetOutputPort())
writer_pd.Write()

#Export to polydata
itkToVtk = itk.ImageToVTKImageFilter[CF_image_type].New()
itkToVtk.SetInput(CF.GetOutput())
itkToVtk.Update()

MC = vtk.vtkMarchingCubes()
MC.SetInputData(itkToVtk.GetOutput())
MC.SetValue(0,0)

writer_pd.SetFileName('seg.vtk')
writer_pd.SetInputConnection(MC.GetOutputPort())
writer_pd.Write()
