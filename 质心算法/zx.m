clear
clc
for i=1:1:10
    for j=1:1:10
        x(j+(i-1)*10)=(i-1)*10;
        y(j+(i-1)*10)=(j-1)*10;
    end
end
figure
plot(x,y,'.')
hold on
axis([0 100 0 100])
xy=[x;y];
hold on
xm=90;
ym=90;
n=50;  
for i=1:1:n
   Sx(i)=rand(1,1)*xm;
   Sy(i)=rand(1,1)*ym;
    plot(Sx(i),Sy(i),'r*')
    xlabel('x÷·')
    ylabel('y÷·')
   hold on
end
dm=30; 
m=100; 
for j=1:1:n
    SS=[Sx(j);Sy(j)];
    k=0;
    for i=1:1:m
        d=norm((xy(:,i)-SS),2);
        if d<=dm 
            xx(j,i)=xy(1,i);
            yy(j,i)=xy(2,i);
            k=k+1;
        else
            xx(j,i)=0;
            yy(j,i)=0;
        end
    end
    if k~=0
        cent(:,j)=[sum(xx(j,:));sum(yy(j,:))]/k;
    else
        cent(:,j)=0;
    end
    plot(cent(1,j),cent(2,j),'o') 
    hold on
    plot([cent(1,j) Sx(j)],[cent(2,j) Sy(j)],'R') 
    title('Centroid');
    hold on
    MM=[cent(1,j);cent(2,j)];
    e(j)=norm((MM-SS),2)/dm;
end
figure
axis([0 n 0 1])
   j=1:1:n
      plot(j,e(j) ,'-r.')
   hold on
   title('Centroid');
   E=sum(e)/n;