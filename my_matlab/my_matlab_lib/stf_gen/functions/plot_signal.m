% frame starting x,y,width,height
fig=figure('Color',[1 1 1],'Position', FIGURE_POSITION);

%% actual ploting starting from here
subplot(subrows,subcols,1)

%% initial
if FLAG_mus==1
    xfactor = 1e6;
end

plot(t * xfactor,y,'r'); hold on;

if FLAG_ZLIM == 1
set(gca, 'clim', [zlimMin,zlimMax]);
end

title(['time domain signal'],'FontSize', FONTSIZE_TTTLE);
x_label_text = (['time (\mus)']);
xlabel(x_label_text,'FontSize',FONTSIZE_LABEL)
y_label_text=(['amplitude ']);
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
