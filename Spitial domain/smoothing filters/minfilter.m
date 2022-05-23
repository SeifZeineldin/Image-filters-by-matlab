function New_im =minfilter(img,masksize)
[r, c, ch]=size(img);
New_im=zeros(r,c,ch);
side=((masksize+1)/2)-1;
for k=1:ch
for i =(masksize+1)/2: r-(masksize+1)/2
  for j= (masksize+1)/2:c-(masksize+1)/2
        temp = img(i-side:i+side,j-side:j+side,k);
        val=min(min(temp));
        New_im(i,j,k)=val;
  end
end
end
New_im=uint8(New_im);
figure,imshow(img),title('original');
figure,imshow(New_im),title('min Filter');

end