function New_im = power_low(im,gamma)
[r, c, ch]=size(im);

    for k=1:ch
            for i=1:r
                for j=1:c
                    newvalue=double im(i,j,k).^gamma;
                    
                    New_im(i,j,k)=round(newvalue)
                end
            end
    end
    New_im = uint8(New_im);
    New_im = contrast(New_im,0,255);
figure,imshow(im),title('Original')
figure,imshow(New_im),title('Power_low')
end