function imSrc = Distribution_Transform(imSrc,mode)
%  �ú����Դ���ͼ��������������ϼ��ܻ����
%  imSrc��������ͨ����ͨ��ͼ��
%  mode��ѡ����ܻ���ܡ�1������  -1������


%���طֲ���Կ����һ������Կֵ��������
%��Կ��ֵ�ľ���ֵ��С����ƫ�Ƶĳ̶ȣ������ű�ʾƫ�Ƶķ���
%Ϊ�˱�֤����Ч�����б任���б任����Կ��ͬ
%�ڶ���������Կ��������������Կ
distriKey=[
1,        2,        3,        4,        5,        6,        7,        8,        9,        10,        11,        12,        13,        14,        0;
8,       -1,      -16,      11,      7,        -4,      10,      -4,       12,	     2,	         1,         -20,       -7,         18,        1;
-1,     25,       7,	    -9,	     41,	  -10,	   16,	    -28,	  -2,	   11,	      -10,        6,         45,        -18,       9
];
if mode==1%����
    imSrc=Row_Transform(imSrc,distriKey,mode);%������
    imSrc=Col_Transform(imSrc,distriKey,mode);%������
else %����
    imSrc=Col_Transform(imSrc,distriKey,mode);%�ָ���
    imSrc=Row_Transform(imSrc,distriKey,mode);%�ָ���
end


end

