clc
clear 
%%
% ÿ�����ӵ�������ѭ�����ԭ��
% 1�����һ��ϸ����Χ��3��ϸ��Ϊ����һ��ϸ����Χ����8��ϸ���������ϸ��Ϊ��������ϸ����ԭ��Ϊ������תΪ������ԭ��Ϊ�����򱣳ֲ��䣩��
% 2�����һ��ϸ����Χ��2��ϸ��Ϊ�������ϸ��������״̬���ֲ��䣻
% 3������������£���ϸ��Ϊ��������ϸ����ԭ��Ϊ������תΪ������ԭ��Ϊ�����򱣳ֲ����趨ͼ����ÿ�����صĳ�ʼ״̬��������������Ϸ�������������ı仯�����ڳ�ʼ״̬�͵���������ͬ������õ�����̾��������ͼ������
%%
totallength = 180+2;%280
row = 180;%��������
col = 180;%��������
maxiterate = 1000;%����������
state = zeros(totallength,totallength);
state = initstate(state);
h = showcell(state,NaN);
%pause(0.05)
while 1==1
   if sum(sum(state))~=0
       [neighbor0,neighbor1] = neighbors_fun(state);%�������״̬���ھ���
       state =  ruler(state,neighbor1);
       h = showcell(state,h);
       drawnow
       %pause(0.05)
   else
       break;
   end
end