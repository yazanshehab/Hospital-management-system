public class DBHandler {
    // todo change below line to fit to your configurations
    private static final String DB_URL = "jdbc:mysql://localhost:3306/db";

    // todo change below lines to correspond to your credentials for the database
    private static final String USER = "<username>";
    private static final String PASS = "<password>";

    private static Connection conn = null;
    private static Statement stmt = null;
    private static PreparedStatement pstmt = null;

    public void init() {
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            conn = DriverManager.getConnection(DB_URL, USER, PASS);
            stmt = conn.createStatement();
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Problem!");
        }
    }

    public ArrayList<ArrayList<String>> getAllUsers() {
        ArrayList<ArrayList<String>> dataToReturn = new ArrayList<>();
        try {
            ResultSet rs = stmt.executeQuery("SELECT * FROM user");
            processUserResultSet(dataToReturn, rs);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return dataToReturn;
    }

    public ArrayList<ArrayList<String>> getUser(int userId) {
        ArrayList<ArrayList<String>> dataToReturn = new ArrayList<>();
        try {
            pstmt = conn.prepareStatement("SELECT * FROM user WHERE id=?");
            pstmt.setInt(1, userId);
            ResultSet rs = pstmt.executeQuery();
            processUserResultSet(dataToReturn, rs);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return dataToReturn;
    }

    private void processUserResultSet(ArrayList<ArrayList<String>> dataToReturn, ResultSet rs) {
        try {
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                int reviewCount = rs.getInt("review_count");
                int usefulVotes = rs.getInt("useful_votes");
                int funnyVotes = rs.getInt("funny_votes");
                int coolVotes = rs.getInt("cool_votes");
                ArrayList<String> tempData = new ArrayList<>();
                tempData.add(Integer.toString(id));
                tempData.add(name);
                tempData.add(Integer.toString(reviewCount));
                tempData.add(Integer.toString(usefulVotes));
                tempData.add(Integer.toString(funnyVotes));
                tempData.add(Integer.toString(coolVotes));
                dataToReturn.add(tempData);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public boolean addUser(int id, String name, int reviewCount, int usefulVotes, int funnyVotes, int coolVotes) {
        boolean success = true;
        try {
            pstmt = conn.prepareStatement("INSERT INTO user VALUES(?, ?,?,?,?,?)");
            pstmt.setInt(1, id);
            pstmt.setString(2, name);
            pstmt.setInt(3, reviewCount);
            pstmt.setInt(4, usefulVotes);
            pstmt.setInt(5, funnyVotes);
            pstmt.setInt(6, coolVotes);
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
            success = false;
        }
        return success;
    }

    public boolean deleteUser(int id) {
        boolean success = true;
        try {
            pstmt = conn.prepareStatement("DELETE FROM user WHERE id = ?");
            pstmt.setInt(1, id);
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
            success = false;
        }
        return success;
    }
}
