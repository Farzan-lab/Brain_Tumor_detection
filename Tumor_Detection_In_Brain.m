clc;
clear;
close all;
I=imread('Capture1.png');
gray_I=rgb2gray(I);
j=imresize(gray_I,[700,700]);
contrust_j=imadjust(j);

figure(1),
subplot(2,2,1);imshow(I),title('ORIGINAL IMAGE');
subplot(2,2,2);imshow(gray_I),title('COLOR ADJUSTED IMAGE');
subplot(2,2,3);imshow(j),title('RESIZED IMAGE');
subplot(2,2,4);imshow(contrust_j),title('CONTRAST ADJUSTED IMAGE');

s=strel('disk',20);
d=imerode(contrust_j,s);
figure(2),imshow(d);
%imwrite(d,'G:\matlab\bin\pardazesh\PROJECT2\image1.jpg');

[M,N]=size(d);
p=zeros(1,256);
for x=1:M
 for y=1:N
  r=d(x,y);
  p(r+1)=p(r+1)+1; 
 end
end
p=p/sum(p);

l=length(p);
mG(1)=0;
for i=1:1:l-1
    mG(i+1)=mG(i)+i*p(i);
end
mG_sum=sum(mG);

k=l-2;
p1(1)=0;
m(1)=0;
max(1)=0;
sigmaB2(1)=0;
for i=1:k
    p1(i+1)=p1(i)+p(i);
    m(i+1)=m(i)+i*p(i);
    sigmaB2(i+1)=((mG_sum*p1(i)-m(i))^2)/(p1(i)*(1-p1(i)));
    if  sigmaB2(i+1)>max         
        max(i+1)=sigmaB2(i+1);         
        T=round(mean(find(sigmaB2(i+1)>max))); 
    end
end

g=zeros(M,N);
g(d>T)=0; 
g(d<=T)=255; 
figure(3);imshow(g);

imtool(g);

h=imhist(I);
h1=imhist(gray_I);
h2=imhist(j);
h3=imhist(contrust_j);
h4=imhist(d);
h5=imhist(g);

%figure(4),
%subplot(2,3,1);bar(h),title('ORIGINAL IMAGE');
%subplot(2,3,2);bar(h1),title('COLOR ADJUSTED IMAGE');
%subplot(2,3,3);bar(h2),title('RESIZED IMAGE');
%subplot(2,3,4);bar(h3),title('CONTRAST ADJUSTED IMAGE');
%subplot(2,3,5);bar(h4),title('AFTER EROSION');
%subplot(2,3,6);bar(h5),title('OUTPUT IMAGE');

figure(4),
subplot(2,3,1);imhist(I),title('ORIGINAL IMAGE');
subplot(2,3,2);imhist(gray_I),title('COLOR ADJUSTED IMAGE');
subplot(2,3,3);imhist(j),title('RESIZED IMAGE');
subplot(2,3,4);imhist(contrust_j),title('CONTRAST ADJUSTED IMAGE');
subplot(2,3,5);imhist(d),title('AFTER EROSION');
subplot(2,3,6);imhist(g),title('OUTPUT IMAGE');

figure(5),
subplot(2,3,2);plot(gray_I),title('COLOR ADJUSTED IMAGE');
subplot(2,3,3);plot(j),title('RESIZED IMAGE');
subplot(2,3,4);plot(contrust_j),title('CONTRAST ADJUSTED IMAGE');
subplot(2,3,5);plot(d),title('AFTER EROSION');
subplot(2,3,6);plot(g),title('OUTPUT IMAGE');

