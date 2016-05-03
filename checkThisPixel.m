function [NewCoinage] = checkThisPixel(OldBird,x,y,newval)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

    NewCoinage = getImage;
    [height,width] = size(NewCoinage);
    if((x>2)&&(x<width-2)&&(y>2)&&(y<height-2)) 
        imshow(NewCoinage);
        %check pixel value against oldbird
        minusxy = OldBird(y,x);
        %if within range make it white
        if((minusxy>(newval-0.2))&&(minusxy<(newval+0.2)))
            NewCoinage(y,x)=1;
            setImage(NewCoinage);
             %check pixel above
            if(NewCoinage(y-1,x)>0)&&(NewCoinage(y-1,x)<1)
                %yes do this --checkThisPixel
                checkThisPixel(OldBird,x,y-1,newval);
            end
            %check pixel to right if >0 <1
            if(NewCoinage(y,x+1)>0)&&(NewCoinage(y,x+1)<1)
                %yes do this --checkThisPixel
                checkThisPixel(OldBird,x+1,y,newval);
            end
            %check pixel to bottom if >0 <1
            if(NewCoinage(y+1,x)>0)&&(NewCoinage(y+1,x)<1)
                %yes do this --checkThisPixel
                checkThisPixel(OldBird,x,y+1,newval);
            end
            %check pixel to left if >0 <1
            if(NewCoinage(y,x-1)>0)&&(NewCoinage(y,x-1)<1)
                %yes do this --checkThisPixel
                checkThisPixel(OldBird,x-1,y,newval);
            end
            
        else
            % if a pixel falls outside the threshold it is set to black
            NewCoinage(y,x)=0;
            setImage(NewCoinage);
            imshow(NewCoinage);
            return;
        end
        
               
    end
        
end
   
    



