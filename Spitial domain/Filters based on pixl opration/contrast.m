function New_im = contrast(im,new_max ,new_min)
[r, c, ch]=size(im); 
old_max = max(max(max(im)));
old_min= min(min(min(im)));
for k=1:ch
            for i=1:r
                for j=1:c
                    old_value=im(i,j,k);
                    new_value=((old_value-old_min)/(old_max-old_min))*(new_max-new_min)+new_min;
                    if new_value>255
                        new_value=255
                    end
                    if new_value<0
                        new_value=0
                    end
                    New_im(i,j,k)=new_value;
               
            end
            end
end
    New_im = uint8(New_im);
figure,imshow(im),title('Original')
figure,imshow(New_im),title('contrast')
   

end