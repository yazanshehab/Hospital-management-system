package Classes;

import java.sql.*;
import java.util.ArrayList;
import src.MD5;

import javax.servlet.http.Cookie;

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


    public boolean getManager(String email, String pass) {
        Boolean var = false;

        try {
            pstmt = conn.prepareStatement("SELECT * FROM manager WHERE mEmail=? AND pass=?");
            pstmt.setString(1, email);
            pstmt.setString(2, pass);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
//                String mEmail = rs.getString("mEmail");
//                String password = rs.getString("pass");
                if(rs.next())
                var=true;

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return var;
    }


    public boolean getDoctor(String email,String pass) {
        Boolean var = false;

        try {
            pstmt = conn.prepareStatement("SELECT * FROM doctor WHERE dEmail=? AND pass=?");
            pstmt.setString(1, email);
            pstmt.setString(2, pass);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
//                String mEmail = rs.getString("dEmail");
//                String password = rs.getString("pass");
                var=true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return var;
    }

    public boolean getNurse(String email,String pass) {
        Boolean var = false;

        try {
            pstmt = conn.prepareStatement("SELECT * FROM nurse WHERE nEmail=? AND pass=?");
            pstmt.setString(1, email);
            pstmt.setString(2, pass);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
//                String mEmail = rs.getString("nEmail");
//                String password = rs.getString("pass");
                var=true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return var;
    }
    public boolean getPat(String email,String pass) {
        Boolean var = false;

        try {
            pstmt = conn.prepareStatement("SELECT * FROM patient WHERE pEmail=? AND pass=?");
            pstmt.setString(1, email);
            pstmt.setString(2, pass);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
//                String mEmail = rs.getString("nEmail");
//                String password = rs.getString("pass");
                var=true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return var;
    }

    public boolean addDoc(String Dname,String department,String email,String pass,String Workday,Time start,Time end) {
        boolean success = true;
        pass=MD5.getMd5(pass);
        try {
            pstmt = conn.prepareStatement("INSERT INTO doctor(name,department,dEmail,pass,day,start_at,end_at) VALUES(?,?,?,?,?,?,?)");
            pstmt.setString(1,Dname);
            pstmt.setString(2,department);
            pstmt.setString(3,email);
            pstmt.setString(4,pass);
            pstmt.setString(5,Workday);
            pstmt.setTime(6,start);
            pstmt.setTime(7,end);


            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
            success = false;
        }
        return success;
    }
    public boolean addNu(String NurseName,String Email,String password) {
        boolean success = true;
        try {
            pstmt = conn.prepareStatement("INSERT INTO nurse (name,nEmail,pass) VALUES(?,?,?)");
            pstmt.setString(1,NurseName);
            pstmt.setString(2,Email);
            pstmt.setString(3,password);


            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
            success = false;
        }
        return success;
    }

    public boolean addPat(String userName,String Email,String password) {
        boolean success = true;
        int def =0;
        try {
            pstmt = conn.prepareStatement("INSERT INTO patient (name,pEmail,pass,room) VALUES(?,?,?,?)");
            pstmt.setString(1,userName);
            pstmt.setString(2,Email);
            pstmt.setString(3,password);
            pstmt.setInt(4,def);
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
            success = false;
        }
        return success;
    }

    public ArrayList<ArrayList<String>> getAllDoc() {
        ArrayList<ArrayList<String>> dataToReturn = new ArrayList<>();
        try {
            ResultSet rs = stmt.executeQuery("SELECT * FROM doctor");
            DocSet(dataToReturn, rs);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return dataToReturn;
    }
    public ArrayList<ArrayList<String>> getAllNur() {
        ArrayList<ArrayList<String>> dataToReturn = new ArrayList<>();
        try {
            ResultSet rs = stmt.executeQuery("SELECT * FROM nurse");
            nurSet(dataToReturn, rs);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return dataToReturn;
    }
    public ArrayList<ArrayList<String>> getAllPat() {
        ArrayList<ArrayList<String>> dataToReturn = new ArrayList<>();
        try {
            ResultSet rs = stmt.executeQuery("SELECT * FROM patient");
            patSet(dataToReturn, rs);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return dataToReturn;
    }


    private void DocSet(ArrayList<ArrayList<String>> dataToReturn, ResultSet rs) {
        try {
            while (rs.next()) {
                int id = rs.getInt("ID");
                String name = rs.getString("name");
                String email = rs.getString("dEmail");
                String day = rs.getString("day");
                Time start =rs.getTime("start_at");
                Time end =rs.getTime("end_at");

                ArrayList<String> tempData = new ArrayList<>();
                tempData.add(Integer.toString(id));
                tempData.add(name);
                tempData.add(email);
                tempData.add(day);
                tempData.add(start.toString());
                tempData.add(end.toString());
                dataToReturn.add(tempData);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    private void nurSet(ArrayList<ArrayList<String>> dataToReturn, ResultSet rs) {
        try {
            while (rs.next()) {
                int id = rs.getInt("ID");
                String name = rs.getString("name");
                String email = rs.getString("nEmail");


                ArrayList<String> tempData = new ArrayList<>();
                tempData.add(Integer.toString(id));
                tempData.add(name);
                tempData.add(email);
                dataToReturn.add(tempData);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    private void patSet(ArrayList<ArrayList<String>> dataToReturn, ResultSet rs) {
        try {
            while (rs.next()) {
                int id = rs.getInt("ID");
                String name = rs.getString("name");
                String email = rs.getString("pEmail");


                ArrayList<String> tempData = new ArrayList<>();
                tempData.add(Integer.toString(id));
                tempData.add(name);
                tempData.add(email);
                dataToReturn.add(tempData);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public ArrayList<ArrayList<String>> getAllAppoint() {
        ArrayList<ArrayList<String>> dataToReturn = new ArrayList<>();
        try {
            ResultSet rs = stmt.executeQuery("SELECT * FROM appointment");
            DocSet(dataToReturn, rs);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return dataToReturn;
    }

    public String [] getSpecDoc(String email){
       String[] data = new String[5];
        try {
            pstmt = conn.prepareStatement("SELECT * FROM doctor WHERE dEmail=?");
            pstmt.setString(1, email);

            ResultSet rs = pstmt.executeQuery();


if (rs.next()) {
                data[0] = rs.getString("name");
                data[4] = rs.getString("department");
               String dEmail = rs.getString("dEmail");
                data[1] = rs.getString("day");
                data[2] = String.valueOf(rs.getTime("start_at"));
                data[3] = String.valueOf(rs.getTime("end_at"));

}


        } catch (Exception e) {
            e.printStackTrace();
        }

        return data;
    }
    public String [] getSpecNur(String email){
        String[] data = new String[5];
        try {
            pstmt = conn.prepareStatement("SELECT * FROM nurse WHERE nEmail=?");
            pstmt.setString(1, email);

            ResultSet rs = pstmt.executeQuery();


            if (rs.next()) {
                data[0] = rs.getString("name");


            }


        } catch (Exception e) {
            e.printStackTrace();
        }

        return data;
    }
    public String [] getSpecPat(String email){
        String[] data = new String[5];
        try {
            pstmt = conn.prepareStatement("SELECT * FROM patient WHERE pEmail=?");
            pstmt.setString(1, email);

            ResultSet rs = pstmt.executeQuery();


            if (rs.next()) {
                data[0] = rs.getString("name");

                data[1] = String.valueOf(rs.getInt("room"));


            }


        } catch (Exception e) {
            e.printStackTrace();
        }

        return data;
    }

}



