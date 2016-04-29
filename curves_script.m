Pnosignal = makedist('Normal','mu',-75.05,'sigma',1.99);
Psignal = makedist('Normal','mu',-56.44,'sigma',6.87);
threshold = -65 ; 
Pfa = 1-cdf(Pnosignal,threshold); 
Pd = 1-cdf(Psignal,threshold);
Pmd=1-Pd;
display(Pfa);
display(Pd);
display(Pmd);
figure(1);
Level = -90:1:-30;
plot(Level,Pnosignal.pdf(Level));
hold on
plot(Level,Psignal.pdf(Level),'m');
title('Detection Probability')
hold on
Y =0:0.1:0.3;
X = threshold * ones(size(Y));
plot(X, Y,'r--')
legend('No signal','Signal','threshold')
xlabel ('Level (dB)')

Pfa_ROC = 1-cdf(Pnosignal,Level);
Pd_ROC = 1 -cdf(Psignal,Level); 

figure(2);
plot(Pfa_ROC,Pd_ROC);
title('ROC')
ylabel ('Probability of Detection')
xlabel ('Probability of False Alarm')