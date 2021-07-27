package com.example.eduostatistic.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.ResultEntity;
import com.example.eduostatistic.client.UcenterClient;
import com.example.eduostatistic.entity.StatisticsDaily;
import com.example.eduostatistic.mapper.StatisticsDailyMapper;
import com.example.eduostatistic.service.StatisticsDailyService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.swagger.models.auth.In;
import org.apache.commons.lang3.RandomUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 网站统计日数据 服务实现类
 * </p>
 *
 * @author June
 * @since 2021-07-20
 */
@Service
public class StatisticsDailyServiceImpl extends ServiceImpl<StatisticsDailyMapper, StatisticsDaily> implements StatisticsDailyService {

    @Autowired
    private UcenterClient ucenterClient;
    @Override
    public void registerCount(String day) {
        // 先删再加
        QueryWrapper<StatisticsDaily> wrapper =new QueryWrapper<>();
        wrapper.eq("date_calculated",day);
        baseMapper.delete(wrapper);

        // 微服务调用
        Integer countRegister = null;
        try {
            countRegister = (Integer) ucenterClient.countRegister(day).getData().get("count");
        } catch (Exception e) {
            e.printStackTrace();
        }

        StatisticsDaily sta = new StatisticsDaily();
        sta.setRegisterNum(countRegister);
        sta.setDateCalculated(day);

        // TODO 初步使用随机数代替真实数据
        sta.setCourseNum(RandomUtils.nextInt(100,200));
        sta.setLoginNum(RandomUtils.nextInt(100,200));
        sta.setVideoViewNum(RandomUtils.nextInt(100,200));

        baseMapper.insert(sta);


    }

    @Override
    public Map<String, Object> getData(String type, String begin, String end) {
        QueryWrapper<StatisticsDaily> wrapper = new QueryWrapper<>();
        wrapper.between("date_calculated",begin,end);
        wrapper.select("date_calculated",type);

        wrapper.orderByAsc("date_calculated");
        List<StatisticsDaily> list = baseMapper.selectList(wrapper);

        List<String> date_calculatedList = new ArrayList<>();
        List<Integer> numDataList = new ArrayList<>();

        for (StatisticsDaily daily : list) {
            date_calculatedList.add(daily.getDateCalculated());
            //封装对应数量
            switch (type) {
                case "login_num":
                    numDataList.add(daily.getLoginNum());
                    break;
                case "register_num":
                    numDataList.add(daily.getRegisterNum());
                    break;
                case "video_view_num":
                    numDataList.add(daily.getVideoViewNum());
                    break;
                case "course_num":
                    numDataList.add(daily.getCourseNum());
                    break;
                default:
                    break;
            }
        }
        //把封装之后两个list集合放到map集合，进行返回
        Map<String, Object> map = new HashMap<>();
        map.put("date_calculatedList",date_calculatedList);
        map.put("numDataList",numDataList);
        return map;
    }
}
