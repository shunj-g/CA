function h = showcell(state,h)
[L, W] = size(state); %get its dimensions
temp = state;
temp(temp==1) = 0;%������ȡ��
STATE(:,:,1) = state;%
STATE(:,:,2) = temp;%
STATE(:,:,3) = temp;%

STATE = 1-STATE;%ȡ�������Ϊ��ɫ
%STATE(STATE>=888)=0.3;
if ishandle(h)
    set(h,'CData',STATE)
else
    figure('position',[320,30,600,600])
    h = imagesc(STATE);    
    hold on
	%��������
	%������
   % plot([[0:W]',[0:W]']+0.5,[0,L]+0.5,'k')
	%������
   % plot([0,W]+0.5,[[0:L]',[0:L]']+0.5,'k')
    axis image
    set(gca,'xtick',[]);
    set(gca,'ytick',[]);
end
end