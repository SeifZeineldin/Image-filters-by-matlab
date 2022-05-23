function New_im = brightness(im,offset)
[r, c, ch]=size(im);

    for k=1:ch
            for i=1:r
                for j=1:c
                    newvalue=New_im(i,j,k)+offset
                    if newvalue>255
                        newvalue=255
                    end
                    New_im(i,j,k)=newvalue
                end
            end
    end
    New_im = uint8(New_im);
figure,imshow(im),title('Original')
figure,imshow(New_im),title('Brightness')
end