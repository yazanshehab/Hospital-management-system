package Classes;

import java.sql.*;
import java.util.ArrayList;
import src.MD5;
public class DB {

    private static final String DB_URL = "jdbc:mysql://localhost:3306/Project";
    private static final String USER = "root";
    private static final String PASS = "159357";

    private static Connection conn = null;
    private static Statement stmt = null;
    private static PreparedStatement pstmt = null;

    public void init() {
        try {

            conn = DriverManager.getConnection(DB_URL, USER, PASS);
            stmt = conn.createStatement();
            System.out.println("connection initialized");
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Problem!");
        }

    }//end try


    public String getManager(String email) {
        String var = "";

        try {
            pstmt = conn.prepareStatement("SELECT * FROM manager WHERE mEmail=?");
            pstmt.setString(1, email);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                String mEmail = rs.getString("mEmail");
                String password = rs.getString("pass");
                var=password;

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return var;
    }


    public String getDoctor(String email) {
        String var = "";

        try {
            pstmt = conn.prepareStatement("SELECT * FROM doctor WHERE dEmail=?");
            pstmt.setString(1, email);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                String mEmail = rs.getString("dEmail");
                String password = rs.getString("pass");
                var=password;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return var;
    }
//TODO
    public String getNurse(String email) {
        String var = "";

        try {
            pstmt = conn.prepareStatement("SELECT * FROM nurse WHERE nEmail=?");
            pstmt.setString(1, email);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                String mEmail = rs.getString("nEmail");
                String password = rs.getString("pass");
                var=password;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return var;
    }

    public boolean addUser(String Email) {
        boolean success = true;
        try {
            pstmt = conn.prepareStatement("INSERT INTO test VALUES(?)");
            pstmt.setString(1,Email);


            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
            success = false;
        }
        return success;
    }
//TODO Check for the rest

    private void processUserResultSet(ArrayList<ArrayList<String>> dataToReturn, ResultSet rs) {
        try {
            while (rs.next()) {
                int id = rs.getInt("ID");
                String name = rs.getString("name");
                String email = rs.getString("mEmail");
                String password = rs.getString("pass");

                ArrayList<String> tempData = new ArrayList<>();
                tempData.add(Integer.toString(id));
                tempData.add(name);
                tempData.add(email);
                tempData.add(MD5.getMd5(password));
                dataToReturn.add(tempData);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}


