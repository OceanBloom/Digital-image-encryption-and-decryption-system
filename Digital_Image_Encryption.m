function imSrc = Digital_Image_Encryption(imSrc,count)
%�ú����Դ���ͼ����м���
%imSrc��������ͨ����ͨ��ͼ��
%count���������м��ܴ���


% %-----------------��һ�μ��ܣ�����ֵ����-----------------%
imSrc=Figure_Transform(imSrc,0);%���÷�װ�õĺ���

for time=1:count
    %-----------------�ڶ��μ��ܣ��������м���-----------------%
    imSrc=Distribution_Transform(imSrc,1);
end

%-----------------����Ĳ�����Ϊ�������ͼ��Я���м��ܴ���---------------%
[row,~,channel]=size(imSrc);
timesCol=zeros(row,1,channel);
%------Ϊ������ȫϵ���������һ�����ڽ�һ����ͬ��ֻ�ǵ�һ�����ص�����ֵ�Ǽ��ܴ���%
for n=1:row
    timesCol(n,1,:)=imSrc(n,1,:);%��imSrc��һ���������ظ��̵�������
end
timesCol(1,1,1)=count;%�ڵ�һ�е�һ�е�һҳλ������ֵ���Ǽ��ܴ���
imOut=[timesCol,imSrc];%�����ܴ����в�������ͼ����
imSrc=imOut;%������ͼ�����

end