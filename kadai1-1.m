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
        DCT(i,j)=k*sqrt(2/8)*cos(pi*(i-1)*(j-0.5)/8);
    end
end
test=eye(512);
for i=[1:64]
    for j=[1:64]
        after((i-1)*8+1:i*8,(j-1)*8+1:j*8)=DCT'*lena((i-1)*8+1:i*8,(j-1)*8+1:j*8)*DCT;
        test((i-1)*8+1:i*8,(j-1)*8+1:j*8)=DCT*after((i-1)*8+1:i*8,(j-1)*8+1:j*8)*DCT';
    end
end
#after(3,1)./255
#imshow(test./255);
#imshow(lena./255);
#imshow(lena);
