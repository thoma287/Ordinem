import java.text.ParseException;

import java.util.Date;
import java.util.Calendar;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

public class Organizer {

    private Date date2;
    private Date startTime;
    private Date endTime;
    private String location;
    private String description;
    private int pointsGiven;
    private String username;
    private String password;


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
    public String getUsername() {
        return username;
    }
    public String getPassword() { return password; }


    public void OrgLogin(String username, String password){
        if (username.matches(this.username) && password.matches(this.password)) //Check inside database if it contains username/password
        { //TODO check login with password and if correct then allow access to perform tasks (addEvent, viewFutureEvents, viewPastEvents)
            //open user account


        }
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
        x.getTime();
        startTime = x.getStartTime();
        endTime = x.getEndTime();

        return date2 + description + location + pointsGiven + date2 + startTime + endTime;
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

