function grayImg = convert_to_grayscale(im)
[r, c, ch]=size(im);
double value=0;
for i=1:r
    for j=1:c
        value =(im(i,j ,1)+im(i,j ,2)+im(i,j ,3))/3;
        round(value);
        grayImg(i,j)=value;
    end
end
grayImg = uint8(grayImg);
figure,imshow(im),title('Original')
figure,imshow(grayImg),title('Gray scale')