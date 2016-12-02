import jdk.internal.util.xml.impl.Input;

import java.rmi.server.ExportException;
import java.sql.SQLException;
import java.text.ParseException;
//import java.util.Date;
import java.util.Calendar;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
//import java.util.Scanner;
import java.util.*;
import java.io.*;

public class Organization {
    private Date date2;
    private Date startTime;
    private Date endTime;
    private Date[] time;
    private String location;
    private String description;
    private int pointsGiven;
    private String email;
    private String password;
    private int organID;
    private SQLConnector sql;

    public Date getDate2() {
        return date2;
    }
    public Date getStartTime() {
        return startTime;
    }
    public Date getEndTime() {
        return endTime;
    }
    public String getLocation() {
        return location;
    }
    public String getDescription() {
        return description;
    }
    public int getPointsGiven() {
        return pointsGiven;
    }
    public String getEmail() {
        return email;
    }
    public String getPassword() {
        return password;
    }

    public Organization() {
        this.sql = new SQLConnector("chapman_university", // database name
                "jdbc:mysql://us-cdbr-azure-west-b.cleardb.com:3306/chapman_university", //connection url
                "b8adaded8c4294", // username
                "67e46b7b"); // password
        this.retrieveCredentials();
    }

    public Organization(String _email, String _password) {
        this.sql = new SQLConnector("chapman_university", // database name
                "jdbc:mysql://us-cdbr-azure-west-b.cleardb.com:3306/chapman_university", //connection url
                "b8adaded8c4294", // username
                "67e46b7b"); // password
        this.email = _email;
        this.password = _password;
        if (!(this.OrgLogin(this.email, this.password))) {
            this.retrieveCredentials();
        }
    }

    public void retrieveCredentials() {
        System.out.println("Organization Login Portal");
        Scanner input = new Scanner(System.in);
        System.out.print("Email: ");
        this.email = input.next();
        System.out.print("Password: ");
        this.password = input.next();
        while (!(this.OrgLogin(this.email, this.password))) {
            System.out.println("Invalid login credentials, please try again.");
            System.out.print("Email: ");
            this.email = input.next();
            System.out.print("Password: ");
            this.password = input.next();
        }
    }


    public boolean OrgLogin(String _email, String _password){
        System.out.println("One moment please...");
        try {
            this.sql.pst = this.sql.mysql.prepareStatement("SELECT * FROM organizations WHERE email=? AND password=?");
            this.sql.pst.setString(1,_email);
            this.sql.pst.setString(2,_password);
            this.sql.runSelect();
            //this.sql.printEventData();
        } catch (SQLException e) {
            e.printStackTrace();
        }


        if (this.sql.runSelect()) //Check inside database if it contains username/password
        { //TODO check login with password and if correct then allow access to perform tasks (addEvent, viewFutureEvents, viewPastEvents)
            //open user account
            try {
                System.out.println("Successfully logged in!\n");
                printMenu();
                return true;
            } catch (Exception e) {
                System.out.println(e.getMessage());
                return false;
            }
        } else {
            return false;
        }

    }

    public void printMenu(){
        int choice = 0;
        BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
        while(true){
            try{
                System.out.println("----Event Menu----");
                System.out.println("1.View My Events");
                System.out.println("2.Create New Event");
                System.out.println("3.Log out");
                System.out.print("Enter your choice: ");

                choice =  Integer.parseInt(reader.readLine());
                if(choice == 1){
                    //view events
                    //stop the loop
                    System.out.println();
                    printViewMenu();
                    //break;
                }
                else if(choice == 2){
                    //create new event
                    //stop loop
                    addEvent(this.email,this.password);
                    break;
                }
                else if(choice == 3){
                    //logout
                    this.sql.close();
                    System.exit(0);
                    //stop loop
                    break;
                }
                else{
                    System.out.println("Input must be 1,2 or 3\n");
                }
            }catch(Exception e){
                System.out.println("Input must be 1,2 or 3\n");
            }
        }
    }

    public void printViewMenu(){
        int viewChoice = 0;
        BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
        while(true){
            try{
                System.out.println("----View My Events----");
                System.out.println("1.View All Events");
                System.out.println("2.View Past Events");
                System.out.println("3.View Future Events");
                System.out.println("4.Go Back");
                System.out.print("Enter your choice: ");
                viewChoice = Integer.parseInt(reader.readLine());

                if(viewChoice == 1){
                    //view all events
                    //System.out.println("email: " + this.email + "\npass: " + this.password);
                    getAllEvents(this.email,this.password);
                    //break;
                }
                else if(viewChoice == 2){
                    //view past
                    break;
                }
                else if(viewChoice == 3){
                    //view future
                    break;
                }
                else if(viewChoice == 4){
                    //go back
                    System.out.println();
                    break;
                }
                else{
                    System.out.println("Input must be 1,2 or 3");
                }
            }catch(Exception e){
                System.out.println("Input must be 1,2 or 3\n");
            }
        }
    }

    public void getAllEvents(String _email, String _password){
        try {
            this.sql.pst = this.sql.mysql.prepareStatement("SELECT orgID FROM organizations WHERE email=? AND password=?");
            this.sql.pst.setString(1,_email);
            this.sql.pst.setString(2,_password);
            this.sql.runSelect();
            if(this.sql.runSelect()){
                //int orgID = 0;
                //orgID = this.sql.printData();
                String temp = this.sql.printEventData();
                //System.out.println(temp);
                int orgID = Integer.parseInt(temp);
                this.organID = orgID;
                this.sql.pst = this.sql.mysql.prepareStatement("SELECT * FROM events WHERE hostOrgID=?");
                this.sql.pst.setInt(1,orgID);
                this.sql.runSelect();
                String[] list = {"eventName","description","eventDate","eventTimeLength","location","pointsForAttending"};
                String cols = this.sql.getColumns(list);
                System.out.println(cols);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void addEvent(String _email, String _password) throws ParseException {

        BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));

        try{
            System.out.print("1.What is the name of the event?: ");
            String eventName = reader.readLine();
            System.out.print("2.What is the description of the event?: ");
            String eventDescription = reader.readLine();
            System.out.print("3.What is the event date?(mm/dd/yyyy): ");
            String eventDate = reader.readLine();
            int eventTimeLength = 0;
            while(true){
                System.out.print("4.What is the event time length(minutes)?: ");
                String tempTime = reader.readLine();
                try{
                    eventTimeLength = Integer.parseInt(tempTime);
                    break;
                }catch(NumberFormatException e){
                    System.out.println("Input must be an integer\n");
                }
            }
            System.out.print("5.What is the location of the event?: ");
            String eventLocation = reader.readLine();

            int eventPoints = 0;
            while(true){
                System.out.print("6.What is the points for attending?: ");
                String tempPoints = reader.readLine();
                try{
                     eventPoints = Integer.parseInt(tempPoints);
                    break;
                }catch(NumberFormatException e){
                    System.out.println("Input must be an integer\n");
                }
            }

            this.sql.pst = this.sql.mysql.prepareStatement("SELECT orgID FROM organizations WHERE email=? AND password=?");
            this.sql.pst.setString(1,_email);
            this.sql.pst.setString(2,_password);
            this.sql.runSelect();
            int orgID = 0;
            if(this.sql.runSelect()){
                String temp = this.sql.printEventData();

                orgID = Integer.parseInt(temp);

            }


            String insert_sql_events = "INSERT INTO events (eventName,description,hostOrgID,eventDate,eventTimeLength,location,pointsForAttending)" + "VALUES (?,?,?,?,?,?,?)";
            this.sql.pst = this.sql.mysql.prepareStatement(insert_sql_events);
            this.sql.pst.setString(1,eventName);
            this.sql.pst.setString(2,eventDescription);
            this.sql.pst.setInt(3,orgID);
            this.sql.pst.setString(4,eventDate);
            this.sql.pst.setInt(5,eventTimeLength);
            this.sql.pst.setString(6,eventLocation);
            this.sql.pst.setInt(7,eventPoints);

            this.sql.runUpdate();
            this.sql.getGeneratedKey();
            //date created
        }catch(Exception e){
            e.printStackTrace();
        }

    }

    public void viewFutureEvents(){

        //TODO display all future events for the specified organizer
        DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        //get current date time with Date()
        Date date = new Date();


        //get current date time with Calendar()
        Calendar cal = Calendar.getInstance();
        System.out.println(dateFormat.format(cal.getTime()));

        //if date on the added events is greater than current date, then display
        //search database & compare to current time given above
    }
    public void viewPastEvents(){

        //TODO display all past events for the specified organizer
        DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        //get current date time with Date()
        Date date = new Date();


        //get current date time with Calendar()
        Calendar cal = Calendar.getInstance();
        System.out.println(dateFormat.format(cal.getTime()));

        //if date on the added events is less than current date, then display
        //search database & compare to current time given above
    }

}

