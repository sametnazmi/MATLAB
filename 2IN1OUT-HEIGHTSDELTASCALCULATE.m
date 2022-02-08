x1=[-0.5;-0.75;-0.60;-0.5;0.5;-0.3;0.2;0.1];
x2=[0.35;0.85;0.65;0.75;0;-0.2;0.1;-0.1];
d=[0;0;0;0;1;1;1;1;];
w1=0.5;
w2=-0.6;
b=0.5;
M=0.01;
for k=1:1:5000
for i=1:1:8
    
net=w1*x1(i)+w2*x2(i)+b;
y(i)=1/(1+exp(-net));
e(i)=d(i)-y(i);
deltaw1=M*e(i)*y(i)*(1-y(i))*x1(i);
w1yeni=w1+deltaw1;
w1=w1yeni

net=w2*x2(i)+w2*x2(i)+b;
y(i)=1/(1+exp(-net));
e(i)=d(i)-y(i);
deltaw2=M*e(i)*y(i)*(1-y(i))*x2(i);
w2yeni=w2+deltaw2;
w2=w2yeni

deltab=M*e(i)*y(i)*(1-y(i));
byeni=b+deltab;
b=byeni
end
E(k)=e(i)^2.*(1/2)
plot(k,E(k),'r*','LineWidth',1) % cost,step graphic
hold on
end
