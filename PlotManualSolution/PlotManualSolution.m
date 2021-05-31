clear all
close all
clc
t=9;
x=1;
while(abs(A(t,x))>(10^(-8)))
    x=x+1;
end
ax=0.1;
at=0.00001;
N=floor(x/ax);
M=floor(t/at);
u=zeros(M+1,N+1);
e=at/ax;
u(1,1)=sin(0);
for i=1:M;
    u(i+1,1)=sin((i+1)*at);
    for k=2:N;
        a=u(i,k);
        b=u(i,k+1);
        c=u(i,k);
        d=u(i,k-1);
        u(i+1,k)=a+e*(b-2*c+d);
    end
    u(i+1,N+1)=B(t,(N+1)*ax);
end
L=0;
for nn=1:N+1;
    YY(nn)=u(i+1,nn);
    xx(nn)=L;
    L=L+ax;
end
plot(xx,YY,'color','black')
hold on
L=0;
for nn=1:N+1;
    YY(nn)=0;
    xx(nn)=L;
    L=L+ax;
end
plot(xx,YY,'color','red')
hold on
L=0;
for nn=1:N+1;
    YY(nn)=A(t,L);
    xx(nn)=L;
    L=L+ax;
end
plot(xx,YY,'color','blue')