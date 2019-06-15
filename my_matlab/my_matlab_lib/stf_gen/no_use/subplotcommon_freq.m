% frame starting x,y,width,height
f=figure('Color',[1 1 1],'Position', FIGURE_POSITION);
%f=figure('Color',[1 1 1],'Position', [20, 100, 800, 400]);

%% actual ploting starting from here
subplot(subrows,subcols,1)

%%%% temp 
y=w_less_delay;
fs = 1/dt;
Nt = length(y);
Nt_fft = 2^nextpow2(Nt);

k = 0:Nt_fft-1;
Xk = fft(y,Nt_fft);

f = (k/Nt_fft)*fs;
df = fs/Nt_fft;
 fn_show_star = round(f_show_star/df)
 fn_show_end = round(f_show_end/df)
%%%% temp

%% initial
if FLAG_kHz==1
    xfactor = 1e-3;
end

% subplot(subrows,subcols,1)
% plot(f(1,fn_show_star:fn_show_end)*xfactor,abs(Xk(1,fn_show_star:fn_show_end)/fs),'r'); hold on;


% subplot(subrows,subcols,1)
plot(f(1,fn_show_star:fn_show_end)*xfactor,abs(Xk(1,fn_show_star:fn_show_end)/fs),'r'); hold on;

if FLAG_ZLIM == 1
% zlim([zlimMin,zlimMax]);
set(gca, 'clim', [zlimMin,zlimMax]);
end


% title and labeling, with their fontsize
title(['frequency specfem'],'FontSize', FONTSIZE_TTTLE);
x_label_text = (['frequency range (kHz)']);
xlabel(x_label_text,'FontSize',FONTSIZE_LABEL)
y_label_text=(['spectrum (abs(y/fs)) ']);
ylabel(y_label_text, 'FontSize',FONTSIZE_LABEL)
% % % % label text (what actually to show)
% % % y_label='';
% % % y_ticknum=6;
% % % for ii=1:y_ticknum
% % %    y_label=[y_label deblank(num2str(round((ii-1)*dt*timeStpLenSimuWD/(y_ticknum-1)*1e6),'%3.0f')) '|'];%*disp_factor_t
% % % end
% % % % tick position regarding the data dimensions (to locate the above label)
% % % indent_y=1;
% % % y_tick_label=[indent_y:round(timeStpLenSimuWD/(y_ticknum-1)):timeStpLenSimuWD+indent_y - round(timeStpLenSimuWD/(y_ticknum-1))];
% % % y_tick_label = [y_tick_label round(timeStpLenSimuWD)]
% % % % include the those things
% % % set(gca,'YTick',y_tick_label);
% % % set(gca,'YTickLabel',y_label,'FontSize',FONTSIZE_TICK);





%  set(gcf, 'PaperUnits', 'centimeters');
%  set(gcf, 'PaperPosition',OUTPUT_POSITION); %x_width=10cm y_width=15cm



% shading flat;
% colormap(bone)
% zlimMin = min(min(damageLongDelayn))
% zlimMax = max(max(damageLongDelayn))
% if FLAG_ZLIM == 1
% % zlim([zlimMin,zlimMax]);
% set(gca, 'clim', [zlimMin,zlimMax]);
% end
% 
% % title and labeling, with their fontsize
% title(['Experimental signals'],'FontSize', FONTSIZE_TTTLE);
% x_label_text = (['Sensor Number']);
% xlabel(x_label_text,'FontSize',FONTSIZE_LABEL)
% y_label_text=(['Time (\mus) ']);
% ylabel(y_label_text, 'FontSize',FONTSIZE_LABEL)
% % label text (what actually to show)
% y_label='';
% y_ticknum=6;
% for ii=1:y_ticknum
%    y_label=[y_label deblank(num2str(round((ii-1)*dt*timeStpLenSimuWD/(y_ticknum-1)*1e6),'%3.0f')) '|'];%*disp_factor_t
% end
% % tick position regarding the data dimensions (to locate the above label)
% indent_y=1;
% y_tick_label=[indent_y:round(timeStpLenSimuWD/(y_ticknum-1)):timeStpLenSimuWD+indent_y - round(timeStpLenSimuWD/(y_ticknum-1))];
% y_tick_label = [y_tick_label round(timeStpLenSimuWD)]
% % include the those things
% set(gca,'YTick',y_tick_label);
% set(gca,'YTickLabel',y_label,'FontSize',FONTSIZE_TICK);
