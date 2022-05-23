function New_im = lowpass_butterworth(im,D0,N)
[m, n, ch]=size(im);
D = zeros(m,n, ch);
H = zeros(m,n, ch);
% Apply FFT
FT = fft2(im);
FTS = fftshift(FT);
Real = real(FTS);
Imag = imag(FTS);
                                        
    for k=1:ch
            for u=1:m
                for v=1:n
                    D(u,v,k)=(((u-(m/2))^2)+((v-(n/2))^2))^0.5 ;
                end
            end
    end
    
     for k=1:ch
            for u=1:m
                for v=1:n
                    H(u,v,k)=1/(1+(D(u,v,k)/D0)^(2*N));
                end
            end
    end
    
   
Real= H.*Real;
Imag= H.*Imag;
                
FT = ifftshift(Real +((-1)^0.5) * Imag);
IFT = ifft2(FT);
              
New_im = uint8(IFT);
figure,imshow(im),title('Original')
figure,imshow(New_im),title('Lowpass butterworth')
end