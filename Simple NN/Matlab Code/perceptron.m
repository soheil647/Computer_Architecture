% Perceptron rule
clear;
figure;
A = importdata('data.xlsx');
target=A(:,3)';	% Target vector
p(1,:)=A(:,1);
p(2,:)=A(:,2);	% p is learning sample
scatter(p(1,1:100),p(2,1:100),'.');
hold on;
scatter(p(1,101:200),p(2,101:200),'+');
max_epochs=100;
eta=0.75;
now=2; % Number of weights
not=200; % Number of samples
for j=1:now
    w(j)=0;
end
bias=0;
for epoch=1:max_epochs
    temp=0;
    for i=1:not
        net= w*p(:,i) +bias;
        if((sign(net))~=target(i))
            temp=temp+1;
            bias=bias+target(i)*eta;	% Update bias
            for j=1:now
                w(j)=w(j)+(target(i)*p(j,i))*eta; % Update weights
            end
        end
        
    end
    if(temp==0) % if no weight changes
        break;
    end
end
xx=[-2.5 2.5];
yy=(-xx*w(1)-bias)/w(2);
line(xx,yy);