function[xv,fv]=GA(fitness,a,b,NP,NG,pc,pm,eps)
%����a
%����b
%��Ⱥ��С��NP
%�Ŵ�������NG
%������ʣ�pc
%������ʣ�pm
%��ɢ���ȣ�eps
% a = 0;
% b = 2*pi;
% NP = 20;
% NG = 20;
% pc = 0.6;
% pm = 0.1;
% eps = 0.0001;
%��һ��������ʼ��Ⱥx��
L=ceil(log2((b-a)/eps));%������ɢ����ȷ������L
x=Initial(L,NP);%�õ���ʼֵ
for i=1:NP
    xdec(i)=dec(a,b,x(i,:),L);%ת��Ϊʮ���Ƶ���ֵ
end
%�ڶ���  ѡ�� ���� ���� Ҫѭ���ü���
for i=1:NG
    %ѡ��
    fx=fitness(xdec);%��Ӧ��//�������ֵ
    fxp=fx/sum(fx);%ѡ�����
    fxa(1)=fxp(1);%�ۼƸ��ʵõ���һ����������
    for j=2:NP
        fxa(j)=fxa(j-1)+fxp(j);
    end
    %��ʼѡ����
    sat=rand();
    for k=1:NP
        if sat<=fxa(k)
            father=k;
            break;
        end
    end
    %���ѡȡĸ��
    mother=ceil(rand()*NP);
    nx=x;
    %���㽻��
    cutp=ceil(rand()*L);
    r1=rand();
    if r1<=pc
        nx(i,1:cutp)=x(father,1:cutp);
        nx(i,cutp+1:L)=x(mother,cutp+1:L);
        r2=rand();%�Ƿ����
        if r2
            cum=ceil(rand()*L);
            nx(i,cum)=~nx(i,cum);
        end
    end
    x=nx;
    for i=1:NP
        xdec(i)=dec(a,b,x(i,:),L);
    end
    %ѡ��Ϻõ��Ӵ�
    fv=-inf;
    for i=1:NP
        fitx=fitness(dec(a,b,x(i,:),L));
        if fitx>fv
            fv=fitx;
            xv=dec(a,b,x(i,:),L);
        end
    end
end
%��Ⱥ��ʼ������
function t=Initial(L,NP)
t=zeros(NP,L);
for i=1:NP
    for j=1:L
        temp=rand();
        t(i,j)=round(temp);
    end
end
%���뺯�� ������ת����ʮ����
function d=dec(a,b,num,L)
i=L-1:-1:0;
data=sum((2.^i).*num);
d=a+data*(b-a)/(2^L-1);
