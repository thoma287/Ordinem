package com.kraylus;

import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ResourceBundle;
import java.sql.ResultSet;

public class Main {



    public static void main(String[] args) {
	// write your code here

        Connection mysql = null;
        PreparedStatement pst = null;
        ResultSet data = null;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            String connectionURL = "jdbc:mysql://us-cdbr-azure-west-b.cleardb.com:3306/my_first_sql_db";
            mysql = DriverManager.getConnection(connectionURL, "b5ad1a61255e87", "7069ce14");

            if (mysql == null) {
                System.out.println("Connection Failed.");
                System.exit(0);
            }
            else {
                System.out.println("SUCCESS");
            }

            //program here

            data.close();
            mysql.close();

        } catch ( Exception e) {
            e.printStackTrace();
        }



    }
}
