package work;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class UserDbUtil {

	private DBSource dataSource;

	public UserDbUtil(DBSource theDataSource) {
		dataSource = theDataSource;
	}

	public List<Railway> getRailway() throws Exception {

		List<Railway> railway = new ArrayList<>();

		Connection conn = null;
		Statement stm = null;
		ResultSet rs = null;

		try {
			// get a connection
			conn = dataSource.getConnection();

			// create sql statement
			String sql = "select * from train_ticket";
			stm = conn.createStatement();

			// execute sql query
			rs = stm.executeQuery(sql);

			// process result set
			while (rs.next()) {

				// retrieve data from result set row
				int id = rs.getInt("id");
				String trainNum = rs.getString("train_no");
				String departure = rs.getString("departure_station");
				String arrival = rs.getString("arraival_station");
				String carriage = rs.getString("carriage");
				int seat = rs.getInt("seat");
				int price = rs.getInt("price");

				// create new railway object
				Railway tempRailway = new Railway(id, trainNum, departure, arrival, carriage, seat, price);

				// add it to list of railway
				railway.add(tempRailway);
			}

			return railway;

		} catch (Exception e) {
			e.printStackTrace();

		}
		return null;
	}

	private void close(Connection conn, ResultSet rs, Statement stm) {

		try {
			if (rs != null) {
				rs.close();
			}

			if (stm != null) {
				stm.close();
			}

			if (conn != null) {
				conn.close();
			}
		} catch (Exception e) {

			e.printStackTrace();
		}

	}

	public Railway getRailways(String theRailwayId) throws Exception {

		Railway theRailway = null;

		Connection myConn = null;
		PreparedStatement myStmt = null;
		ResultSet myRs = null;
		int trainId;

		try {
			// convert train id to int
			trainId = Integer.parseInt(theRailwayId);

			// get connection to database
			myConn = dataSource.getConnection();

			// create sql to get selected ticket
			String sql = "select * from train_ticket where id=?";

			// create prepared statement
			myStmt = myConn.prepareStatement(sql);

			// set params
			myStmt.setInt(1, trainId);

			// execute statement
			myRs = myStmt.executeQuery();

			// retrieve data from result set row
			if (myRs.next()) {
				String trainNum = myRs.getString("train_no");
				String departure = myRs.getString("departure_station");
				String arrival = myRs.getString("arraival_station");
				String carriage = myRs.getString("carriage");
				int seat = myRs.getInt("seat");
				int price = myRs.getInt("price");

				// use the trainId during construction
				theRailway = new Railway(trainId, trainNum, departure, arrival, carriage, seat, price);
			} else {
				throw new Exception("Could not find train id: " + trainId);
			}

			return theRailway;
		} catch (Exception e) {
			e.printStackTrace();

		}
		return null;
	}

	public void decreaseSeat(String theTrainId) throws Exception {

		Connection myConn = null;
		PreparedStatement myStmt = null;

		try {
			int trainId = Integer.parseInt(theTrainId);

			// get DB connection
			myConn = dataSource.getConnection();

			// create sql update statement
			String sql = "update train_ticket " + "set seat = seat - 1 " + "where id=?";
			// prepare statement
			myStmt = myConn.prepareStatement(sql);

			// set params
			myStmt.setInt(1, trainId);

			// execute sql statement
			myStmt.execute();
			System.out.println("executed");

		} catch (Exception e) {
			e.printStackTrace();

		}

	}
}
