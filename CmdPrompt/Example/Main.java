// Student Database - Assignment 2 - CPSC 408
// Written by Shevis Johnson
// 9/27/16
//
// Decription: Runs an interface for a MySQL Database of students

package com.kraylus;

import java.util.*;
import java.io.*;

public class Main {

    public static void main(String[] args) {

        boolean running = true;

        SQLConnector sql = new SQLConnector("acsm_2ed725b67932868", // database name
                "jdbc:mysql://us-cdbr-azure-west-b.cleardb.com:3306/acsm_2ed725b67932868", //connection url
                "bcd5fdab6a0e68", // username
                "89dcbe72"); // password

        BufferedReader userin = new BufferedReader(new InputStreamReader(System.in));


        System.out.println("\nWelcome to the Student Database Interface");
        System.out.println("created by Shevis Johnson\n");

        while (running) { //Main program loop

            String input = getUI("1.) Display entire database\n" +
                    "2.) Add a student\n3.) Update a student\n4.) Delete a student\n5.) Search database\n6.) Exit\n\nWhat would you like to do?: ", userin);

            switch(input) {
                case "1":
                    //display all students
                    displayTable(sql);
                    break;
                case "2":
                    //add a student
                    addStudent(sql, userin);
                    break;
                case "3":
                    //update a student
                    updateStudent(sql, userin);
                    break;
                case "4":
                    //delete a student
                    deleteStudent(sql, userin);
                    break;
                case "5":
                    //display specific students
                    searchStudents(sql, userin);
                    break;
                case "6":
                    running = false;
                    break;
                case "exit":
                    running = false;
                    break;
                default:
                    System.out.println("\nInvalid input, please try again.\n");
                    break;
            }
        }

        sql.close();
    }

    private static void addStudent(SQLConnector sql, BufferedReader userin) {
        //adds a student to the database
        String firstName, lastName, gpa, major, facultyAdvisor;

        firstName = getUI("Please enter new student's first name: ", userin);
        lastName = getUI("Please enter new student's last name: ", userin);
        gpa = getUI("Please enter new student's GPA: ", userin);
        while (!isNum(gpa)) {
            gpa = getUI("Invalid input, please enter a number: ", userin);
        }
        major = getUI("Please enter new student's major: ", userin);
        while (major.length() > 10) {
            major = getUI("Invalid input, must be fewer than 10 chars: ", userin);
        }
        facultyAdvisor = getUI("Please enter new student's faculty advisor: ", userin);

        sql.runUpdate("INSERT INTO student(FirstName, LastName, GPA, Major, FacultyAdvisor)" +
                " VALUES('"+ (firstName) +"', '"+ (lastName) +"', '"+ (gpa) +"', '"+ (major) +"', '"+ (facultyAdvisor) +"');");
        String newID = sql.getGeneratedKey();
        //System.out.println(newID);
        displayTable(sql, "StudentID='" + newID + "'");
    }

    private static void updateStudent(SQLConnector sql, BufferedReader userin) {
        //updates a student in the database
        displayTable(sql);
        String id = getUI("Please enter the ID number of the student you wish to update: ", userin);
        while (!isNum(id)) {
            id = getUI("Invalid input, please enter the ID number of the student: ", userin);
        }
        String response = getUI("\n1.) Update major\n2.) Update advisor\n\n[1/2]: ", userin);
        while (!(response.equals("1") || response.equals("2"))) {
            response = getUI("\nInvalid Input, please try again.\n\n1.) Update major\n2.) Update advisor\n\n[1/2]: ", userin);
        }
        String updateQuery = "";
        switch(response) {
            case "1":
                String newMajor = getUI("Please enter new major: ", userin);
                updateQuery = "Major='"+newMajor+"' ";
                break;
            case "2":
                String newAdvisor = getUI("Please enter new advisor's name: ", userin);
                updateQuery = "FacultyAdvisor='"+newAdvisor+"' ";
                break;
            default:
                break;
        }
        try {
            if (sql.runUpdate("UPDATE student " +
                    "SET "+ updateQuery +
                    "WHERE StudentID='" + id + "';")) {
                displayTable(sql, "StudentID='" + id + "'");
            } else {
                System.out.println("\nAn error occurred, please try again\n");
            }
        } catch (Exception e) {
            System.out.println("\nAn error occurred, please try again\n");
        }
    }

    private static void deleteStudent(SQLConnector sql, BufferedReader userin) {
        //deletes a student from the database
        displayTable(sql);
        String idNum = getUI("Please enter the ID number of the student you wish to delete: ", userin);
        while (!isNum(idNum)) {
            idNum = getUI("Invalid input, please enter the ID number of the student: ", userin);
        }
        try {
            sql.runUpdate("DELETE FROM student " +
                    "WHERE StudentID='" + idNum + "';");
            displayTable(sql);
        } catch (Exception e) {
            System.out.println("An error occurred, please try again");
        }
    }

    private static void searchStudents(SQLConnector sql, BufferedReader userin) {
        // displays search results
        String response2 = getUI("\n1.) Search by major\n2.) Sesrch by GPA\n3.) Search by advisor\n\nSelect a search parameter: ", userin);
        while (!(response2.equals("1") || response2.equals("2") || response2.equals("3"))) {
            response2 = getUI("\nInvalid Input, please try again.\n\n1.) Search by major\n2.) Sesrch by GPA\n3.) Search by advisor\n\nSelect a search parameter: ", userin);
        }
        String newQuery = "";
        switch(response2) {
            case "1":
                String newMajor = getUI("Please enter a major: ", userin);
                while (newMajor.length() > 10) {
                    newMajor = getUI("Invalid input, must be fewer than 10 chars: ", userin);
                }
                newQuery = "Major='"+newMajor+"'";
                break;
            case "2":
                String newGPA = getUI("Please enter a GPA: ", userin);
                while (!isNum(newGPA)) {
                    newGPA = getUI("Invalid input, please enter a number: ", userin);
                }
                newQuery = "GPA='"+newGPA+"'";
                break;
            case "3":
                String newAdvisor = getUI("Please enter the name of the advisor: ", userin);
                newQuery = "FacultyAdvisor='"+newAdvisor+"'";
                break;
            default:
                break;
        }
        try {
            displayTable(sql, newQuery);
        } catch (Exception e) {
            System.out.println("An error occurred, please try again");
            e.printStackTrace();
        }
    }

    private static void displayTable(SQLConnector sql) {
        // displays entire student table
        BufferedReader userin = new BufferedReader(new InputStreamReader(System.in));
        try {
            if (sql.runSelect("SELECT * FROM student")) {
                String columns = sql.getColumns(new String[]{"StudentID", "FirstName", "LastName", "GPA", "Major", "FacultyAdvisor"});
                System.out.println(columns);
                System.out.println();
                System.out.println("Press \"ENTER\" to continue...");
                userin.readLine();
            } else {
                System.out.println("An error occurred, please try again.");
            }
        } catch (Exception e) {
            System.out.println("An error occurred, please try again.");
            //e.printStackTrace();
        }
    }

    private static void displayTable(SQLConnector sql, String condition) {
        // displays only the rows that statsfy the condition
        BufferedReader userin = new BufferedReader(new InputStreamReader(System.in));
        try {
            if (sql.runSelect("SELECT * FROM student WHERE " + condition)) {
                String columns = sql.getColumns(new String[]{"StudentID", "FirstName", "LastName", "GPA", "Major", "FacultyAdvisor"});
                System.out.println(columns);
                System.out.println();
                System.out.println("Press \"ENTER\" to continue...");
                userin.readLine();
            } else {
                System.out.println("An error occurred, please try again.");
            }
        } catch (Exception e) {
            System.out.println("An error occurred, please try again.");
            //e.printStackTrace();
        }
    }

    private static String getUI(String prompt, BufferedReader userin) {
        // Get User Input
        try {
            System.out.print(prompt);
            String input = userin.readLine();
            return input;
        } catch (Exception e) {
            return "";
        }

    }

    private static boolean isNum(String input) {
        //checks if a string is a number
        try {
            Integer.parseInt(input);
            return true;
        } catch (Exception e) {
            return false;
        }
    }
}

// INSERT INTO student(StudentID, FirstName, LastName, GPA, Major, FacultyAdvisor) VALUES('1927011', 'Shevis', 'Johnson', '3.2', 'Computer Science',
// 'Eric Linstead')