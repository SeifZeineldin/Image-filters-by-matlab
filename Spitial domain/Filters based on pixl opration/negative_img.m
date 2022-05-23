function New_im =  negative_img(im)
[r, c, ch]=size(im);
for k=1: ch
    for i=1: r
        for j=1:c
        New_im(i,j,k)=255-im(i,j,k);
            
        end
    end
end
New_im = uint8(New_im);
figure,imshow(im),title('Original')
figure,imshow(New_im),title('image negative')
end