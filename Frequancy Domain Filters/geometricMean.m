function New_im =geometricMean(im,w)
im=imnoise(im,'gaussian');
wm=(w+1)/2;
border=wm-1;
im = padarray(im,[border,border],0);
[r, c, ch]=size(im);
New_im=zeros(r,c,ch);
avg=1/(w*w);
window=ones(w,w);
for k=1:ch
    for i=wm:r-wm%starting from border +1;
        for j=wm:c-wm%starting from border +1
            window=double(avg).*double(im(i-border:i+border,j-border:j+border,k));
            val_product=prod(window,'All');
            val_product=power(val_product,(1/(w*w)));
            New_im(i,j,k)=uint8(val_product);
        end
    end
end    
New_im=uint8(New_im);
figure,imshow(im),title('noise');
figure,imshow(New_im),title('clean');
end