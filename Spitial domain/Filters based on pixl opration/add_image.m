function New_im =  add_image(im,im2)
[r, c, ch]=size(im);
[r2, c2, ch2]=size(im2);
New_im = zeros(max(r,r2),max(c,c2), max(ch2,ch));
[New_r,new_c,new_ch]=size(New_im);
for k=1: new_ch
    for i=1: New_r
        for j=1: new_c
            if(i<=r && j<=c && k<=ch)
            im_val=im(i,j,k);
            else
            im_val=0;
            end

            if(i<=r2 && j<=c2 && k<=ch2)
            im2_val=im2(i,j,k);
            else
            im2_val=0;
            end
            
            new_val=im_val+im2_val;
            if new_val>255
                new_val=255;
            elseif new_val<0
                 new_val=0;
            end
            New_im(i,j,k)= new_pixl;
        end
    end
end
New_im = uint8(New_im);
figure,imshow(im),title('Original')
figure,imshow(im2),title('Original 2')
figure,imshow(New_im),title('Add_image')
end