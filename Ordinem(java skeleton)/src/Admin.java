import java.text.ParseException;
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

    public void viewAccount(){
        System.out.println("Username: " + username);
        System.out.println("Email: " + email);
        System.out.print("ID: " + uniqueID);
    }

    public boolean AddOrg(){
        Scanner prompt = new Scanner(System.in);
        System.out.print("Choose Organization Name: ");
        username = prompt.next();

        System.out.print("Choose Password: ");
        password = prompt.next();

        System.out.print("Email: ");
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
        String checkID = prompt.next();

        System.out.println("Password: ");
        String checkPassword = prompt.next();

        if (checkID == username && checkPassword == password){
            System.out.println("Edit Username, password, or email?");
            String chosen = prompt.next();

            if (chosen.toLowerCase()=="username"){
                System.out.println("New username: ");
                String newUsername = prompt.next();

                System.out.println("Verify username");
                String verifyNewUsername = prompt.next();
                if (newUsername == verifyNewUsername){
                    username = newUsername;
                    System.out.println("Success");
                }

                }

            if (chosen.toLowerCase()=="password"){
                System.out.println("New password: ");
                String newPassword = prompt.next();

                System.out.println("Verify password: ");
                String verifyNewPassword = prompt.next();

                if (newPassword == verifyNewPassword){
                    username = newPassword;
                    System.out.println("Success");
            }
            }

            if (chosen.toLowerCase()=="email"){
                System.out.println("New email: ");
                String newEmail = prompt.next();

                System.out.println("Verify email: ");
                String verifyNewEmail = prompt.next();

                if (newEmail == verifyNewEmail){
                    email = newEmail;
                    System.out.println("Success");
                }
            }
        }

        return (username +  email +  password + uniqueID);

    }

    public void deleteOrg(){
        Scanner scan = new Scanner(System.in);
        System.out.println("Enter ID that you would like to delete: ");
        String ID = scan.next();
        //Search for ID in database
        //let it be contained from here to the end of the function



        System.out.println("Are you sure you Would you like to delete account" + ID + "? (Yes/No) ");
        String verify = scan.next();

        if (verify.toLowerCase().startsWith("y")){

            uniqueID = null;
            username = null;
            password = null;
            email = null;

        }
        if (verify.toLowerCase().startsWith("n")){
            System.exit(0);
        }

    }

    public EventManager addEvent() throws ParseException {
        //Uses composition for the sake of renewability

            EventManager x = null;
            x = new EventManager();

            x.setDate();
            x.getTime();
            x.setDescription();
            x.setLocation();
            x.setPoints();

            return new EventManager();
        }


    }




