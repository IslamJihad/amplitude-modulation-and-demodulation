t= 0:0.001:2;
st=1*(1 + 0.25 * cos(2 * pi * 1 * t)).* cos(2 * pi * 25 * t);
%plot(t,st);

absf=(1 + 0.25 * cos(2 * pi * 1 * t));
env= abs(absf);
%plot(t,absf);


taw= 0.04:0.01:1;

Y=zeros(1,2001);
arr_sum=zeros(1,97);
To=0;
b=0;
for i = 1:1:97
    
    for j=1:1:2001
        if st(j)< (b*exp(-1*((t(j)-To)/taw(i))))
            Y(j)= (b*exp(-1*((t(j)-To)/taw(i))));
        else
            Y(j)=st(j);
            
            if st(j)== env(j)
            b=st(j);
            To=t(j);
            end
          
        end
        
    end
        
    sum=0;
    for x= 1:1:2001
        sum= sum + (env(x) - Y(x))^2;
    end
    arr_sum(i)=sum/2001;
    To=0;
    b=0;
    
end

m=min(arr_sum);

for i= 1:1:97
    if m==arr_sum(i)
        index=i;
    end
end

disp(taw(index));

subplot(2,1,1);
plot(taw, arr_sum);
title('D VS taw');
xlabel('taw');
ylabel('mean square error D');
grid on;





arr=zeros(1,97);
Yn=zeros(1,2001);
To=0;
b=0;
for i = 1:1:97
    
    for j=1:1:2001
        if st(j)< (b*exp(-1*((t(j)-To)/taw(index))))
            Yn(j)= (b*exp(-1*((t(j)-To)/taw(index))));
        else
            Yn(j)=st(j);
            
            if st(j)== env(j)
            b=st(j);
            To=t(j);
            end
        end
    end
        
    To=0;
    b=0;
end

subplot(2,1,2);
plot(t,Yn,t,st);
%plot(t,Yn,t,st,t,Y);
title('Y(t) to the min taw');
xlabel('time');
ylabel('Y(t)');
grid on;


