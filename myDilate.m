% img comes from
% book website <<Digital Image Processing>> 3rd E.
% Gonzalez
% DIP3E_Original_Images_CH09


kernel = ones(11,11);

[M,N] = size(img);
img_myDilate = zeros(M,N,'logical');
radii = 11;
margin = (radii-1)/2;
img_padding = padarray(img,[margin margin],0,'both');

for i = 1+margin:M+margin
    for j = 1+margin:N+margin
        sub_win = img_padding(i-margin:i+margin,j-margin:j+margin);
        if (sum(sum(kernel & sub_win)) > 0 )
            img_myDilate(i-margin,j-margin) = 1;
        end
    end
end

% test the correctness
img_dilate = imdilate(img,kernel);

imshow(img);
figure;
imshow(img_dilate);
figure;
imshow(img_myDilate);

if(sum(sum(img_myDilate == img_dilate)) == M*N)
    disp("myDilate is correct!");
else
    disp("myDilate is NOT correct!");
end