%% read image
img = imread('DIP3E_Original_Images_CH09\Fig0914(a)(licoln from penny).tif');
radii = 3;
kernel = ones(radii,radii);

%% myErode
[M,N] = size(img);
img_myErode = zeros(M,N,'logical');
margin = (radii-1)/2;
img_padding = padarray(img,[margin margin],1,'both');

for i = 1+margin:M+margin
    for j = 1+margin:N+margin
        sub_win = img_padding(i-margin:i+margin,j-margin:j+margin);
        if (sum(sum((kernel & sub_win) == kernel)) ==  radii*radii)
            img_myErode(i-margin,j-margin) = 1;
        end
    end
end

%% subtract
img_border = img - img_myErode;
imtool(img_border);
