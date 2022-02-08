
%SAMET NAZM� �AH�N          91170000188

clear all
close all
clc
ax=3;                 %Limit value of X Random Variable
ay=5;                 %Limit value of Y Random Variable
ux=0;                 %Mean of X
uy=0;                 %Mean of Y
varx=sqrt(ax);        %Variance of X
vary=sqrt(ay);        %Variance of Y  
x=[0 0 -3 -2 -1 0 1 2 3 0 0]; y=[-5 -4 -3 -2 -1 0 1 2 3 4 5];       %R.V'ler

n=1:1:11;                         %Ka��nc� eleman i�leme girecek (1-2-3-4)
pdfx(n)=(1/(2*pi*varx^2)^0.5)*exp(-(((x(n)-ux).^2)/(2*varx^2))); %Gauss Olas�l�klar
pdfy(n)=(1/(2*pi*vary^2)^0.5)*exp(-(((y(n)-uy).^2)/(2*vary^2))); %Gauss Olas�l�klar
stem(x,pdfx)                      %Discrete �izdirme komutu 1'den 4'e kadar
figure
stem(y,pdfy)                    %Discrete �izdirme komutu 4'den 8'e kadar
hold on
%xlim([0 8])
%ylim([0 0.3])
%%
s=fliplr(n);
%n vekt�r�n� ters �evirme (4-3-2-1)                    
k5=(x(n).*y(n)).*(n)*pdfx(n)'*pdfy(n);     %�lk 5 de�erin konvulasyonu   

k6=(x(n).*y(n)).*(s)*pdfx(n)'*pdfy(n);     %Son 5 de�erin konvulasonu
stem(n,k5)                      %Discrete �izdirme komutu 1'den 4'e kadar
hold on
stem(2*n-s,k6)                    %Discrete �izdirme komutu 4'den 8'e kadar
hold on

