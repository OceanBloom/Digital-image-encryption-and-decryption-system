function imSrc = Row_Transform(imSrc,distriKey,mode)
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
tempRowMove=zeros(channel,col);
for j=1:row
    %����ѭ���ǽ���ǰ������������ֵ�ŵ��м���tempRowMove��
    for i=1:col
        tempRowMove(:,i)=imSrc(j,i,:);
    end
    %����ѡ��ṹ�����жϵ�ǰ���ƶ�����������ƫ������
    %����Կ���ҵ���Ӧ��Կֵ
    keyId=mod(j,distrikeyCol);
    for m=1:distrikeyCol
            if(distriKey(1,m)==keyId)
                keyId=m;%����ҵ�keyIdλ�ý���λ�õ���������keyId
                break;
            end
            continue;
    end
    %ȷ��ƫ�Ƶķ���
    moveDirect=distriKey(2,keyId)/abs(distriKey(2,keyId));
    %ƫ������ƫ�Ʒ���
    rowMove=mode*moveDirect*ceil(row*abs(distriKey(2,keyId)));

    %�����ѭ���ǶԵ�ǰ���ϵ����ؽ����ƶ�
    for n=1:channel
        tempRowMove(n,:)=circshift(tempRowMove(n,:),rowMove);
    end
    %����ѭ���ǽ�ƫ�ƺ���������¸�ֵ��ȥ
    for t=1:col
        for s=1:channel
            imSrc(j,t,s)=tempRowMove(s,t);
        end
    end
end


end

