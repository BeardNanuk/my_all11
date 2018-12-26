#!/usr/bin/env python


## /scratch/gpfs/jiazeh/inversion_test2/zplot_one_signal.py
## plot one signal from adj, obs, and syn 

### created on Wed Dec 12 10:51:11 EST 2018
### created by Jiaze He 


if flag_plot_spectrum is 1:

   fig, (ax2,ax3,ax4,ax5) = plt.subplots(nrows=4)
   
#    ax0.plot(xf_obs/1000,np.abs(yf_obs),'-k')
#    ax0.set_title('observed - ' + str(obs_name) + ' trace  ' + str(trace_num) + '- absolute_value')
#    ax0.set_xlabel('frequency (kHz)')
   
#    ax1.plot(xf_Newobs/1000,np.abs(yf_Newobs),'-k')
#    ax1.set_title('observed w resampling - ' + str(obs_name) + ' trace  ' + str(trace_num) + '- absolute_value')
#    ax1.set_xlabel('frequency (kHz)')
   
   ax2.plot(t_total_obs[t_star_showobs:t_end_showobs],syn_data[t_star_showobs:t_end_showobs,receiver_num],'g-')
   ax2.set_title('synthetic -source '+str(source_num)+' trace ' + str(receiver_num))
   ax2.set_xlabel(r'time ($\mu s$)')

   ax3.plot(t_total_obs[t_star_showobs:t_end_showobs],obs_data[t_star_showobs:t_end_showobs,receiver_num],'m-')
   ax3.set_title('observed -source '+str(source_num)+' trace ' + str(receiver_num))
   ax3.set_xlabel(r'time ($\mu s$)')

   ax4.plot(t_total_obs[t_star_showobs:t_end_showobs],adj_data[t_star_showobs:t_end_showobs,receiver_num],'b-')
   ax4.set_title('adjoint -source '+str(source_num)+' trace ' + str(receiver_num))
   ax4.set_xlabel(r'time ($\mu s$)')
   
   ax5.plot(t_total_obs[t_star_showobs:t_end_showobs],syn_data[t_star_showobs:t_end_showobs,receiver_num],'g-',label='syn')
   ax5.plot(t_total_obs[t_star_showobs:t_end_showobs],obs_data[t_star_showobs:t_end_showobs,receiver_num],'m-',label='obs')
   ax5.plot(t_total_obs[t_star_showobs:t_end_showobs],adj_data[t_star_showobs:t_end_showobs,receiver_num],'b-',label='adj')
   ax5.set_title('together - iter num' + str(iter_num) + ' , source '+str(source_num)+' trace ' + str(receiver_num))
   ax5.set_xlabel(r'time ($\mu s$)')
 
   plt.tight_layout(rect=[0, 0, 1.5, 1.3])
   
   plt.savefig(save_signals_seisflows_png,format='png', dpi=150, bbox_inches='tight')
   #plt.show()
   plt.close(fig)


