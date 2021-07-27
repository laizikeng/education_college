package com.example.eduostatistic.schedule;

import com.example.eduostatistic.entity.StatisticsDaily;
import com.example.eduostatistic.service.StatisticsDailyService;
import com.example.utils.DateUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.util.Date;

@Component
public class ScheduleTask {
    @Autowired
    private StatisticsDailyService statisticsDailyService;


    // 每天凌晨一点定时更新任务
    @Scheduled(cron = "0 0 1 * * ?")
    public void task1(){
        statisticsDailyService.registerCount(DateUtil.formatDate(DateUtil.addDays(new Date(),-1)));
    }
}
