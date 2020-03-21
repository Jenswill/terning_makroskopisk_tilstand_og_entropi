close all
clear all
clc

a = importdata('forsog-4-data.xlsx');
rawdata = getfield(a,'data');

data=rawdata(1:18,:);

X = data(2:size(data,1),1);
Y1= data(2:size(data,1),8);
Y2 = data(2:size(data,1),15);

plot(X,Y1)
hold on
ylabel('makroskopisk tilstand');
xlabel('antal slag');
title('makroskopisk tilstand over antal slag')
plot(X,Y2)
legend(['spiller A'],['spiller B'])
hold off
%%

for i = 2:size(data,1)
    MY1(i) = log(factorial(36)/(factorial(data(i,8))*factorial(36-data(i,8))));
    MY2(i) = log(factorial(36)/(factorial(data(i,15))*factorial(36-data(i,15))));
end

%MY1 = MY1(MY1~=0);
% MY2 = MY2(MY2~=0);
MY1 = MY1(2:end);
MY2 = MY2(2:end);

plot(X,MY1)
hold on
ylabel('Entropi');
xlabel('antal slag');
title('Entropi over antal slag')
plot(X,MY2)
legend(['spiller A'],['spiller B'])
hold off