%exemplo 1.11, pag 53
%SYLVIELLY,S.,Sousa, em 16.mai.2021
%e-mail: sylviellysousa@gmail.com

printf("\t insira um valor entre -50000 e 0 para Hm na funcao: interpolar(-Hm) \n");
printf("\t /*exemplo: interpolar(-30000)*/");

function [bx] = interpolar(hx);         

%dados da questao
g = 0.2;
Am = 2e-4; 
Ag1 = 2e-4;
Ag2 = 4e-4;
Bm = 1;
u0 = pi*4e-7;
Hm1 = 4*10^4;
Hm2 = 2.16*10^4;
N = 2;

printf("\t item a) \n");

%calculo do comprimento do ima
l_ima = g*(Am/Ag1)*(Bm/-(u0*Hm1));
printf("\t \t Comprimento do ima:  %d [cm] \n",abs(l_ima));

%dados grafico questao
H = [-49000, -40000, 0];
B = [0, 1, 1.24];

bx = interp1(H,B,hx,'linear');
h = min(H):max(H);
b = interp1(H,B,h,'pchip');

%para Ag = 2 cm^2
H1 = [-49000, -40000, 0];            
B1 = [1.24, 1, 0];

%para Ag = 4 cm^2
H2 = [-24500, -21600, 0];             
B2 = [1.24, 1.08, 0];

%reta de carga
printf("\t item c) \n");
Bm1 = -u0*(Ag1/Am)*(l_ima/g)*Hm1;
printf("\t \t Inducao Magnetica para A_g = 2cm² =>  B_m = %d [T] \n",Bm1);
Bm2 = -u0*(Ag2/Am)*(l_ima/g)*Hm2;
printf("\t \t Inducao Magnetica para A_g = 4cm² =>  B_m = %d [T] \n",Bm2);

%plotagem do grafico
plot(h,b,'LineWidth',5,'b');                
grid on
title('Gráfico Hm x Bm para AlNiCo 5','FontName','Times','FontSize',20);
xlabel( 'Campo Magnético - H_m [A.e/m]','FontName','Times','FontSize',14');
ylabel ( 'Indução Magnética - B_m [T]','FontName','Times','FontSize',14);
hold on

%plotagem da reta de carga
plot(H1,B1,'Linestyle','--','LineWidth',2,'r')       %para Ag = 2 cm^2
hold on

plot(H2,B2,'Linestyle','--','LineWidth',2,'k')       %para Ag = 4 cm^2
hold on

%legenda do grafico
h = legend ({"Curva de Magnetização", "Ag = 2cm²","Ag = 4cm²"},"location", "northeastoutside");