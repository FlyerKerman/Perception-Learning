w= ([1,1,1])';
m=1000;
r=0.01;
N=60;
w_mem=zeros(3,m);
%data1=mvnrnd([10 10],[1 0;0 1],N);
%data0=mvnrnd([5 5],[1 0;0 1],N);
%data=zeros(2*N,2);
%Labels1=zeros(2*N,1);
%for i=1:N
%    data(2*i-1,:)=data1(i,:);
%    data(2*i,:)=data0(i,:);
%    Labels1(2*i-1)=1;
%    Labels1(2*i)=-1;
%end
data=[data1;data0];
Labels1=[ones(N,1);-ones(N,1)];
%t=unidrnd(140,1,m
[a,b]=size(data);
DATA=[data,ones(2*N,1)];
for i=1:m
    j=mod(i,a)+1;
    z=DATA(j,:);
    h=w(1:2,1);
    if (w(1)+w(2)+w(3))>10
        w=w/norm(w);
    end
    w=[h',w(3,1)]';
    yk=w'*DATA(j,:)'*Labels1(j);
    w_mem(:,i)=w;
    if yk<=0
        w=w+r*DATA(j,:)'*Labels1(j);
        %w=w+DATA(j,:)'*Labels1(j)/sqrt(DATA(j,:)*DATA(j,:)');
    end
    
    %w = w+0.5*r*(dataset(t(i),:)'-dataset(t(i),:)'*sign(w'*dataset(t(i),:)'));
    %w = w+0.5*r*dataset(t(i),:)'*(1-sign(w'*dataset(t(i),:)'*Labels(t(i))));
end
y=-1*(w(1)*x1+w(3))/w(2);
figure(1);
hold on
plot(x1,y,'k');

scatter(data1(:,1),data1(:,2),'xr');
scatter(data0(:,1),data0(:,2),'ob');
figure(2);
hold on
plot3(w_mem(1,:)',w_mem(2,:)',w_mem(3,:)','-b.','markersize',10);
grid on
text(w_mem(1,1),w_mem(2,1),w_mem(3,1),'起点');
text(w_mem(1,m),w_mem(2,m),w_mem(3,m),'终点');
