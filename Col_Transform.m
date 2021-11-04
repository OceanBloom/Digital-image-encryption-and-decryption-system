function imSrc = Col_Transform(imSrc,distriKey,mode)
%   对传入图像进行列变换（加密/解密）
%   imSrc：传入三通道或单通道图像
%   distriKey：传入秘钥矩阵
%   mode：选择加密或解密。 1：加密 -1：解密

[row,col,channel]=size(imSrc);%获取传入图像的尺寸信息
[~,distrikeyCol]=size(distriKey);%获取密钥数组尺寸
%下面循环是将密钥值换成比例
for a=1:distrikeyCol
    newRowKey=abs(  distriKey(2,a)  )/ sum( abs( distriKey(2,:) ) );
    newColKey=abs(  distriKey(3,a)  )/ sum( abs( distriKey(3,:) ) );
    
    distriKey(2,a)=newRowKey*(distriKey(2,a)/abs(distriKey(2,a)));
    distriKey(3,a)=newColKey*(distriKey(3,a)/abs(distriKey(3,a)));
end

%移动的位数和方向由像素分布密钥决定
tempColMove=zeros(row,channel);
for j=1:col
    %下面循环是将当前列上所有像素值放到中间量tempColMove中
    for i=1:row
        tempColMove(i,:)=imSrc(i,j,:);
    end
    %下面选择结构用于判断当前列移动情况（方向和偏移量）
    %在密钥中找到相应偏移比例
    keyId=mod(j,distrikeyCol);
    for m=1:distrikeyCol
            if(distriKey(1,m)==keyId)
                keyId=m;%如果找到keyId位置将该位置的列数赋给keyId
                break;
            end
            continue;
    end
    %确定偏移的方向
    moveDirect=distriKey(3,keyId)/abs(distriKey(3,keyId));
    %偏移量和偏移方向
    colMove=mode*moveDirect*ceil(row*abs(distriKey(3,keyId)));
    %下面的循环是对当前列上的像素进行移动
    for n=1:channel
        tempColMove(:,n)=circshift(tempColMove(:,n),colMove);
    end
    %下面循环是将偏移后的像素重新赋值回去
    for t=1:row
        for s=1:channel
            imSrc(t,j,s)=tempColMove(t,s);
        end
    end
end


end

