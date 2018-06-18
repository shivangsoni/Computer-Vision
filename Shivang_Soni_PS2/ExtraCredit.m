
function [centers] = ExtraCredit(im, radius, useGradient)
    im = rgb2gray(im);
    height = size(im,1);
    width = size(im,2);
    [~,Gradient_dir] = imgradient(im);
    angle = [0:1:2*pi];
    edges = edge(im,'canny',0.2,6);
    H = zeros(height,width);
  
    [coord_x, coord_y] = find(edges);
    for counter=1:size(coord_x,1)
        y = coord_x(counter);
        x = coord_y(counter);
        if(useGradient == 1)
            theta = Gradient_dir(y, x);
            theta = [theta:1:theta + pi];
        else
            theta = angle;            
        end
        a = x - radius * cos(theta);
        b = y + radius * sin(theta);
        if(a>width)
            a(a>width) = [];
        end
        if(a<1)
            a(a<1) = [];
        end
        
        if(b>height)
            b(b>height) = [];
        end
        if(b<1)
            b(b<1) = [];
        end
        a(a>width | a<1) = [];
        b(b>height | b<1) = [];
        H(round(b), round(a)) = H(round(b), round(a)) + 1;    
    end
	list = H;
    %% Sort the list based on intensity values. 
    [o, orderedIndices] = sort(list(:), 'descend');
    %%Reshape those indecies in Hough Space
    p = reshape(orderedIndices, height, width);
    %%Corrosponding X and Y value find
    [y,x] = ind2sub(size(p), p);
    %%
    centers = [x(1)', y(1)'];    
end
