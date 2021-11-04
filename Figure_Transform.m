function imSrc = Figure_Transform(imSrc,mode)
%该函数对传入图像进行像素值加密或解密
%imSrc：传入三通道或单通道图像
%mode：选择加密或解密。0：加密 1：解密


[~,~,channel]=size(imSrc);%获取传入图像的尺寸信息
%-----------------像素值加密/解密-----------------%
%---step 1:对最大像素值255取差（加密解密相同）---%
imSrc=abs(255-imSrc);

%下面的rgb通道顺序改变只针对3通道图像，单通道灰度图不能进行该操作
if channel==3   
    %---step 2:打乱/恢复 颜色通道顺序---%
    %彩色图像三通道分布顺序：
    %(:,:,1)--red (:,:,2)--green (:,:,3)--blue
    %加密：rgb->brg        解密：brg->rgb
    %---1：前两位交换（加密解密相同）---%
    temp=imSrc(:,:,2);
    imSrc(:,:,2)=imSrc(:,:,1);
    imSrc(:,:,1)=temp;
    %---2：加密：第一位g和第三位b交换得到brg---%
    %---2：解密：第二位b和第三位g交换得到rgb---%
    temp=imSrc(:,:,3);
    imSrc(:,:,3)=imSrc(:,:,1+mode);
    imSrc(:,:,1+mode)=temp;
end


end

