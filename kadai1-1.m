lena=imread("lena.bmp");
lena=double(lena);
N=512;
DCT=eye(8);
after=double(eye(N));
for i=[1:8]
    k=1;
    if(i==1)
        k=k/sqrt(2);
    end
    for j=[1:8]
        DCT(i,j)=k*cos(pi*(i-1)*(j-0.5)/8)/2;
    end
end
test=eye(512);
for i=[1:64]
    for j=[1:64]
        after((i-1)*8+1:i*8,(j-1)*8+1:j*8)=DCT'*lena((i-1)*8+1:i*8,(j-1)*8+1:j*8)*DCT;
        test((i-1)*8+1:i*8,(j-1)*8+1:j*8)=DCT*after((i-1)*8+1:i*8,(j-1)*8+1:j*8)*DCT';
    end
end
for i=[1:N]
    for j=[1:N]
        if(abs(after(i,j))<20)
            after(i,j)=0;
        end
    end
end
MSE=0;
for i=[1:N]
    for j=[1:N]
        MSE=MSE+(lena(i,j)-after(i,j))^2;
    end
end

MSE=MSE/(N^2)
max_num=max(max(lena));
PSNR=10*log10(max_num^2/MSE)

MSE=0;
for i=[1:N]
    for j=[1:N]
        MSE=MSE+(test(i,j)-after(i,j))^2;
    end
end

MSE=MSE/(N^2)
max_num=max(max(test));
PSNR=10*log10(max_num^2/MSE)


#imshow(test./255);
