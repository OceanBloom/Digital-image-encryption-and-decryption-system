function imSrc = Distribution_Transform(imSrc,mode)
%  该函数对传入图像进行像素排列上加密或解密
%  imSrc：传入三通道或单通道图像
%  mode：选择加密或解密。1：加密  -1：解密


%像素分布密钥（第一行是密钥值的索引）
%秘钥的值的绝对值大小就是偏移的程度，正负号表示偏移的方向
%为了保证加密效果，行变换和列变换的秘钥不同
%第二行是行秘钥，第三行是列秘钥
distriKey=[
1,        2,        3,        4,        5,        6,        7,        8,        9,        10,        11,        12,        13,        14,        0;
8,       -1,      -16,      11,      7,        -4,      10,      -4,       12,	     2,	         1,         -20,       -7,         18,        1;
-1,     25,       7,	    -9,	     41,	  -10,	   16,	    -28,	  -2,	   11,	      -10,        6,         45,        -18,       9
];
if mode==1%加密
    imSrc=Row_Transform(imSrc,distriKey,mode);%打乱行
    imSrc=Col_Transform(imSrc,distriKey,mode);%打乱列
else %解密
    imSrc=Col_Transform(imSrc,distriKey,mode);%恢复列
    imSrc=Row_Transform(imSrc,distriKey,mode);%恢复行
end


end

