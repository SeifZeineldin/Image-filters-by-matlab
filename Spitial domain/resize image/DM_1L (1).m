function New_im = DM_1L(im,fact)
[r, c, ch]=size(im);
New_r = r*fact;
New_c = c*fact;
New_im = zeros(New_r,New_c, ch);
                      

                    %STEP ONE
    for k=1:ch
            for i=1:r
                for j=1:c
                    New_im(i*fact+1-fact,j*fact+1-fact,k)= im(i,j,k);
                end
            end
    end
                        


                        % STEP TWO

           for k=1:ch   
            for i=1:New_r
                for j=1:New_c
                    if(j<c)
                           right =New_im(i,(j+1)*fact+1-fact,k);
                           left=New_im(i,j*fact+1-fact,k);
                            if(right<=left)
                                  for y=1:fact-1
                                      value=round(((left-right)/fact)*y+right);
                                    New_im(i,((j+1)*fact+1-fact)-y,k)=value;
                                  end
                            elseif(left<right)
                                for y=1:fact-1
                                      value=round(((right-left)/fact)*y+left);
                                    New_im(i,(j*fact+1-fact)+y,k)=value;
                                end
                
                            end
                    elseif(j>(New_c-fact)+1)
                        New_im(i,j,k)=New_im(i,j-1,k);
                    end


                end
            end
           end

                          %STEP THREE

           for k=1:ch   
            for i=1:New_r
                for j=1:New_c
                     if(i<r)
                           right =New_im((i+1)*fact+1-fact,j,k);
                           left=New_im(i*fact+1-fact,j,k);
                            if(right<=left)
                                  for y=1:fact-1
                                      value=round(((left-right)/fact)*y+right);
                                     New_im(((i+1)*fact+1-fact)-y,j,k)=value;
                                  end
                            elseif(left<right)
                                for y=1:fact-1
                                      value=round(((right-left)/fact)*y+left);
                                     New_im((i*fact+1-fact)+y,j,k)=value;
                                end
                
                            end
                    elseif(i>(New_r-fact)+1)
                         New_im(i,j,k)= New_im(i-1,j,k);

                     end

                end
            end
             end
                                         



   

                        

               
New_im = uint8(New_im);
figure,imshow(im),title('Original')
figure,imshow(New_im),title('Resized')
end