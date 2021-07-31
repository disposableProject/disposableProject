package com.disposable.utils;

import java.util.UUID;

public class Uuid
{
    public static String uuid() 
    {   
        // 랜덤 고유키 생성
        UUID uuid = UUID.randomUUID();
        System.out.println(uuid);
 
        // "-" 제외
        String convertPw = UUID.randomUUID().toString().replace("-", "");
        System.out.println(convertPw);
        return convertPw;
    }
}
