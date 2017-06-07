#include <iostream>
#include <itkImage.h>
#include <itkVTKImageToImageFilter.h>
#include <itkThresholdImageFilter.h>
#include <itkRescaleIntensityImageFilter.h>
#include <itkCollidingFrontsImageFilter.h>
#include <itkImageFileReader.h>
#include <itkImageFileWriter.h>
#include <itkCastImageFilter.h>
#include <itkImageToVTKImageFilter.h>
#include <itkImageFileWriter.h>
#include <vtkMarchingCubes.h>
#include <vtkPoints.h>
#include <vtkPolyData.h>
#include <vtkPolyDataWriter.h>
#include <vtkImageData.h>
#include <vtkMetaImageReader.h>
#include <vtkImageCast.h>
#include <fstream>
#include <vector>


vtkSmartPointer<vtkPolyData> collidingFronts(vtkImageData* volumeImage,
  std::vector<std::vector<int>>& seeds1,
  std::vector<std::vector<int>>& seeds2,
  int lowerThreshold =0, int upperThreshold=0)
{

  typedef itk::Image<short int,3> InputType;
  typedef itk::Image<float,3> CFImageType;

  auto caster = vtkSmartPointer<vtkImageCast>::New();
  caster->SetInputData(volumeImage);
  caster->SetOutputScalarTypeToFloat();
  caster->Update();


  //Colliding fronts needs an itk image, so we first convert vtk image to itk
  auto VTKFilter = itk::VTKImageToImageFilter<CFImageType>::New();
  VTKFilter->SetInput(caster->GetOutput());
  VTKFilter->Update();

  auto itkImage = VTKFilter->GetOutput();

  auto thresh = itk::ThresholdImageFilter<CFImageType>::New();

  //check if we need to threshold the image
  if ((lowerThreshold != upperThreshold) && (lowerThreshold < upperThreshold)){

    thresh->SetInput(itkImage);
    thresh->ThresholdOutside(lowerThreshold,upperThreshold);
    thresh->SetOutsideValue(0.0);
    thresh->Update();
    itkImage = thresh->GetOutput();
  }

  //finally CF needs pixel values to be between 0 and 1, so we rescale the image
  auto scaler = itk::RescaleIntensityImageFilter<CFImageType,CFImageType>::New();
  scaler->SetInput(itkImage);
  scaler->SetOutputMinimum(0.0);
  scaler->SetOutputMaximum(1.0);
  scaler->Update();

  //now construct collidingfronts filter
  typedef itk::CollidingFrontsImageFilter<CFImageType,CFImageType> CFType;
  auto CF = CFType::New();

  //Colliding fronts expects seeds as level set nodes in a node container,
  //so we convert the input seed vectors to this type
  typedef CFType::NodeContainer NodeContainer;
  typedef CFType::NodeType NodeType;

  //create node container for starting seed points
  auto seedContainer1 = NodeContainer::New();
  seedContainer1->Initialize();
  for (int i = 0; i < seeds1.size(); i++){

    auto p = seeds1[i];
    CFImageType::IndexType index;

    for (int j = 0; j < 3; j++){
      index[j] = p[j];
    }

    NodeType n;
    n.SetIndex(index);
    n.SetValue(0.0);
    seedContainer1->InsertElement(i,n);
  }

  //create node container for end seed points
  auto seedContainer2 = NodeContainer::New();
  seedContainer2->Initialize();
  for (int i = 0; i < seeds2.size(); i++){

    auto p = seeds2[i];
    CFImageType::IndexType index;

    for (int j = 0; j < 3; j++){
      index[j] = p[j];
    }

    NodeType n;
    n.SetIndex(index);
    n.SetValue(0.0);
    seedContainer2->InsertElement(i,n);
  }

  //now set the inputs for the colliding fronts filter
  CF->SetInput(scaler->GetOutput());
  CF->SetSeedPoints1(seedContainer1);
  CF->SetSeedPoints2(seedContainer2);
  // CF->ApplyConnectivityOn();
  CF->StopOnTargetsOn();
  CF->Update();

  //convert CF segmentation to binary image
  //CF sets everything inside to negative, everything outside to 0
  thresh->SetInput(CF->GetOutput());
  thresh->ThresholdBelow(0);
  thresh->SetOutsideValue(1.0);
  thresh->Update();

  //now convert back to vtk image
  auto itk_to_vtk = itk::ImageToVTKImageFilter<CFImageType>::New();
  itk_to_vtk->SetInput(thresh->GetOutput());
  itk_to_vtk->Update();

  //Extract a segmentation from the image
  auto MC = vtkSmartPointer<vtkMarchingCubes>::New();
  MC->SetInputData(itk_to_vtk->GetOutput());
  MC->SetValue(0,0.5);
  MC->Update();

  auto pd = MC->GetOutput();
  return pd;
}

int main(){

  //typedefs for itk
  typedef int PixelType;
  const unsigned int DIMENSION = 3;
  typedef itk::Image<PixelType, DIMENSION> ImageType;
  typedef itk::ImageFileReader<ImageType> ReaderType;
  typedef itk::ImageFileWriter<ImageType> WriterType;

  //create input and output file lists for file names
  //also create reader and writer for metaimage
  std::cout <<"Running\n";

  auto image_fn = "/home/gabriel/dropbox/vascular_data/OSMSC0101/OSMSC0101-cm.mha";
  auto reader = vtkMetaImageReader::New();
  reader->SetFileName(image_fn);
  reader->Update();

  vtkImageData* vtkImg = reader->GetOutput();

  auto m = vtkImg->GetScalarRange();
  std::cout << "before MC, max = " << m[1] << "\n";

  auto seed1 = std::vector<std::vector<int>>();
  auto v = std::vector<int>();
  v.push_back(30);
  v.push_back(220);
  v.push_back(311);
  seed1.push_back(v);

  auto seed2 = std::vector<std::vector<int>>();
  auto v2 = std::vector<int>();
  v2.push_back(32);
  v2.push_back(234);
  v2.push_back(80);
  seed2.push_back(v2);

  auto pd = collidingFronts(vtkImg,seed1,seed2);

  std::cout << "after retrun\n";
  std::cout << "pd cells " << pd->GetNumberOfVerts() << "\n";
  pd->Print(std::cout);
  std::cout <<"Before write\n";
  auto writer = vtkSmartPointer<vtkPolyDataWriter>::New();
  writer->SetInputData(pd);
  writer->SetFileName("seg_cpp.vtk");
  writer->Write();
  return 0;
}
