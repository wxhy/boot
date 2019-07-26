package com.study.boot.common.message;

import com.rabbitmq.client.Channel;
import com.rabbitmq.client.Connection;
import com.rabbitmq.client.ConnectionFactory;

import java.io.IOException;
import java.util.concurrent.TimeoutException;

/**
 * 生产者
 * @author carlos
 */
public class Producer {


    public static void main(String[] args) throws IOException, TimeoutException {
        //创建连接工厂
        ConnectionFactory factory = new ConnectionFactory();
        factory.setUsername("admin");
        factory.setPassword("123456");
        //设置 RabbitMQ 地址
        factory.setHost("localhost");

        Connection connection = factory.newConnection();

        //获取信道
        Channel channel = connection.createChannel();

        //声明交换器
        String exchangeName = "hello-exchange";
        channel.exchangeDeclare(exchangeName,"direct",true);

        String routingKey = "hola";

        //发布消息
        byte[] messageBodyBytes = "quit".getBytes();

        channel.basicPublish(exchangeName,routingKey,null,messageBodyBytes);

        channel.close();

        connection.close();
    }
}
