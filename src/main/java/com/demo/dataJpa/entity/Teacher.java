package com.demo.dataJpa.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class Teacher {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int idNumber;
	private String teacherName;
	private int mobileNumber;
	private String emailId;
	private String subjectName;
	public int getIdNumber() {
		return idNumber;
	}
	public void setIdNumber(int idNumber) {
		this.idNumber = idNumber;
	}
	public String getTeacherName() {
		return teacherName;
	}
	public void setTeacherName(String teacherName) {
		this.teacherName = teacherName;
	}
	public int getMobileNumber() {
		return mobileNumber;
	}
	public void setMobileNumber(int mobileNumber) {
		this.mobileNumber = mobileNumber;
	}
	public String getEmailId() {
		return emailId;
	}
	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}
	public String getSubjectName() {
		return subjectName;
	}
	public void setSubjectName(String subjectName) {
		this.subjectName = subjectName;
	}
	
	public Teacher(int idNumber, String teacherName, int mobileNumber, String emailId, String subjectName) {
		super();
		this.idNumber = idNumber;
		this.teacherName = teacherName;
		this.mobileNumber = mobileNumber;
		this.emailId = emailId;
		this.subjectName = subjectName;
	}
	
	@Override
	public String toString() {
		return "Teacher [idNumber=" + idNumber + ", teacherName=" + teacherName + ", mobileNumber=" + mobileNumber
				+ ", emailId=" + emailId + ", subjectName=" + subjectName + "]";
	}
	

}

