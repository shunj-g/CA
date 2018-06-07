clc
clear 
%%
% 每个格子的生死遵循下面的原则：
% 1．如果一个细胞周围有3个细胞为生（一个细胞周围共有8个细胞），则该细胞为生（即该细胞若原先为死，则转为生，若原先为生，则保持不变）。
% 2．如果一个细胞周围有2个细胞为生，则该细胞的生死状态保持不变；
% 3．在其它情况下，该细胞为死（即该细胞若原先为生，则转为死，若原先为死，则保持不变设定图像中每个像素的初始状态后依据上述的游戏规则演绎生命的变化，由于初始状态和迭代次数不同，将会得到令人叹服的优美图案）。
%%
totallength = 180+2;%280
row = 180;%定义行数
col = 180;%定义列数
maxiterate = 1000;%最大迭代次数
state = zeros(totallength,totallength);
state = initstate(state);
h = showcell(state,NaN);
%pause(0.05)
while 1==1
   if sum(sum(state))~=0
       [neighbor0,neighbor1] = neighbors_fun(state);%获得两种状态的邻居数
       state =  ruler(state,neighbor1);
       h = showcell(state,h);
       drawnow
       %pause(0.05)
   else
       break;
   end
end