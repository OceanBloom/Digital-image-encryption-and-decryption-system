function imSrc = Col_Transform(imSrc,distriKey,mode)
%   �Դ���ͼ������б任������/���ܣ�
%   imSrc��������ͨ����ͨ��ͼ��
%   distriKey��������Կ����
%   mode��ѡ����ܻ���ܡ� 1������ -1������

[row,col,channel]=size(imSrc);%��ȡ����ͼ��ĳߴ���Ϣ
[~,distrikeyCol]=size(distriKey);%��ȡ��Կ����ߴ�
%����ѭ���ǽ���Կֵ���ɱ���
for a=1:distrikeyCol
    newRowKey=abs(  distriKey(2,a)  )/ sum( abs( distriKey(2,:) ) );
    newColKey=abs(  distriKey(3,a)  )/ sum( abs( distriKey(3,:) ) );
    
    distriKey(2,a)=newRowKey*(distriKey(2,a)/abs(distriKey(2,a)));
    distriKey(3,a)=newColKey*(distriKey(3,a)/abs(distriKey(3,a)));
end

%�ƶ���λ���ͷ��������طֲ���Կ����
tempColMove=zeros(row,channel);
for j=1:col
    %����ѭ���ǽ���ǰ������������ֵ�ŵ��м���tempColMove��
    for i=1:row
        tempColMove(i,:)=imSrc(i,j,:);
    end
    %����ѡ��ṹ�����жϵ�ǰ���ƶ�����������ƫ������
    %����Կ���ҵ���Ӧƫ�Ʊ���
    keyId=mod(j,distrikeyCol);
    for m=1:distrikeyCol
            if(distriKey(1,m)==keyId)
                keyId=m;%����ҵ�keyIdλ�ý���λ�õ���������keyId
                break;
            end
            continue;
    end
    %ȷ��ƫ�Ƶķ���
    moveDirect=distriKey(3,keyId)/abs(distriKey(3,keyId));
    %ƫ������ƫ�Ʒ���
    colMove=mode*moveDirect*ceil(row*abs(distriKey(3,keyId)));
    %�����ѭ���ǶԵ�ǰ���ϵ����ؽ����ƶ�
    for n=1:channel
        tempColMove(:,n)=circshift(tempColMove(:,n),colMove);
    end
    %����ѭ���ǽ�ƫ�ƺ���������¸�ֵ��ȥ
    for t=1:row
        for s=1:channel
            imSrc(t,j,s)=tempColMove(t,s);
        end
    end
end


end

