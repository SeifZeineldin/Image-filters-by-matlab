function New_im =quantzation(img,siz)
[r, c, ch]=size(img);
New_im=zeros(r,c,ch);
graylevel=2^siz;
gab=256/graylevel;
colors=(gab:gab:256);
for k=1:ch
for i =1:r
  for j= 1:c
        index = img(i,j,k);
        val =0;
        for f =1:length(colors)
            if index>=colors(length(colors))
                val=colors(length(colors));
            elseif index > colors(f) && index <= colors(f+1)
                val = colors(f+1);
            elseif index < colors(1)
                val=colors(1);
            end
        end
        New_im(i,j,k)= val;
  end
end
end
New_im=uint8(New_im);
figure,imshow(img),title('original');
figure,imshow(New_im),title('quantzation');

end