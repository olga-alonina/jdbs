package com.cydeo.jdbctests.day01;

import org.junit.jupiter.api.Test;

import java.sql.*;

public class P01_JDBCIntro {
    String dbUrl = "jdbc:oracle:thin:@54.211.225.58:1521:XE";
    String dbUsername = "hr";
    String dbPassword = "hr";

    @Test
    public void task1() throws SQLException {


        // DriverManager class getConneciton is used for to make connection with database
        Connection conn = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);

        // Statemet helps us to execute Query
        Statement statement = conn.createStatement();

        // ResutSet stores data that we get from after query execution
        // rs is just a variable/object name
        ResultSet rs = statement.executeQuery("select * from departments where manager_id is not null");

        // 10-Administration-200-1700

        // getting each row dynamicly
        while(rs.next()){

            System.out.println(rs.getInt(1)+"-"+rs.getString(2)+"-"+rs.getInt(3)+"-"+rs.getInt(4));
        }

        /*
        Can we use more than one query in one connection to get data ?
        YES
         */

         rs=statement.executeQuery("select * from REGIONS");

        //1-Europe
        //2-Americas

        while(rs.next()){
            System.out.println(rs.getInt(1)+"-"+rs.getString(2));
            //System.out.println(rs.getInt("region_id")+"-"+rs.getString("region_name"));
        }



        //close conn
        rs.close();
        statement.close();
        conn.close();

    }
}
