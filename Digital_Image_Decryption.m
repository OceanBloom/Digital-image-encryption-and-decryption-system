function imSrc = Digital_Image_Decryption(imSrc)
%�ú����Դ����Ѽ���ͼ����н���
%imSrc��������ͨ����ͨ��ͼ��

count=imSrc(1,1,1);%��ȡ���ܴ���
imSrc(:,1,:)=[];%ɾ��������
% %-----------------��һ�ν��ܣ��ָ�����ֵ-----------------%
imSrc=Figure_Transform(imSrc,1);%���÷�װ�õĺ���

for time=1:count
    %-----------------�ڶ��ν��ܣ��ָ���������-----------------%
    imSrc=Distribution_Transform(imSrc,-1);
end

end