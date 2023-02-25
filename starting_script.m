%% Assignment 6: Spring-Mass Walker
clear all, close all, clc
sim('Assignment6_SimulinkModel_EdizFeritKula',10)

%% Forward Speed Calculations
max_speed = max(dx.Data);
avg_speed = mean(dx.Data);

%% Energy Calculation
KE = 1/2*m*(dx.Data.^2+dy.Data.^2);
GPE = m*g*y.Data;
SPE1 = zeros(size(l1.Data));
SPE2 = SPE1;
for i=1:length(l1.Data)
    if(l1.Data(i)<=l0)
        SPE1(i) = 1/2*kk*(l0-l1.Data(i)).^2;
    end
    if(l2.Data(i)<=l0)
        SPE2(i) = 1/2*kk*(l0-l2.Data(i)).^2;
    end
end
SPE = SPE1 + SPE2;
PE = GPE + SPE;
ME = KE + PE;

figure
plot(dx.Time,KE,"linewidth",1.5)
hold on, grid on
plot(dx.Time,PE,"linewidth",1.5)
plot(dx.Time,ME,"linewidth",3)
xlabel("Time (seconds)")
ylabel("Energy (joules)")
legend("KE","PE","ME")

%% Energy in one Period
dKE = KE - mean(KE);
dPE = PE - mean(PE);
figure
plot(dx.Time,dKE,"linewidth",1.5)
hold on, grid on
plot(dx.Time,dPE,"linewidth",1.5)
plot([0 0.5], [0 0], "k--", "linewidth", 2)
xlabel("Time (seconds)")
ylabel("Energy (joules)")
legend("dKE","dPE","Mean")
xlim([0 0.5])

%% Combined plots: trajectory - forces in x - forces in y
figure
subplot(3,1,1)
plot(x.Data,y.Data, "color", "b")
grid on
xlabel("x (m)")
ylabel("y (m)")

subplot(3,1,2)
plot(Fsx1, "color", "r", "linewidth", 1.2)
grid on, hold on
plot(Fsx2, "color", "k", "linewidth", 1.2)
title("")
ylabel('F_{horizontal} (N)')

subplot(3,1,3)
plot(Fsy1, "color", "r")
grid on, hold on
plot(Fsy2, "color", "k")
title("")
ylabel("F_{vertical} (N)")

%% forward speed
figure
plot(dx, "color", "r")
grid on, hold on
xlabel("Time (s)")
ylabel("Forward Speed (m/s)")
title("")

%% horizontal spring force
figure
plot(Fsx, "color", "b")
grid on, hold on
plot([0 10],[0 0])
xlabel("Time (s)")
ylabel("Horizontal Spring Force (N)")
title("")

%% vertical spring force
figure
plot(Fsy, "color", "r")
grid on, hold on
xlabel("Time (s)")
ylabel("Vertical Spring Force (N)")
ylim([0 1700])
title("")

%% limit cycle
figure
plot(y.Data, dy.Data)
grid on, hold on
plot(y.Data(end-1000:end), dy.Data(end-1000:end), "color", "r", "linewidth", 1.5)
xlabel("y (m)")
ylabel("dy (m/s)")
ylim([-0.8 0.8])
legend("phase","limit cycle")
