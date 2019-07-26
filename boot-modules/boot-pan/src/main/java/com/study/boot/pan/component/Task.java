package com.study.boot.pan.component;


import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Component;

import java.util.Random;

@Slf4j
@Component
public class Task {

    private static Random random = new Random();


    @Async("taskExecutor")
    @SneakyThrows
    public void doTaskOne(){
        log.info("开始做任务一");
        log.info(Thread.currentThread().getName());
        long start = System.currentTimeMillis();
        Thread.sleep(random.nextInt(10000));
        long end = System.currentTimeMillis();
        log.info("完成任务一，耗时：" + (end - start) + "毫秒");
    }

    @Async("taskExecutor")
    @SneakyThrows
    public void doTaskTwo()  {
        log.info("开始做任务二");
        log.info(Thread.currentThread().getName());
        long start = System.currentTimeMillis();
        long end = System.currentTimeMillis();
        log.info("完成任务二，耗时：" + (end - start) + "毫秒");
    }

    @Async("taskExecutor")
    @SneakyThrows
    public void doTaskThree() {
        log.info("开始做任务三");
        log.info(Thread.currentThread().getName());
        long start = System.currentTimeMillis();
        Thread.sleep(random.nextInt(10000));
        long end = System.currentTimeMillis();
        log.info("完成任务三，耗时：" + (end - start) + "毫秒");
    }
}
