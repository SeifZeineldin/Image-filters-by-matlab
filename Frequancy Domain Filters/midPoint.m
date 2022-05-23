function New_im =midPoint(im,w)

im=imnoise(im,'salt & pepper');
wm=(w+1)/2;
border=wm-1;
im = padarray(im,[border,border],0);
[r, c, ch]=size(im);
New_im=zeros(r,c,ch);

for k=1:ch
    for i=wm:r-wm%starting from border +1;
        for j=wm:c-wm%starting from border +1
            min_val=min(im(i-border:i+border,j-border:j+border,k),[],'All');
            max_val=max(im(i-border:i+border,j-border:j+border,k),[],'All');
            new_val=(.5*(min_val+max_val));
            New_im(i,j,k)=uint8(new_val);
        end
    end
end    
New_im=uint8(New_im);
figure,imshow(im),title('noise');
figure,imshow(New_im),title('clear');
end