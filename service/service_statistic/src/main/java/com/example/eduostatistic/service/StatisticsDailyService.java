package com.example.eduostatistic.service;

import com.example.eduostatistic.entity.StatisticsDaily;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.Map;

/**
 * <p>
 * 网站统计日数据 服务类
 * </p>
 *
 * @author June
 * @since 2021-07-20
 */
public interface StatisticsDailyService extends IService<StatisticsDaily> {

    void registerCount(String day);

    Map<String, Object> getData(String type, String begin, String end);
}
