package com.cydeo.jdbctests.day02;

import com.cydeo.jdbctests.utility.DB_Util;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

public class P03_LibraryDBTest {

    // Create connection to MySQL Database
    String url = "jdbc:mysql://34.230.35.214:3306/library2";
    String username =  "library2_client";
    String password =  "6s2LQQTjBcGFfDhY" ;

    @Test
    public void testUserCount() {

        //Create a conn
        DB_Util.createConnection(url,username,password);


        // Run your query
        DB_Util.runQuery("select count(*) from users");

        // get how many user we have from DB
        String expectedCount = DB_Util.getCellValue(1, 1);

        // get How many user we have from UI
        /*

        we need to implement UI steps to get data from UI manually

         */
        String actualCount="280";

        // Make an assertion
        Assertions.assertEquals(expectedCount,actualCount);

        // Close conn

        DB_Util.destroy();

    }

    @Test
    public void testBookCount() {

        // Create Conn
           DB_Util.createConnection(url,username,password);
        // Run Query
           DB_Util.runQuery("select count(*) from books ");

           // Get how many books have from DB
        String expectedBookCount = DB_Util.getFirstRowFirstColumn();

        // Get how many book we have from UI
        /*

        we need to implement UI steps to get data from UI manually

         */
        String actualBookCount="1420";

        // Make an assertion
        Assertions.assertEquals(expectedBookCount,actualBookCount);
        // Close Conn
        DB_Util.destroy();





    }
}
