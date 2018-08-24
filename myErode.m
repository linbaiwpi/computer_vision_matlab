% img comes from
% book website <<Digital Image Processing>> 3rd E.
% Gonzalez
% DIP3E_Original_Images_CH09

kernel = ones(11,11);

[M,N] = size(img);
img_myErode = zeros(M,N,'logical');
radii = 11;
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

% test the correctness
img_erode = imerode(img,kernel);

imshow(img);
figure;
imshow(img_erode);
figure;
imshow(img_myErode);

if(sum(sum(img_myErode == img_erode)) == M*N)
    disp("myErode is correct!");
else
    disp("myErode is NOT correct!");
end