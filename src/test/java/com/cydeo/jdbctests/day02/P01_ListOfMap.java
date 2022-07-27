package com.cydeo.jdbctests.day02;

import org.junit.jupiter.api.Test;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class P01_ListOfMap {

    String dbUrl = "jdbc:oracle:thin:@54.211.225.58:1521:XE";
    String dbUsername = "hr";
    String dbPassword = "hr";

    @Test
    public void task1() throws SQLException {

        Map<String,Object> rowMap1=new HashMap<>();
            rowMap1.put("first_name","Steven");
            rowMap1.put("last_name","King");
            rowMap1.put("salary",24000);

        System.out.println(rowMap1);

        System.out.println("--- ROW MAP 2 ---");
        Map<String,Object> rowMap2=new HashMap<>();
        rowMap2.put("first_name","Neena");
        rowMap2.put("last_name","Kocchar");
        rowMap2.put("salary",17000);

        System.out.println(rowMap2);

        /**
         *
         * it will keep continue all the wy bottom
         *
         */

        List<Map<String,Object>> dataList=new ArrayList<>();

        dataList.add(rowMap1);
        dataList.add(rowMap2);


        // Give me last name of Steven
        System.out.println(dataList.get(0).get("last_name"));


    }

}
