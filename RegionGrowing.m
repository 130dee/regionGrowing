%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                   %
%   Derek Conway                                    %
%   28/04/16                                        %
%   DT228/4                                         %
%   Outline of the algorithm used for assignment 3  %
%   Region growing                                  %
%                                                   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% This application performs "region growing" using a recursive algorithm
% function that is called from the main program. 
% checkThisPixel(Coinage,x,y,thresVal).
% Coinage: image used to compare the difference in intensity
% x,y: coordinates from button click.
% threshold: the value of allowable difference.
% 
% The seedpoint (x,y) is taken as a double button click from the user, and saved
% as x,y coordinates
%
% The algorithm is sound, but is limited by Matlab's ability to handle
% recursive calls.
%
% The region is recusively grown by comparing pixels, to the seed intensity. 
% A value difference of 0.2 is used to find the similarity of a pixel to the seed.
% for testing (I understand this is a magic number, but I feel it cannot be
% caclulated).
% If a pixel falls within the threshold it is coloured white and added to the region.
% the surrounding pixels are then checked, if a pixel falls outside the
% threshold it is coloured black and no testing of the surrounding pixels
% occurs.
% 
% This process stops when all the pixels that are 
% connected to the region have been tested and recursion has ended, At the
% on occasion, Matlab will crash before a region is fully complete. This is
% due to a stackoverflow problem on large regions.
%
% a Global Image is stored and used to track the progression of the
% algorithm.
%
% Testing has been completed sucessfully on coinage.png and birdie.bmp.
%
% code used to set and get the global vars were obtained here: 
% http://uk.mathworks.com/help/matlab/ref/global.html.
% Author: Derek Conway, C12728815

clc % clear screen
clear all % clear memory
close all % close any open images

set(0,'RecursionLimit',2000)

%read in an image and make a copy to work with
Original = imread('coins.png');
Coinage = im2double(Original);
Coinage = rgb2gray(Coinage);
[H,W] = size(Coinage);

figure;
imshow(Coinage),title 'Coinage';
[x,y] = getpts;     % reads in the point where the user has double-clicked
x = int64(x);    % sets the x y to be integers, for use later
y=int64(y);

setImage(Coinage); % function to set the global variable of the image to be used
    
thresVal = Coinage(y,x); %get the intensity value of the seed pixel.
checkThisPixel(Coinage,x,y,thresVal); % call the recursive algorithm.

showme = getImage; % function to get the global var image
figure, imshow(showme),title 'finished region grow';


   
    
    
    
   


