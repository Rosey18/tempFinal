package work;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBSource {
    private Connection connection;

    public DBSource() {
        String url = "jdbc:mysql://localhost:3306/web_railway_tracker?useUnicode=yes&characterEncoding=UTF-8" +
                "&serverTimezone=GMT";
        String username = "ticket";
        String password = "ticket";
        try{
            Class.forName("com.mysql.cj.jdbc.Driver").getDeclaredConstructor().newInstance();
            this.connection = DriverManager.getConnection(url, username, password);
        }catch(Exception exception){
            System.out.println("Error occurred in connector constructor");
            exception.printStackTrace();
            this.connection = null;
        }
    }

    public Connection getConnection(){
        return this.connection;
    }
}
