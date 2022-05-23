function New_im =weghit(img,sigma)
[r, c, ch]=size(img);
New_im=ones(r,c,ch);
[mask,masksize]=Guassian_function_2D(sigma);
sumtion=sum(mask,'all')

mask=mask/sumtion;
side=((masksize+1)/2)-1;

        for k=1:ch
        for i =(masksize+1)/2: r-(masksize+1)/2
        for j =(masksize+1)/2: c-(masksize+1)/2

   temp = img(i-side:i+side,j-side:j+side,k);
   val=0;
       for f=1:masksize
           for g=1:masksize
               val=val+(double(mask(f,g))*double(temp(f,g)));   
           end
       end
   New_im(i,j,k)=val;


          end
      end
  end



New_im=uint8(New_im);
figure,imshow(img),title('original');
figure,imshow(New_im),title('weghit Filter');
end
