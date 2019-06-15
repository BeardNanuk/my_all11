clear;
close all
clc

format long

Dom_freq=200000;
%fc1=50000;
dt=0.00000005;
fs=1/dt;
maxt=2e-4;
t=dt:dt:maxt;

L=length(t)
n=0:L-1;

peaks=5;
N=L;
Dom_freq_num=round((Dom_freq/fs)*N);
fftshifted_center_num1=round(N/2)+1-Dom_freq_num;
fftshifted_center_num2=round(N/2)+1+Dom_freq_num;


k=0:N-1;
B=2*Dom_freq/sqrt(3)/peaks;

fmax=Dom_freq+B;
fmin=Dom_freq-B;
%%

dfpulselen = (5/fmax);  % Pulse length (seconds)

df(1:N) = 0;
 
dfl = ceil(dfpulselen/dt);
 
win = hann(dfl)';
df(1:dfl) = sin(2*pi*Dom_freq*dt*(0:(dfl-1))).*win;
    df_samp = 1/((N*dt));
    F_samp = (-1/(2*dt):df_samp:1/(2*dt)-df_samp) ;
num_fmax=ceil(fmax/df_samp);num_fmin=floor(fmin/df_samp);


%   plot((1:dfl)*dt,df,'r');

%%
% Np=2.5;


%y=1*(heaviside(t)-heaviside(t-5/fc)).*(1-cos(2.*pi.*fc.*t./5)).*exp(i*2.*pi.*fc.*t);
% y=1/4*(heaviside(t)-heaviside(t-Np/fc)).*(1-cos(2.*pi.*fc.*t./Np)).*sin(2.*pi.*fc.*t);


X1=fft(df,N)/fs;
absX1=abs(X1);
KK=max(absX1);
X1_fftshift=fftshift(X1);
abs_X1_fftshift=abs(X1_fftshift);
ifft_X1=ifft(X1);
% ifft_X1_fftshift=ifft(X1_fftshift);
ifft_X1_ifftshift_fftshift=ifft(ifftshift(X1_fftshift));


bandwidth_grid=24;bandwidth_grid_half=round(bandwidth_grid/2);
cut1_star=fftshifted_center_num1-bandwidth_grid_half;
cut1_end=fftshifted_center_num1+bandwidth_grid_half;
cut2_star=fftshifted_center_num2-bandwidth_grid_half;
cut2_end=fftshifted_center_num2+bandwidth_grid_half;


X2_fftshift=X1_fftshift;X2_fftshift(1:cut1_star)=0;
X2_fftshift(cut1_end:cut2_star)=0;X2_fftshift(cut2_end:N)=0;
ifft_X2_ifftshift_fftshift=ifft(ifftshift(X2_fftshift));



plot_range_half=70;
figure('Position', [100,100,1800,500]);

set(gcf, 'Color', [1,1,1]);
subplot(2,3,1);
plot(t,df,'b');
title(['time original']);
subplot(2,3,2);
stem(abs(X1_fftshift));
xlim([round(N/2)+1-plot_range_half,round(N/2)+1+plot_range_half]);
title(['fft with fftshift (take absolute)']);
subplot(2,3,3);
plot(t,ifft_X1_ifftshift_fftshift,'b');
title(['ifft ifftshift fftshift fft original']);
subplot(2,3,5);
stem(abs(X2_fftshift));
xlim([round(N/2)+1-plot_range_half,round(N/2)+1+plot_range_half]);

title(['frequency domain cut (take absolute)']);
subplot(2,3,6);
plot(t,ifft_X2_ifftshift_fftshift,'b');
title(['ifft ifftshift cut fftshift fft']);
% absX2=abs(X2);


%%



%%
% % % % w=2*pi*k/N;
% % % % F=(w/(2*pi))*fs;
% % % % %%
% % % % figure 
% % % % %plot(F/1000,abs(X1));
% % % % stem(F/1000,absX1*fs,'r','linewidth',1.5);hold on;
% % % % plot(F(num_fmin)/1000,absX1(num_fmin)*fs,'*','linewidth',1.5);hold on;
% % % % plot(F(num_fmax)/1000,absX1(num_fmax)*fs,'*','linewidth',1.5);hold on;
% % % % 
% % % % 
% % % % % plot(F_samp/1000,abs_X1_fftshift*fs,'b','linewidth',1.5);
% % % % % plot(F/1000,abs_X1_fftshift*fs,'b','linewidth',1.5);hold on; 
% % % % %plot(fc-1/2*Bdth,F(I12(2)),'r*');hold on; 
% % % % %plot(fc+1/2*Bdth,F(I12(2)),'ro');hold on; 
% % % % % plot(Fbx,Fby,'ro');
% % % % %title('Input signal')
% % % % axis([0,1000,0,max(absX1)*fs]);
% % % % xlabel('Frequency (kHz)','FontSize',14)
% % % % ylabel('Magnitude','FontSize',14)

