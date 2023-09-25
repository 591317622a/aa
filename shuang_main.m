%% 考虑四种典型日下的双层规划
clc
clear
warning off
close all
tic
%% 设置参数
canshu;

%% 初始值
%% 上层
%初始折现成本+投资成本+购售电成本和燃料成本 +运维成本
%LB为初始折现成本+投资成本+购售电成本+燃料成本 +运维成本
%yita购售电成本+燃料成本+运维成本
[yita,LB,ee_bat_int, p_wt_int,p_pv_int,p_g_int] = UP_1(rp,rbat,rPV,rWT,rG);
%% 下层
%UB为上层（折现成本+投资成本）+下层（购售电成本+燃料成本 +运维成本）
[p_wt,p_pv,p_load,x,UB,p_g,p_ch,p_dis,p_buy,p_sell] = DOWN_(ee_bat_int,p_wt_int,p_pv_int,p_g_int,LB,yita);
%UB1为初始上层（折现成本+投资成本）+下层（购售电成本+燃料成本 +运维成本）
UB1 = UB;
%% p为上层（购售电成本+燃料成本 +运维成本）与下层（购售电成本+燃料成本 +运维成本）差
p(1)= UB - LB;
e=100;%收敛度
%% 开始迭代
for k=1:Imax
    %% 上层 在已知光伏，风电，负荷出力（由下层传递到上层）计算初始折现成本+投资成本+购售电成本和燃料成本 +运维成本（求最小值）
    [yita,LB,ee_bat_int,p_wt_int,p_pv_int,p_g_int] = UP_2(p_wt,p_pv,p_load);%MP迭代
    %% 下层 已知（折现成本+投资成本，由上层传递到下层）+计算（购售电成本+燃料成本 +运维成本）
    [p_wt,p_pv,p_load,x,UB,p_g,p_ch,p_dis,p_buy,p_sell] = DOWN_(ee_bat_int,p_wt_int,p_pv_int,p_g_int,LB,yita);%SP迭代
    UB = min(UB1,UB);%取UB较小值
    %% p为上层（购售电成本+燃料成本 +运维成本）与下层（购售电成本+燃料成本 +运维成本）差
    p(k+1) = UB-LB;
    %判断是否收敛
    if abs(p(k+1))<=e
        break
    end
end
%% 输出结果
%储能,购电,风电,光伏,负荷,燃机
p_wt
p_pv
p_load
p_g
p_ch
p_dis
p_buy
p_sell
 toc
 
 %% 画图
 %% 迭代
 figure;
 plot(p,'-*')
 xlabel('迭代次数')
 ylabel('UB-LB')
 title('迭代曲线')
 
 %% 典型日1
figure
hold on
positive=[p_wt(:,1),p_pv(:,1),p_g(:,1),p_dis(:,1),p_buy(:,1)];
negative=[-p_ch(:,1),-p_sell(:,1)];
bar(positive,'stack')
bar(negative,'stack')
plot(p_load(:,1),'-d')
ylabel('功率/kw')
xlabel('时间/小时')
title('典型日1调度曲线')
legend('光伏','风电','燃机','电池放电','购电','电池充电','售电','居民负荷')
 
 
  %% 典型日2
figure
hold on
positive=[p_wt(:,2),p_pv(:,2),p_g(:,2),p_dis(:,2),p_buy(:,2)];
negative=[-p_ch(:,2),-p_sell(:,2)];
bar(positive,'stack')
bar(negative,'stack')
plot(p_load(:,2),'-d')
ylabel('功率/kw')
xlabel('时间/小时')
title('典型日2调度曲线')
legend('光伏','风电','燃机','电池放电','购电','电池充电','售电','居民负荷')
  
  
 
 
 
  %% 典型日3
 figure
hold on
positive=[p_wt(:,3),p_pv(:,3),p_g(:,3),p_dis(:,3),p_buy(:,3)];
negative=[-p_ch(:,3),-p_sell(:,3)];
bar(positive,'stack')
bar(negative,'stack')
plot(p_load(:,3),'-d')
ylabel('功率/kw')
xlabel('时间/小时')
title('典型日3调度曲线')
legend('光伏','风电','燃机','电池放电','购电','电池充电','售电','居民负荷')
  
 
 
  %% 典型日4
 figure
hold on
positive=[p_wt(:,4),p_pv(:,4),p_g(:,4),p_dis(:,4),p_buy(:,4)];
negative=[-p_ch(:,4),-p_sell(:,4)];
bar(positive,'stack')
bar(negative,'stack')
plot(p_load(:,4),'-d')
ylabel('功率/kw')
xlabel('时间/小时')
title('典型日4调度曲线')
legend('光伏','风电','燃机','电池放电','购电','电池充电','售电','居民负荷')



 
 
 
 
 
 
 
 