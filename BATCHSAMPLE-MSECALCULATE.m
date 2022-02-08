%% BATCH SAMPLE (MSE'i min yapan b ve w datalarý ve MSE grafiði)MSE:mean square error
% SAMET NAZMÝ ÞAHÝN 91170000188 , HASAN BÝRDANE 91170000189      
w=1;
b=0.5;
Jwdotsum=0;
x=[1;2;3;4;5;6;7;8;9;10;11;12]; %input
d=[1.72;1.90;1.57;1.63;2.13;1.66;2.05;2.23;2.89;3.04;2.72;3.18];%desired
N=12; %number of elements
for z=1:1:1000  %trial number
for i=1:1:12    %mathematical operation cycle
  y(i)=w*x(i)+b; %output
  e(i)=d(i)-y(i);   %error
  J(i)=(1/(2*N))*(e(i)^2); %cost array
  Jwdot(i)=-[e(i)*x(i)];    %
 end
Jwdotsum=(1/1200)*(Jwdot(1)+Jwdot(2)+Jwdot(3)+Jwdot(4)+Jwdot(5)+Jwdot(6)+Jwdot(7)+Jwdot(8)+Jwdot(9)+Jwdot(10)+Jwdot(11)+Jwdot(12)); %dJ/dW
esum=e(1)+e(2)+e(3)+e(4)+e(5)+e(6)+e(7)+e(8)+e(9)+e(10)+e(11)+e(12);
Jsum=J(1)+J(2)+J(3)+J(4)+J(5)+J(6)+J(7)+J(8)+J(9)+J(10)+J(11)+J(12);  %cost value
b=(esum/1200)+b    
w=-Jwdotsum+w
plot(z,Jsum,'r*','LineWidth',1) % cost,step graphic
hold on
end

%% SAMPLE BY SAMPLE (MSE'i min yapan b ve w datalarý ve MSE grafiði)MSE:mean square error
w=1;
b=0.5;
x=[1;2;3;4;5;6;7;8;9;10;11;12]; %input
d=[1.72;1.90;1.57;1.63;2.13;1.66;2.05;2.23;2.89;3.04;2.72;3.18]; %desired
N=12; %number of elements

for i=1:1:12
  y(i)=w*x(i)+b;
  e(i)=d(i)-y(i);
  J(i)=(1/(2*N))*(e(i)^2);
  Jwdot=(0.01)*[e(i)*x(i)];  
  b=(e(i)*(0.01))+b
  w=Jwdot+w
 end







    
