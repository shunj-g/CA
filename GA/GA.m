function[xv,fv]=GA(fitness,a,b,NP,NG,pc,pm,eps)
%上限a
%下限b
%种群大小：NP
%遗传代数：NG
%交叉概率：pc
%变异概率：pm
%离散精度：eps
% a = 0;
% b = 2*pi;
% NP = 20;
% NG = 20;
% pc = 0.6;
% pm = 0.1;
% eps = 0.0001;
%第一步产生初始种群x，
L=ceil(log2((b-a)/eps));%根据离散精度确定串长L
x=Initial(L,NP);%得到初始值
for i=1:NP
    xdec(i)=dec(a,b,x(i,:),L);%转化为十进制的数值
end
%第二步  选择 交叉 变异 要循环好几代
for i=1:NG
    %选择
    fx=fitness(xdec);%适应度//算出函数值
    fxp=fx/sum(fx);%选择概率
    fxa(1)=fxp(1);%累计概率得到上一代的最大概率
    for j=2:NP
        fxa(j)=fxa(j-1)+fxp(j);
    end
    %开始选择父体
    sat=rand();
    for k=1:NP
        if sat<=fxa(k)
            father=k;
            break;
        end
    end
    %随机选取母体
    mother=ceil(rand()*NP);
    nx=x;
    %单点交叉
    cutp=ceil(rand()*L);
    r1=rand();
    if r1<=pc
        nx(i,1:cutp)=x(father,1:cutp);
        nx(i,cutp+1:L)=x(mother,cutp+1:L);
        r2=rand();%是否变异
        if r2
            cum=ceil(rand()*L);
            nx(i,cum)=~nx(i,cum);
        end
    end
    x=nx;
    for i=1:NP
        xdec(i)=dec(a,b,x(i,:),L);
    end
    %选择较好的子代
    fv=-inf;
    for i=1:NP
        fitx=fitness(dec(a,b,x(i,:),L));
        if fitx>fv
            fv=fitx;
            xv=dec(a,b,x(i,:),L);
        end
    end
end
%种群初始化函数
function t=Initial(L,NP)
t=zeros(NP,L);
for i=1:NP
    for j=1:L
        temp=rand();
        t(i,j)=round(temp);
    end
end
%解码函数 二进制转换成十进制
function d=dec(a,b,num,L)
i=L-1:-1:0;
data=sum((2.^i).*num);
d=a+data*(b-a)/(2^L-1);
