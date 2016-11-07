import java.text.ParseException;
import java.util.Date;
import java.util.Scanner;
import java.util.UUID;

public class Admin {

    public Admin() {
        //nothing
        this.sql = new SQLConnector("chapman_university", // database name
                "jdbc:mysql://us-cdbr-azure-west-b.cleardb.com:3306/chapman_university", //connection url
                "b8adaded8c4294", // username
                "67e46b7b"); // password
    }

    private SQLConnector sql;

    private String username, password, email, uniqueID, typeID;

    //Included for Event adder
    private Date date2;
    private Date[] time;
    private String location;
    private String description;
    private int pointsGiven;

    public String getUsername(){
        return username;  //getter username
    }

    public String getPassword(){
        return password; //getter password
    }

    public String getEmail(){
        return  email; //getter email
    }

    public String getUniqueID(){
        return uniqueID; //getter unique ID
                            //not to be confused with student ID
    }
    public Date getDate2(){return date2;}
    public Date[] getStartTime(){return time;}
    public String getLocation(){return location;}
    public String getDescription(){return description;}
    public int getPointsGiven(){return pointsGiven;}



    public void viewAccount(){
        System.out.println("Username: " + username);
        System.out.println("Email: " + email);
        System.out.print("ID: " + uniqueID);
    }

    public boolean AddOrg(){
        Scanner prompt = new Scanner(System.in);
        System.out.println("Choose Organization Name: ");
        username = prompt.next();

        System.out.println("Choose Password: ");
        password = prompt.next();

        System.out.println("Email: ");
        email = prompt.next();

        System.out.print("1.) Academic/Professional\n2.) Honor Society\n3.) Diversity/Cultural\n4.) Religious/Spiritual\n" +
                        "5.) Recreational\n6.) Greek Chapter\n7.) Leisure\n8.) Civic Engagement\n\nPlease enter organization type as a number: ");
        typeID = prompt.next();

        //uniqueID = UUID.randomUUID().toString();

        return sql.runUpdate("INSERT INTO organizations(name, email, password, typeID) VALUES ('"+username+"', '"+email+"', '"+password+"', "+typeID+")");
    }

    public String editOrg(){

        Scanner prompt = new Scanner(System.in);
        System.out.println("Administration ID: ");
        String checkID = prompt.next();  //TODO look for Administration ID entered in server

        System.out.println("Password: ");
        String checkPassword = prompt.next();

        if (checkID == username && checkPassword == password){  //TODO Check password with respective ID
            System.out.println("Edit Username, password, or email?");
            String chosen = prompt.next();

            if (chosen.toLowerCase()=="username"){
                System.out.println("New username: ");
                String newUsername = prompt.next();

                System.out.println("Verify username");
                String verifyNewUsername = prompt.next();
                if (newUsername == verifyNewUsername){
                    username = newUsername;
                    System.out.println("Success");  //TODO changes username in server
                }

                }

            if (chosen.toLowerCase()=="password"){
                System.out.println("New password: ");
                String newPassword = prompt.next();

                System.out.println("Verify password: ");
                String verifyNewPassword = prompt.next();

                if (newPassword == verifyNewPassword){
                    username = newPassword;
                    System.out.println("Success");  //TODO changes password in server
            }
            }

            if (chosen.toLowerCase()=="email"){
                System.out.println("New email: ");
                String newEmail = prompt.next();

                System.out.println("Verify email: ");
                String verifyNewEmail = prompt.next();

                if (newEmail == verifyNewEmail){
                    email = newEmail;
                    System.out.println("Success");  //TODO changes email in server
                }
            }
            return (username +  email +  password + uniqueID);
        }
        else{
            return null;
        }



    }

    public void deleteOrg(){
        Scanner scan = new Scanner(System.in);
        System.out.println("Enter ID that you would like to delete: ");
        String ID = scan.next();  //TODO searches for ID in ID database in orgs
        //Search for ID in database
        //let it be contained from here to the end of the function



        System.out.println("Are you sure you Would you like to delete account" + ID + "? (Yes/No) ");
        String verify = scan.next();

        if (verify.toLowerCase().startsWith("y")){

            uniqueID = null;
            username = null;
            password = null;
            email = null;   //TODO interprets the nulls to the Organization selected

        }
        if (verify.toLowerCase().startsWith("n")){
            System.exit(0);
        }

    }

    public EventManager addEvent() throws ParseException {
        //Uses composition for the sake of renewability
        //TODO creates new event under ADMINSTRATOR

            EventManager x = null;
            x = new EventManager();

            date2 = x.setDate();
            time = x.getTime();
            description = x.setDescription();
            location = x.setLocation();
            pointsGiven = x.setPoints();

        //TODO add all of the stuff above as new event under respective user (in this case ADMIN)

            return x;
        }


    }




