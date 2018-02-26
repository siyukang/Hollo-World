package com.shopin;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: siyukang
 * Date: 2018-02-23
 * Time: 14:31
 */
@Component
public class CronController {
    private int count =0;
    @Scheduled(cron = "*/6 * * * * ?")
    private void process() {
        System.out.println("this is scheduler task running " +(count++));
    };
}
