package com.mvc.doa;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBDAO {

	private static Connection dbCon;
	private static String dbURL;
	private static String dbDriver;
	private static String userName;
	private static String passWord;

	// ----------------START--------------database initialization------
	/**
	 * @author : Ribin
	 * @date : 03/04/2024
	 * @version : 1.0
	 * @purpose : Initialize database connection values
	 * @param :
	 *            Nothing
	 * @see : Nothing
	 * @return : Nothing
	 * 
	 */
	private static void dbInit() {
		try {
			dbDriver = "com.mysql.cj.jdbc.Driver";
			dbURL = "jdbc:mysql://localhost:3306/myhostel";
			userName = "root";
			passWord = "mysql";

		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
	
	// ----------------END--------------database initialization------

	// --------------START----------database connection ------------
	/**
	 *
	 * @author: Ribin Raju
	 * @Date:
	 * @version : 1.0
	 * @purpose : database connection
	 * @param :
	 *            Nothing
	 * @throws :
	 *             Exception in case of missing driver class
	 * @return: Connection
	 */

	public static void connect() throws ClassNotFoundException, SQLException {
		dbInit();
		Connection con = null;
		try {
			Class.forName(dbDriver);
			con = DriverManager.getConnection(dbURL, userName, passWord);
			setDbCon(con);

		} catch (ClassNotFoundException cnfe) {
			cnfe.printStackTrace();
		} catch (SQLException sql) {
			sql.printStackTrace();
		}
	}

	// --------------END----------database connection ------------
	
	
	
	
	// --------------START----------get db connection ------------
	/**
	 *
	 * @author : Amarnath
	 * @date :
	 * @version: 1.0
	 * @purpose: Get Connection
	 * @param :Nothing
	 * @return : Connection
	 */

	public static Connection getDbCon() {
		return dbCon;
	}
	// ------------------END-------------get connection---------

	
	
	// --------------START----------set db connection ------------

	/**
	 *
	 * @author : RibinRaju
	 * @date :
	 * @version: 1.0
	 * @purpose: Set Connection
	 * @param : Connection
	 * @return : Nothing
	 */

	public static void setDbCon(Connection con) {
		dbCon = con;
	}
	// ------------------END-------------set connection---------
	
	
	
	
	//--------------START----------close connection ------------

	/**
	*
	* @author : Amarnath
	* @date :
	* @version: 1.0
	* @purpose: Close connection
	* @param : Nothing
	* @throws :Exception in case of closing connection
	* @return : Nothing
	*/

	public static void close()throws SQLException{
	dbCon.close();
	}
	//------------------END-------------closing connection---------
	
}
