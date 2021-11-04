function imSrc = Digital_Image_Decryption(imSrc)
%该函数对传入已加密图像进行解密
%imSrc：传入三通道或单通道图像

count=imSrc(1,1,1);%获取加密次数
imSrc(:,1,:)=[];%删除冗余列
% %-----------------第一次解密：恢复像素值-----------------%
imSrc=Figure_Transform(imSrc,1);%调用封装好的函数

for time=1:count
    %-----------------第二次解密：恢复像素排列-----------------%
    imSrc=Distribution_Transform(imSrc,-1);
end

end