package com.cydeo.jdbctests;


import java.sql.*;

public class TestOracleConnection {

    /*
      HOW TO INIT VARIABLE

      OPT+ENTER --> Introduce Local Varibale --> MAC
      ALT+ENTER --> Introduce Local Variable --> WIN

     */
    public static void main(String[] args) throws SQLException {

    String dbUrl="jdbc:oracle:thin:@54.211.225.58:1521:XE";
    String dbUsername="hr";
    String dbPassword="hr";

    // DriverManager class getConneciton is used for to make connection with database
        Connection conn = DriverManager.getConnection(dbUrl, dbUsername, dbPassword);

    // Statemet helps us to execute Query
        Statement statement = conn.createStatement();

    // ResutSet stores data that we get from after query execution
    // rs is just a variable/object name

        ResultSet rs = statement.executeQuery("select * from regions");

        /*

        How to run query?
        - Choose query
        - CMD+ENTER or CTRLÊNTER
        - Choose session

         */

        //next() --> move to cursor in next line
        rs.next();

        /*
         getInt( index ) will return Int if we have Int value in that column
            - index starts from 1 with SQL tables

         getInt(columnLabel)

         */
        // 1
        System.out.println(rs.getInt(1));
        System.out.println(rs.getInt("REGION_ID"));



    }
}
