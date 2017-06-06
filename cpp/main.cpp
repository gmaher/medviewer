#include <iostream>
#include <itkImage.h>
#include <itkImageFileReader.h>
#include <itkImageFileWriter.h>
#include <fstream>
#include <vector>
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
  std::vector<int> v;

  for (int i = 0; i < 10; i++){
    int k = i;
    v.push_back(k);
  }

  std::cout << "v size: " << v.size() << "\n";

  for (int i = 0; i < 10; i++){
    std::cout <<"v element " << i << " = " << v[i] << "\n";
  }
  return 0;
}
