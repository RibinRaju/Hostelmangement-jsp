package com.mvc.bean;

import java.sql.Date;

public class RoomBean {
	
	/*
	 * Author : Amarnath
	 * Date : 19/03/2024
	 * Version : 1.0
	 * Purpose : Bean/Model class for Category Table
	 */
	
	private int roomId;
	private  int resId;
	private Date joindate;
	private Date leavedate;
	private float rentAmount;
	public int getRoomId() {
		return roomId;
	}
	public void setRoomId(int roomId) {
		this.roomId = roomId;
	}
	public int getResId() {
		return resId;
	}
	public void setResId(int resId) {
		this.resId = resId;
	}
	public Date getJoindate() {
		return joindate;
	}
	public void setJoindate(Date joindate) {
		this.joindate = joindate;
	}
	public Date getLeavedate() {
		return leavedate;
	}
	public void setLeavedate(Date leavedate) {
		this.leavedate = leavedate;
	}
	public float getRentAmount() {
		return rentAmount;
	}
	public void setRentAmount(float rentAmount) {
		this.rentAmount = rentAmount;
	}
	
}

