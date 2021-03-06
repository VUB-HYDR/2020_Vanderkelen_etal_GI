% ------------------------------------------------------------------------
% Function to plot the seasonal cycle of EUR-CORDEX variables against
% referende
% -----------------------------------------------------------------------


function mf_plot_seascycle_stdata(var1,var2,var3,var_name,time_res,ownylabel,flag_legend)

% define axcolor
axcolor = [0.3 0.3 0.3];
colors = mf_colors; 
% define ticks and ticklabels

% define one leap year
year_begin  = [2008, 1, 1, 0,0,0];
year_end   =  [2008,12,31,23,0,0];  
year_vec = datevec(datenum(year_begin):1:datenum(year_end)); 
month_day = year_vec(:,2:3); 

months_label = ['Jan';'Feb';'Mar';'Apr';'May';'Jun';'Jul';'Aug';'Sep';'Oct';'Nov';'Dec'];
months_label_short = ['J';'F';'M';'A';'M';'J';'J';'A';'S';'O';'N';'D'];
months = (1:12).'; 

first_day = ones(length(months),1); 
first_daymonth=[months first_day]; 

[~,ind_firstmonth] = ismember(first_daymonth,month_day,'rows');

mid_day = ones(length(months),1).*15; 
mid_daymonth=[months mid_day]; 

[~,ind_midmonth] = ismember(mid_daymonth,month_day,'rows');



% plot 


plot(var1,'linewidth',1.5)   
hold on 
plot(var2,'linewidth',1.5)   
plot(var3,'linewidth',1.5)   

hold off

% plot characteristics
if flag_legend == 1
legend('Maastricht','Aachen','Heinsberg-Schleiden')

set(legend,'Fontweight', 'Bold', 'Fontsize', 10, 'TextColor', axcolor);
end
title(var_name,'Fontsize', 14, 'Fontweight', 'Bold', 'color', axcolor) 

ylabel(ownylabel)

if strcmp(time_res,'day')
    
    xlim([1 366])
    
    set(gca,'XTick',ind_firstmonth,'XtickLabel',[],'Fontsize', 11, 'Fontweight', 'Bold','Xcolor', axcolor,...
    'Ycolor', axcolor,'XTick',ind_midmonth,'XTickLabel',months_label_short )


elseif strcmp(time_res,'month')
    
    xlim([1 12])
    
    set(gca,'XTick',months,'XtickLabel',[],'Fontsize', 11, 'Fontweight', 'Bold','Xcolor', axcolor,...
    'Ycolor', axcolor,'XTick',months,'XTickLabel',months_label_short )

end

grid on



end