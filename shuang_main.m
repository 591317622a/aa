%% �������ֵ������µ�˫��滮
clc
clear
warning off
close all
tic
%% ���ò���
canshu;

%% ��ʼֵ
%% �ϲ�
%��ʼ���ֳɱ�+Ͷ�ʳɱ�+���۵�ɱ���ȼ�ϳɱ� +��ά�ɱ�
%LBΪ��ʼ���ֳɱ�+Ͷ�ʳɱ�+���۵�ɱ�+ȼ�ϳɱ� +��ά�ɱ�
%yita���۵�ɱ�+ȼ�ϳɱ�+��ά�ɱ�
[yita,LB,ee_bat_int, p_wt_int,p_pv_int,p_g_int] = UP_1(rp,rbat,rPV,rWT,rG);
%% �²�
%UBΪ�ϲ㣨���ֳɱ�+Ͷ�ʳɱ���+�²㣨���۵�ɱ�+ȼ�ϳɱ� +��ά�ɱ���
[p_wt,p_pv,p_load,x,UB,p_g,p_ch,p_dis,p_buy,p_sell] = DOWN_(ee_bat_int,p_wt_int,p_pv_int,p_g_int,LB,yita);
%UB1Ϊ��ʼ�ϲ㣨���ֳɱ�+Ͷ�ʳɱ���+�²㣨���۵�ɱ�+ȼ�ϳɱ� +��ά�ɱ���
UB1 = UB;
%% pΪ�ϲ㣨���۵�ɱ�+ȼ�ϳɱ� +��ά�ɱ������²㣨���۵�ɱ�+ȼ�ϳɱ� +��ά�ɱ�����
p(1)= UB - LB;
e=100;%������
%% ��ʼ����
for k=1:Imax
    %% �ϲ� ����֪�������磬���ɳ��������²㴫�ݵ��ϲ㣩�����ʼ���ֳɱ�+Ͷ�ʳɱ�+���۵�ɱ���ȼ�ϳɱ� +��ά�ɱ�������Сֵ��
    [yita,LB,ee_bat_int,p_wt_int,p_pv_int,p_g_int] = UP_2(p_wt,p_pv,p_load);%MP����
    %% �²� ��֪�����ֳɱ�+Ͷ�ʳɱ������ϲ㴫�ݵ��²㣩+���㣨���۵�ɱ�+ȼ�ϳɱ� +��ά�ɱ���
    [p_wt,p_pv,p_load,x,UB,p_g,p_ch,p_dis,p_buy,p_sell] = DOWN_(ee_bat_int,p_wt_int,p_pv_int,p_g_int,LB,yita);%SP����
    UB = min(UB1,UB);%ȡUB��Сֵ
    %% pΪ�ϲ㣨���۵�ɱ�+ȼ�ϳɱ� +��ά�ɱ������²㣨���۵�ɱ�+ȼ�ϳɱ� +��ά�ɱ�����
    p(k+1) = UB-LB;
    %�ж��Ƿ�����
    if abs(p(k+1))<=e
        break
    end
end
%% ������
%����,����,���,���,����,ȼ��
p_wt
p_pv
p_load
p_g
p_ch
p_dis
p_buy
p_sell
 toc
 
 %% ��ͼ
 %% ����
 figure;
 plot(p,'-*')
 xlabel('��������')
 ylabel('UB-LB')
 title('��������')
 
 %% ������1
figure
hold on
positive=[p_wt(:,1),p_pv(:,1),p_g(:,1),p_dis(:,1),p_buy(:,1)];
negative=[-p_ch(:,1),-p_sell(:,1)];
bar(positive,'stack')
bar(negative,'stack')
plot(p_load(:,1),'-d')
ylabel('����/kw')
xlabel('ʱ��/Сʱ')
title('������1��������')
legend('���','���','ȼ��','��طŵ�','����','��س��','�۵�','���񸺺�')
 
 
  %% ������2
figure
hold on
positive=[p_wt(:,2),p_pv(:,2),p_g(:,2),p_dis(:,2),p_buy(:,2)];
negative=[-p_ch(:,2),-p_sell(:,2)];
bar(positive,'stack')
bar(negative,'stack')
plot(p_load(:,2),'-d')
ylabel('����/kw')
xlabel('ʱ��/Сʱ')
title('������2��������')
legend('���','���','ȼ��','��طŵ�','����','��س��','�۵�','���񸺺�')
  
  
 
 
 
  %% ������3
 figure
hold on
positive=[p_wt(:,3),p_pv(:,3),p_g(:,3),p_dis(:,3),p_buy(:,3)];
negative=[-p_ch(:,3),-p_sell(:,3)];
bar(positive,'stack')
bar(negative,'stack')
plot(p_load(:,3),'-d')
ylabel('����/kw')
xlabel('ʱ��/Сʱ')
title('������3��������')
legend('���','���','ȼ��','��طŵ�','����','��س��','�۵�','���񸺺�')
  
 
 
  %% ������4
 figure
hold on
positive=[p_wt(:,4),p_pv(:,4),p_g(:,4),p_dis(:,4),p_buy(:,4)];
negative=[-p_ch(:,4),-p_sell(:,4)];
bar(positive,'stack')
bar(negative,'stack')
plot(p_load(:,4),'-d')
ylabel('����/kw')
xlabel('ʱ��/Сʱ')
title('������4��������')
legend('���','���','ȼ��','��طŵ�','����','��س��','�۵�','���񸺺�')



 
 
 
 
 
 
 
 