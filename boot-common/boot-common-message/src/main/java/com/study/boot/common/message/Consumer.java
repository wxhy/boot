package com.study.boot.common.message;

import com.rabbitmq.client.*;

import java.io.IOException;
import java.util.concurrent.TimeoutException;

/**
 * 消费者
 *
 * @author carlos
 */
public class Consumer {

    public static void main(String[] args) throws IOException, TimeoutException {
        ConnectionFactory factory = new ConnectionFactory();

        factory.setHost("localhost");
        factory.setUsername("admin");
        factory.setPassword("123456");

        Connection connection = factory.newConnection();

        Channel channel = connection.createChannel();

        String exchangeName = "hello-exchange";
        channel.exchangeDeclare(exchangeName, "direct", true);

        //声明队列
        String queue = channel.queueDeclare().getQueue();

        String routingKey = "hola";

        //绑定队列，通过键 hola 将队列和交换器绑定起来
        channel.queueBind(queue, exchangeName, routingKey);


        while (true) {
            //消费消息
            boolean autoAck = false;
            String cousumerTag = "";

            channel.basicConsume(queue, autoAck, cousumerTag, new DefaultConsumer(channel) {

                @Override
                public void handleDelivery(String consumerTag, Envelope envelope, AMQP.BasicProperties properties, byte[] body) throws IOException {

                    String routingKey = envelope.getRoutingKey();
                    String contentType = properties.getContentType();
                    System.out.println("消费的路由键：" + routingKey);
                    System.out.println("消费的内容类型：" + contentType);
                    long deliveryTag = envelope.getDeliveryTag();
                    //确认消息
                    channel.basicAck(deliveryTag,false);
                    System.out.println("消费的消息体内容：");
                    String bodyStr = new String(body, "UTF-8");
                    System.out.println(bodyStr);
                }
            });
        }

    }
}
