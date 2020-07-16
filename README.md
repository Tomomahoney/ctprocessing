# ctprocessing
Routines for processing of CT data, mainly written in Matlab
The Matlab files 'buiesegment' and 'segmentimagefolder' should be downloaded to the same folder. 
When 'segmentimagefolder'is run, it will ask for the folder where your images are. This can be one stack, or several subdirectories of image stacks(for a whole hard drive of data, this will take some time!) 
It will then segment the cortical bone after the method outlined by Buie et al., (2007) "Automatic segmentation of cortical and trabecular compartments based on a dual threshold technique for in vivo micro-CT bone analysis" Bone: Volume 41, Issue 4, Pages 505-515. DOI: https://doi.org/10.1016/j.bone.2007.07.007
The segmented data are saved as .tif files in a subfolder "segmented_stack"
This routine has been tested on .dcm, .ima and .tif/.tiff files. It is noticeably faster on .tif files, as the file headers are much smaller.
