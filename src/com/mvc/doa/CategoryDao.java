package com.mvc.doa;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.mvc.bean.RoomBean;
import com.mvc.bean.UserBean;



public class CategoryDao {

	static Connection con = null;
	static PreparedStatement pst = null;
	static ResultSet rs = null;
	static boolean flag = false;
	private static final String ATM_CARD_PATTERN = "\\b\\d{4}[- ]?\\d{4}[- ]?\\d{4}[- ]?\\d{4}\\b";
	// -------START-----database connection------

	/*
	 * 
	 */
	public static Connection getDbConnection() throws SQLException {
		
		try {
			DBDAO.connect();
			con = DBDAO.getDbCon();

		} catch (ClassNotFoundException cnfe) {
			cnfe.printStackTrace();
		} catch (SQLException sql) {
			sql.printStackTrace();
		}
		return con;
	}
	
	
	
	
	
	public boolean isValidUser(String username, String password) {
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        boolean isValid = false;
        Connection con=null;
        try {
        	con = getDbConnection();
            String query = "SELECT * FROM residentials WHERE res_username=? AND res_password=?";     
            preparedStatement = con.prepareStatement(query);
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, password);
            resultSet = preparedStatement.executeQuery();

          
            while (resultSet.next()) {
                isValid = true;
            }
        } catch (SQLException e) {
            e.printStackTrace(); 
       
 
        }

        return isValid;
    }
	public static  List<RoomBean> getFreeRooms() throws SQLException {
        List<RoomBean> freeRooms = new ArrayList<RoomBean>();
        
        con=getDbConnection();
       
        try {
            
        	 
            String sql = "SELECT room_id FROM room WHERE res_id IS NULL";
            pst = con.prepareStatement(sql);
            rs = pst.executeQuery();

            while (rs.next()) {
            	RoomBean roombean=new RoomBean();
            	roombean.setRoomId(rs.getInt(1));;
            	freeRooms.add(roombean);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } 

        return freeRooms;
    }
	
	
	
	
	  public static boolean validateATMCardNumber(String cardNumber) {
	        
	        Pattern pattern = Pattern.compile(ATM_CARD_PATTERN);
	        
	        Matcher matcher = pattern.matcher(cardNumber);
	        
	        
	        return matcher.matches();
	    }
	  public static boolean AddUser(UserBean userbean) throws SQLException {
			boolean flag = false;
			try {
				con = getDbConnection();
				pst = con.prepareStatement("insert into residentials(res_name,res_phno,res_address,res_username,res_password) values(?,?,?,?,?)");
				pst.setString(1,userbean.getResName());
				pst.setLong(2,userbean.getResPhno());
				pst.setString(3,userbean.getResAddress());
				pst.setString(4,userbean.getResUsername());
				pst.setString(5,userbean.getResPassword());
				
				pst.executeUpdate();
				flag = true;

			} catch (SQLException sql) {
				sql.printStackTrace();
			}
			return flag;
		}

	  
	  
	  
	  public static boolean admission(RoomBean roombean) throws SQLException {
			boolean flag = false;
			try {
				con = getDbConnection();
				pst = con.prepareStatement("UPDATE room SET res_id = ?, join_date = ?, leave_date = ?, rentAmount = ? WHERE room_id = ?");
				pst.setInt(1, roombean.getResId());
				pst.setDate(2,roombean.getJoindate());
				pst.setDate(3, roombean.getLeavedate());
				pst.setFloat(4, roombean.getRentAmount());
				pst.setInt(5,roombean.getRoomId());
				pst.executeUpdate();
				flag = true;

			} catch (SQLException sql) {
				sql.printStackTrace();
			}
			return flag;
		}

		public static int getResidentialIdByName(String resName) throws SQLException {
			    int resId = -1; // Default value if not found
			    
			    try {
			        con = getDbConnection();
			        pst = con.prepareStatement("SELECT res_id FROM residentials WHERE res_name = ?");
			        pst.setString(1, resName);
			        rs = pst.executeQuery();
	
			        if (rs.next()) {
			            resId = rs.getInt("res_id");
			        }
			    } catch (SQLException e) {
			        e.printStackTrace();
			   
			    }
	
			    return resId;
			}
		
		public static List<UserBean> getUserDetailsByUsername(String username) throws SQLException {
	        List<UserBean> userDetailsList = new ArrayList<>();

	        Connection con = null;
	        PreparedStatement pst = null;
	        ResultSet rs = null;

	        try {
	            con = getDbConnection();

	            
	            String sql = "SELECT * FROM users WHERE username = ?";
	            pst = con.prepareStatement(sql);
	            pst.setString(1, username);
	            rs = pst.executeQuery();

	            while (rs.next()) {
	                UserBean userDetails = new UserBean();
	                
	                userDetails.setResName(rs.getString("res_name"));
	                userDetails.setResPhno(rs.getLong("res_phNo"));
	                userDetails.setResAddress(rs.getString("res_Address"));
	                userDetails.setResUsername(rs.getString("res_userName"));
	                userDetails.setResPassword(rs.getString("res_password"));
	               
	                userDetailsList.add(userDetails);
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	       
	        }

	        return userDetailsList;
	    }
	}
