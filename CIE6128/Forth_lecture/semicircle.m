% Wigner semicirle law : 
% Probability distribution of the eigenvalues of symmetric centered random matrices
% as the limit when the dimension N tends to Infinity.
% (c)KHMOU Youssef,  Random Matrix theory, May, 2014.
N=1000;
%r=sqrt(N);
M=randn(N);
M=0.5*(M'+M); % M^T=M.
L=eig(M);
Nbins=60;
[Y,X]=hist(L,Nbins);
Y=Y/sum(Y);
figure; h=bar(X,Y);
set(h,'FaceColor','none');
hold on;
% Theoretical Probability density function
x=linspace(-max(L)*sqrt(N),max(L)*sqrt(N),500);
r=max(L);
alpha=1.5; % Scalling parameter, it depends on variable Nbins.
f=(2*alpha/(pi*(r^2)))*sqrt((r^2)-((x.^2)));
plot(x,f,'r','LineWidth',2);
axis([min(L)-r max(L)+r 0 max(Y)+max(Y)/4]);
xlabel('\lambda','FontWeight','bold','FontSize',12)
ylabel('PDF(\lambda)','FontWeight','bold','FontSize',12);
title('PDF the  Eigenvalues of centered random symmetric matrix');
Info='$f(\lambda)={2\over{\pi r^{2}}} \sqrt{{r^{2}}-{{\lambda^{2}}}}$'; 
text('Position',[-2*sqrt(N) max(Y)+max(Y)/8],'Interpreter','latex','String',Info,'FontSize',16);