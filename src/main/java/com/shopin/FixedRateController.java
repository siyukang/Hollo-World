package com.shopin;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created with IntelliJ IDEA.
 * Description:
 * User: siyukang
 * Date: 2018-02-23
 * Time: 14:52
 */
@Component
public class FixedRateController {
     private static final SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm:dd");

     @Scheduled(fixedRate = 6000)
     private void reportCurrentTime() {
         System.out.println("现在时间：" + dateFormat.format(new Date()));
     };
}
