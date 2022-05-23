function New_im =equalization(im)
[r, c, ch]=size(im);
sum=zeros(256,1);
New_im=zeros(r,c,ch);

    
    hist=imhist(im);
    % Running Sum %
    for i=1:256
        if(i~=1)
              sum(i)=sum(i-1)+hist(i);

        else
            sum(1)=hist(1);

        end
    end
    %Divide each value by the max value and Multiply by the new range%
    sum=round((sum/sum(256))*255);
    
for k=1:ch
    for i=1:r
        for j=1:c
            New_im(i,j,k)= sum(im(i,j,k)+1);
        end
    end
end    
New_im=uint8(New_im);
figure,imshow(im),title('original');
figure,imshow(New_im),title('histogram equalization');


end