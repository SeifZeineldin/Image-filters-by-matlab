function vertical =drow_hist(im)
[r, c, ch]=size(im);
vertical = zeros(256,1);
horizontal = linspace(1, 256,256);
for k=1:ch
    for i=1:r
        for j=1:c
            a=im(i,j,k)+1;
            vertical(a)= vertical(a)+1;
        end
    end
end
stem(horizontal,vertical),title('Histogram');
end