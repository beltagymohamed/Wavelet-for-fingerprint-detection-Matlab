% Loop for reading data and abstract c vectors

nameBegin='FBD/Train/Train';
nameEnd='.tif';

im=zeros(300,300,13);
img=zeros(300,300,13);

% For 4, 'sym8'
cv1=zeros(10,107731);
cv2=zeros(3,107731);

% For 4, 'haar'
% cv1=zeros(10,90151);
% cv2=zeros(3,90151);

% For 4, 'db4'
% cv1=zeros(10,97474);
% cv2=zeros(3,97474);

% Read the person pattern
for i=1:1:10
    name=[nameBegin num2str(i) nameEnd];
    im(:,:,i)=imread(name);
    img(:,:,i)=double(im(:,:,i));
    [c,s]=wavedec2(img(:,:,i),4,'sym8');
    cv1(i,:)=c;
end

nameBegin='FBD/Test/Test';
nameEnd='.tif';
index=[1 3 8];
% Read the person tests
for i=1:1:3
    name=[nameBegin num2str(index(i)) nameEnd];
    im(:,:,i)=imread(name);
    img(:,:,i)=double(im(:,:,i));
    [c,s]=wavedec2(img(:,:,i),4,'sym8');
    cv2(i,:)=c;
end

SDv=zeros(3,10);
for i=1:1:3
    for j=1:1:10
        SDv(i,j)=compare(cv2(i,:),cv1(j,:));
    end
end

figure
subplot(3,1,1),plot(SDv(1,:));
title('Fingerprint of person 1');
xlabel('Person');
%ylabel('Absolute error');
subplot(3,1,2),plot(SDv(2,:));
title('Fingerprint of person 3');
xlabel('Person');
ylabel('Absolute error');
subplot(3,1,3),plot(SDv(3,:));
title('Fingerprint of person 8');
xlabel('Person');
%ylabel('Absolute error');







