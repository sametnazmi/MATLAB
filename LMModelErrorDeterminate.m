clc;clear;close all;


M=3; 
yk=[0.6 0.3 0.9];
xk=[0.1 0.3 0.6];
gk=[2 2 2];
yk2=[0.6 0.3 0.9];
xk2=[0.1 0.3 0.6];
gk2=[2 2 2];
MM=100; product=2; divide=1.5;
data=xlsread('data.xlsx');


 

x1=data(:,1);
x2=data(:,2);
y=data(:,3); 
X1=data(:,1);
x1=X1(1:200);
X2=data(:,2);
x2=X2(1:200);
Y=data(:,3);
y=Y(1:200);  


for k=1:length(x1)
    recursive=0;
    errorr=10;
while errorr>0.010 && recursive<1000
   
    for i=1:M
        z1(i)=gaussmf(x1(k),[gk(i),xk(i)]);
        z2(i)=gaussmf(x2(k),[gk(i),xk(i)]);
         z(i)=z1(i)*z2(i);
        
    end

     b=sum(z);
     a=0;
    for i=1:M
       a=a+(yk(i)*z(i));
    end
    f(k)=a/b;

    for i=1:M
        dedp1(i)=(f(k)-y(k))/b*(yk(i)-f(k))*z(i)*2*(x1(k)-xk(i))/(gk(i).^2);
        dedp2(i)=yk(i)-((f(k)-y(k))/b*z(i));
        dedp3(i)=gk(i)-((f(k)-y(k))/b*(yk(i)-f(k))*z(i)*2*((x1(k)-xk(i)).^2)/(gk(i).^3));
        dedp11(i)=(f(k)-y(k))/b*(yk(i)-f(k))*z(i)*2*(x2(k)-xk(i))/(gk(i).^2);
        dedp22(i)=yk(i)-((f(k)-y(k))/b*z(i));
        dedp33(i)=gk(i)-((f(k)-y(k))/b*(yk(i)-f(k))*z(i)*2*((x2(k)-xk(i)).^2)/(gk(i).^3));
    end
    J1=[dedp1;dedp2;dedp3];
    J2=[dedp11;dedp22;dedp33];
    e=f(k)-y(k);
    d1=-pinv(J1'*J1+MM*eye(3))*(J1'*e);
    d2=-pinv(J2'*J2+MM*eye(3))*(J2'*e);
    errorr=0.5*e'*e;
    E=errorr;
    
    xst=xk+d1(1,:);
    yst=yk+d1(2,:);
    sst=gk+d1(3,:);
    xst1=xk2+d2(1,:);
    yst1=yk2+d2(2,:);
    sst1=gk2+d2(3,:);

    for i=1:M
        z1(i)=gaussmf(x1(k),[sst(i),xst(i)]);
        z2(i)=gaussmf(x2(k),[sst1(i),xst1(i)]);
        z(i)=z1(i)*z2(i);
    end
     b=sum(z);
     a=0;
    for i=1:M
       a=a+(yst(i)*z(i));
    end
    f(k)=a/b;

    e1=f(k)-y(k);
    
    EE=0.5*e1'*e1;
    
    
    if EE>E
        EEE=MM/divide;
         xk=xk+d1(1,:);
         yk=yk+d1(2,:);
         gk=gk+d1(3,:);
         xk2=xk2+d2(1,:);
         yk2=yk2+d2(2,:);
         gk2=gk2+d2(3,:);
        errorr=EE;
    elseif EE<E
        EEE=MM*product;
        
    else
        EEE=MM;
        
    end
    MM=EEE;
   
    recursive=recursive+1;
end

end
figure(1)
hold on
grid on
plot (f,'r')
legend('')
figure(2)
hold on
plot(x1,'y')
legend('r')
figure(3)
plot(x2,'g')
hold on
legend('')
figure(4)
hold on
plot(y,'b')
legend('')




  gl=gk;% test 
  xl=xk;
  yl=yk;
  gl2=gk2;% test 
  xl2=xk2;
  yl2=yk2;
  x11=X1(1:250);
  x22=X2(1:250);
  
  y2=Y(1:250);
  for k=1:length(x11)
  for i=1:M
    z1(i)=gaussmf(x11(k),[gl(i),xl(i)]);
    z2(i)=gaussmf(x22(k),[gl2(i),xl2(i)]);
    z(i)=z1(i)*z2(i);
   end
    b=sum(z);
    a=0;
   for i=1:M
    a=a+yl(i)*z(i);
   end
    F(k)=a/b;

  end
figure(5)
plot(F,'m')
  hold on;
  grid on;
  legend('Fuzzy Output')
  figure(6)
hold on
plot(x11,'y')
legend('')
figure(7)
plot(x22,'g')
hold on
legend('')
figure(8)
hold on
plot(y2,'b')
  legend('')
  
  
  
  
  
  
  