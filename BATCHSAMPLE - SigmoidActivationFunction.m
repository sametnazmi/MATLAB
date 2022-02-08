%% Sigmoid Activation Function Batch Training
x1=[0;1;1;0];
x2=[0;1;0;1];
d=[0;0;1;1];
w1=[rand(1),rand(1),rand(1)];
w2=[rand(1),rand(1),rand(1)];
w3=[rand(1),rand(1),rand(1)];
b=[1,1,1];
B=1;
n=0.01;

for k=1:1:100000

for i=1:1:4
   
net1=x1(i)*w1(1)+b(1)+x2(i)*w2(1);
net2=x1(i)*w1(2)+b(2)+x2(i)*w2(2);
net3=x1(i)*w1(2)+b(3)+x2(i)*w2(3);

fnet1=1/(1+exp(-net1));
fnet2=1/(1+exp(-net2));   
fnet3=1/(1+exp(-net3));

y1=fnet1;
y2=fnet2;
y3=fnet3;
   
net=y1*w3(1)+y2*w3(2)+y3*w3(3)+B;
y(i)=1/(1+exp(-net));
e(i)=d(i)-y(i);

E=1/2*(e(i)^2);

deltaw11=e(i)*y(i)*(1-y(i))*w3(1)*y1*(1-y1)*x1(1);
deltaw12=e(i)*y(i)*(1-y(i))*w3(2)*y2*(1-y2)*x1(1);
deltaw13=e(i)*y(i)*(1-y(i))*w3(3)*y3*(1-y3)*x1(1);

wyeni11=w1(1)+n*deltaw11;
w1(1)=wyeni11;

wyeni12=w1(2)+n*deltaw12;
w1(2)=wyeni12;

wyeni13=w1(3)+n*deltaw13;
w1(3)=wyeni13;

deltaw21=e(i)*y(i)*(1-y(i))*w3(1)*y1*(1-y1)*x2(1);
deltaw22=e(i)*y(i)*(1-y(i))*w3(2)*y2*(1-y2)*x2(1);
deltaw23=e(i)*y(i)*(1-y(i))*w3(3)*y3*(1-y3)*x2(1);

wyeni21=w2(1)+n*deltaw21;
w2(1)=wyeni21;

wyeni22=w2(2)+n*deltaw22;
w2(2)=wyeni22;

wyeni23=w2(3)+n*deltaw23;
w2(3)=wyeni23;

deltaw31=e(i)*y(i)*(1-y(i))*y1;
deltaw32=e(i)*y(i)*(1-y(i))*y2;
deltaw33=e(i)*y(i)*(1-y(i))*y3;

wyeni31=w3(1)+n*deltaw31;
w3(1)=wyeni31;

wyeni32=w3(2)+n*deltaw32;
w3(2)=wyeni32;

wyeni33=w3(3)+n*deltaw33;
w3(3)=wyeni33;

deltaB=e(i)*y(i)*(1-y(i));
deltab1=e(i)*y(i)*(1-y(i))*w3(1)*y1*(1-y1);
deltab2=e(i)*y(i)*(1-y(i))*w3(2)*y2*(1-y2);
deltab3=e(i)*y(i)*(1-y(i))*w3(3)*y3*(1-y3);

Byeni=B+n*deltaB;
B=Byeni;

byeni1=b(1)+n*deltab1;
b(1)=byeni1;

byeni2=b(2)+n*deltab2;
b(2)=byeni2;

byeni3=b(3)+n*deltab3;
b(3)=byeni3;
end

end