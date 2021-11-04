function imSrc = Digital_Image_Encryption(imSrc,count)
%该函数对传入图像进行加密
%imSrc：传入三通道或单通道图像
%count：像素排列加密次数


% %-----------------第一次加密：像素值加密-----------------%
imSrc=Figure_Transform(imSrc,0);%调用封装好的函数

for time=1:count
    %-----------------第二次加密：像素排列加密-----------------%
    imSrc=Distribution_Transform(imSrc,1);
end

%-----------------下面的操作是为了让输出图像携带有加密次数---------------%
[row,~,channel]=size(imSrc);
timesCol=zeros(row,1,channel);
%------为提升安全系数，多出的一列与邻近一列相同，只是第一个像素的像素值是加密次数%
for n=1:row
    timesCol(n,1,:)=imSrc(n,1,:);%将imSrc第一列所有像素复刻到新列中
end
timesCol(1,1,1)=count;%在第一行第一列第一页位置像素值就是加密次数
imOut=[timesCol,imSrc];%将加密次数列并到加密图像上
imSrc=imOut;%将最终图像输出

end