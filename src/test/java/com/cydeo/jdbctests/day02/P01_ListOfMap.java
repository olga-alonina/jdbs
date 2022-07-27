package com.cydeo.jdbctests.day02;

import org.junit.jupiter.api.Test;

import java.sql.*;
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
        System.out.println(dataList.get(1).get("last_name"));


    }

    @Test
    public void task2() throws SQLException {
        // DriverManager class getConneciton is used for to make connection with database
        Connection conn = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);

        // Statemet helps us to execute Query
        Statement statement = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);

        // ResutSet stores data that we get from after query execution
        // rs is just a variable/object name
        ResultSet rs = statement.executeQuery("select first_name,last_name,salary from employees where rownum<6" );
        ResultSetMetaData rsmd = rs.getMetaData();

        rs.next();

        Map<String,Object> rowMap1=new HashMap<>();
        rowMap1.put(rsmd.getColumnName(1),rs.getString(1));
        rowMap1.put(rsmd.getColumnName(2),rs.getString(2));
        rowMap1.put(rsmd.getColumnName(3),rs.getInt(3));

        System.out.println(rowMap1);
        rs.next();


        System.out.println("--- ROW MAP 2 ---");
        Map<String,Object> rowMap2=new HashMap<>();
        rowMap2.put(rsmd.getColumnName(1),rs.getString(1));
        rowMap2.put(rsmd.getColumnName(2),rs.getString(2));
        rowMap2.put(rsmd.getColumnName(3),rs.getInt(3));

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
        System.out.println(dataList.get(0).get(rsmd.getColumnName(2)));

        // PRINT MAPS FROM THE LIST
        System.out.println("===== PRINT MAPS FROM THE LIST =====");
        for (Map<String, Object> eachRowMap : dataList) {
            System.out.println(eachRowMap);
        }

        //close conn
        rs.close();
        statement.close();
        conn.close();
    }
}
