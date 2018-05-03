w= ([1,1,1])';
%t=unidrnd(140,1,m);
r=0.01;
m=1000;
w_mem=zeros(3,m);%用来存放每次迭代后权向量的取值
for i=1:m
    j=mod(i,140)+1;
    yk=w'*dataset(j,:)'*Labels(j);
    w_mem(:,i)=w;
    if yk<=0
        w=w+r*dataset(j,:)'*Labels(j);
        %w=w+dataset(j,:)'*Labels(j)/sqrt(dataset(j,:)*dataset(j,:)');
    end
    
    %w = w+0.5*r*(dataset(t(i),:)'-dataset(t(i),:)'*sign(w'*dataset(t(i),:)'));
    %w = w+0.5*r*dataset(t(i),:)'*(1-sign(w'*dataset(t(i),:)'*Labels(t(i))));
end
y=-1*(w(1)*x+w(3))/w(2);
figure(1);
hold on
plot(x,y,'k');
for i=1:140    %显示所有数据点
    if Labels(i)>0
        scatter(dataset(i,1),dataset(i,2),'xr');
    else
        scatter(dataset(i,1),dataset(i,2),'ob');
    end
end
figure(2);
hold on
plot3(w_mem(1,:)',w_mem(2,:)',w_mem(3,:)','-b.','markersize',10);  %用三维图显示权向量的调整过程
grid on
text(w_mem(1,1),w_mem(2,1),w_mem(3,1),'起点');
text(w_mem(1,m),w_mem(2,m),w_mem(3,m),'终点');
