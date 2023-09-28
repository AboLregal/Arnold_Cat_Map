clear;clc;close all

I=imread('pout.tif');
N=255;
I=imresize(I,[N,N]);

sI=sum(I(:))+sum(I(:)==1);
a=13+mod(sI,29);
b=7+mod(sI,47);
% k=3+mod(sI,13);
Ienc=uint8(zeros(N));
Idec=Ienc;
q=[1 a;b a*b+1];
for i=0:N-1
    for j=0:N-1
        m=1+mod(q*[i;j],N);
        Ienc(m(1),m(2))=I(i+1,j+1);
    end
end
q2=[a*b+1 -a;-b 1];
for i=0:N-1
    for j=0:N-1
        m=1+mod(q2*[i;j],N);
        Idec(m(1),m(2))=Ienc(i+1,j+1);
    end
end
subplot(1,3,1)
imshow(I);title('Orig')
subplot(1,3,2)
imshow(Ienc);title('Encrypted image')
subplot(1,3,3)
imshow(Idec);title('Decerypted image')
