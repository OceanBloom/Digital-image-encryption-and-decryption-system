function imSrc = Row_Transform(imSrc,distriKey,mode)
%   对传入图像进行行变换（加密/解密）
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
tempRowMove=zeros(channel,col);
for j=1:row
    %下面循环是将当前行上所有像素值放到中间量tempRowMove中
    for i=1:col
        tempRowMove(:,i)=imSrc(j,i,:);
    end
    %下面选择结构用于判断当前行移动情况（方向和偏移量）
    %在密钥中找到相应秘钥值
    keyId=mod(j,distrikeyCol);
    for m=1:distrikeyCol
            if(distriKey(1,m)==keyId)
                keyId=m;%如果找到keyId位置将该位置的列数赋给keyId
                break;
            end
            continue;
    end
    %确定偏移的方向
    moveDirect=distriKey(2,keyId)/abs(distriKey(2,keyId));
    %偏移量和偏移方向
    rowMove=mode*moveDirect*ceil(row*abs(distriKey(2,keyId)));

    %下面的循环是对当前行上的像素进行移动
    for n=1:channel
        tempRowMove(n,:)=circshift(tempRowMove(n,:),rowMove);
    end
    %下面循环是将偏移后的像素重新赋值回去
    for t=1:col
        for s=1:channel
            imSrc(j,t,s)=tempRowMove(s,t);
        end
    end
end


end

