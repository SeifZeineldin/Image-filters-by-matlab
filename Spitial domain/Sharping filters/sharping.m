


function New_im =sharping(img)
in=input("1-point mask\n" + ...
    "2-horrizontal mask\n" + ...
    "3-vertical mask\n" + ...
    "4-diagonal1 mask\n" + ...
    "5-diagonal2 mask");
in=int16(in);
switch in
    case 1
        mask=[-1,-1,-1;-1,9,-1;-1,-1,-1];
    case 2
        mask=[0,1,0;0,1,0;0,-1,0];
    case 3
        mask=[0,0,0;1,1,-1;0,0,0];
    case 4
        mask=[1,0,0;0,1,0;0,0,-1];
    case 5
        mask=[0,0,1;0,1,0;-1,0,0];
    otherwise
        print("ERROR");

end
mask=double(mask);
[r, c, ch]=size(img);
New_im=ones(r,c,ch);
masksize=3;
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
figure,imshow(New_im),title('sharping Filter');
end
