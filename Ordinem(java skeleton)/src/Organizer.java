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


    public void OrgLogin(String username, String password){
        if (username.matches(username) && password.matches(password)) //Check inside database if it contains username/password
        {
            //open user account


        }
    }

    public String addEvent() throws ParseException {
        //Uses composition for the sake of renewability

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
        DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        //get current date time with Date()
        Date date = new Date();


        //get current date time with Calendar()
        Calendar cal = Calendar.getInstance();
        System.out.println(dateFormat.format(cal.getTime()));

        //search database & compare to current time given above


    }


}

