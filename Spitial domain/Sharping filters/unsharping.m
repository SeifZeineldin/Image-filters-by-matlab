


function New_im2 =unsharping(img)
img2=weghit(img,2);
[r, c, ch]=size(img);
New_im1=ones(r,c,ch);
New_im2=ones(r,c,ch);

        for k=1:ch
        for i =1: r
        for j =1: c
New_im1(i,j,k)=img(i,j,k)-img2(i,j,k);

          end
      end
        end
        New_im1=uint8(New_im1);
        for k=1:ch
        for i =1: r
        for j =1: c
New_im2(i,j,k)=img(i,j,k)+New_im1(i,j,k);

          end
      end
  end


New_im2=uint8(New_im2);
figure,imshow(img),title('original');
figure,imshow(New_im2),title('UNsharping Filter');
end
