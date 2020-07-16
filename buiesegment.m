function results = buiesegment(im)
%Image Processing Function
%
% IM      - Input image.
% RESULTS - A scalar structure with the processing results.
%

%--------------------------------------------------------------------------
% Auto-generated by imageBatchProcessor App. 
%
% When used by the App, this function will be called for every input image
% file automatically. IM contains the input image as a matrix. RESULTS is a
% scalar structure containing the results of this processing function.
%
%--------------------------------------------------------------------------



% Replace the sample below with your code----------------------------------

if(size(im,3)==3)
    % Convert RGB to grayscale
    imgray = rgb2gray(im);
else
    imgray = im;
end
mediandata=medfilt2(imgray);
se_outer = offsetstrel('ball',15,15);
dilatedouter=imdilate(mediandata,se_outer);
filledouter=imfill(dilatedouter,'holes');
erodedouter=imerode(filledouter,se_outer);
erodedouter_thresh=imbinarize(erodedouter);
secondmask=imabsdiff(erodedouter,imgray);
se_inner=offsetstrel('ball',10,10);
dilatedinner=imdilate(secondmask,se_inner);
connected_inner=imfill(dilatedinner,'holes');
eroded_inner=imerode(connected_inner,se_inner);
erode_inner_thresh=imbinarize(eroded_inner);
%subtract masks from each other
seg_image=imabsdiff(erodedouter_thresh,erode_inner_thresh);
%results.eroded_inner=eroded_inner
%results.erodedouter_thresh=erodedouter_thresh
%results.erode_inner_thresh=erode_inner_thresh
results.segimage=seg_image
