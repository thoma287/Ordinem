import java.text.ParseException;

import java.util.Date;
import java.util.Calendar;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Scanner;
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
    private int orgID;
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
    public String getPassword() { return password; }

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
        Scanner prompt = new Scanner(System.in);
        System.out.print("Email: ");
        this.email = prompt.next();
        System.out.print("Password: ");
        this.password = prompt.next();
        while (!(this.OrgLogin(this.email, this.password))) {
            System.out.println("Invalid login credentials, please try again.");
            System.out.print("Email: ");
            this.email = prompt.next();
            System.out.print("Password: ");
            this.password = prompt.next();
        }
    }

    public boolean OrgLogin(String _email, String _password){
        System.out.println("One moment please...");
        if (this.sql.runSelect("SELECT * FROM organizations WHERE email='"+_email+"' AND password='"+_password+"';")) //Check inside database if it contains username/password
        { //TODO check login with password and if correct then allow access to perform tasks (addEvent, viewFutureEvents, viewPastEvents)
            //open user account
            try {
                //this.orgID = this.sql.data.getInt("orgID");
                System.out.println("Successfully logged in!");
                //System.out.println(this.sql.getColumns(new String[] {"name", "email", "orgID"}));
                return true;
            } catch (Exception e) {
                System.out.println(e.getMessage());
                return false;
            }
        } else {
            return false;
        }
    }

    private void run() {
        //main operation code

    }

    public String addEvent() throws ParseException {
        //Uses composition for the sake of renewability
        //TODO saves new events under the logged in Organizer

        EventManager x = new EventManager();

        date2 = x.setDate();
        description = x.setDescription();
        location = x.setLocation();
        pointsGiven = x.setPoints();
        date2 = x.setDate();
        time = x.getTime();
        startTime = x.getStartTime();
        endTime = x.getEndTime();

        return date2 + description + location + time + pointsGiven + date2 + startTime + endTime;
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

