class Slicer:
    def __init__(reader,orientation,min_value=0,max_value=2000):
        #xmin xmax ymin ymax zmin zmax
        self.bounds = reader.GetExecutive().GetWholeExtent(reader.GetOutputInformation(0))

        #x y z
        self.spacing = (xSpacing, ySpacing, zSpacing) = reader.GetOutput().GetSpacing()
        self.origin  = reader.GetOutput().GetOrigin()
        xMin,xMax,yMin,yMax,zMin,zMax = self.bounds
        xspacing,ySpacing,zSpacing = self.spacing
        x0,y0,z0 = self.origin
        self.center = [x0 + xSpacing * 0.5 * (xMin + xMax),
                  y0 + ySpacing * 0.5 * (yMin + yMax),
                  z0 + zSpacing * 0.5 * (zMin + zMax)]

        # Matrices for axial, coronal, sagittal, oblique view orientations
        self.axial = vtk.vtkMatrix4x4()
        self.axial.DeepCopy((1, 0, 0, center[0],
                        0, 1, 0, center[1],
                        0, 0, 1, center[2],
                        0, 0, 0, 1))

        self.coronal = vtk.vtkMatrix4x4()
        self.coronal.DeepCopy((1, 0, 0, center[0],
                          0, 0, 1, center[1],
                          0,-1, 0, center[2],
                          0, 0, 0, 1))

        self.sagittal = vtk.vtkMatrix4x4()
        self.sagittal.DeepCopy((0, 0,-1, center[0],
                           1, 0, 0, center[1],
                           0,-1, 0, center[2],
                           0, 0, 0, 1))

        # Extract a slice in the desired orientation
        self.reslice = vtk.vtkImageReslice()
        self.reslice.SetInputConnection(reader.GetOutputPort())
        self.reslice.SetOutputDimensionality(2)
        if orientation=='sagittal':
            self.reslice.SetResliceAxes(sagittal)
        elif orientation =='coronal':
            self.reslice.SetResliceAxes(coronal)
        elif orientation =='axial':
            self.reslice.SetResliceAxes(axial)

        self.reslice.SetInterpolationModeToLinear()

        # Create a greyscale lookup table
        self.table = vtk.vtkLookupTable()
        self.table.SetRange(min_value, max_value) # image intensity range
        self.table.SetValueRange(0.0, 1.0) # from black to white
        self.table.SetSaturationRange(0.0, 0.0) # no color saturation
        self.table.SetRampToLinear()
        self.table.Build()

        # Map the image through the lookup self.table
        self.color = vtk.vtkImageMapToColors()
        self.color.SetLookupTable(self.table)
        self.color.SetInputConnection(self.reslice.GetOutputPort())

        # Display the image
        self.actor = vtk.vtkImageActor()
        self.actor.GetMapper().SetInputConnection(self.color.GetOutputPort())

def update(obj, interactor, event):
    if event == "LeftButtonPressEvent":
        self.slicing = True
    if event == "LeftButtonReleaseEvent":
        self.slicing = False

    if self.slicing and event == "MouseMoveEvent":
        (lastX, lastY) = interactor.GetLastEventPosition()
        (mouseX, mouseY) = interactor.GetEventPosition()

        deltaY = mouseY - lastY
        self.reslice.Update()
        sliceSpacing = self.reslice.GetOutput().GetSpacing()[2]
        matrix = self.reslice.GetResliceAxes()
        # move the center point that we are slicing through
        center = matrix.MultiplyPoint((0, 0, sliceSpacing*deltaY, 1))
        matrix.SetElement(0, 3, center[0])
        matrix.SetElement(1, 3, center[1])
        matrix.SetElement(2, 3, center[2])
