package com.study.boot.upms;


import org.jasypt.util.text.BasicTextEncryptor;

public class JasyptTest {

    public static void main(String[] args) {
        BasicTextEncryptor encryptor = new BasicTextEncryptor();
        encryptor.setPassword("boot");
        String username = encryptor.encrypt("root");
        String password = encryptor.encrypt("12345678");
        System.out.println(username);
        System.out.println(password);
    }
}
