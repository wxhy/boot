package com.study.boot.common.message;

import java.util.Stack;

public class Solution {

    public int evalRPN(String[] tokens) {
        Stack<Integer> stack = new Stack<>();

        for (int i = 0; i < tokens.length; i++) {
            try {
                int num = Integer.parseInt(tokens[i]);
                stack.add(num);
            } catch (Exception e) {
                Integer b = stack.pop();
                Integer a = stack.pop();
                stack.add(get(a, b, tokens[i]));
            }
        }

        return stack.pop();

    }


    public int get(int a, int b, String operator) {
        switch (operator) {
            case "+":
                return a + b;
            case "-":
                return a - b;
            case "*":
                return a * b;
            case "/":
                return a / b;
            default:
                return 0;
        }
    }
}
