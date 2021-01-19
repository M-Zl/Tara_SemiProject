package com.kh.mvc.member.model.vo;

import java.sql.Date;

public class Member {

   private int userNo;

   private int rowNum;
   
   private String userId;

   private String userPwd;

   private String userName;


   private String phone;

   private String email;

   private int userRole;

   private String address;

   private String userimg;
//   private String userOriginalFileName; //파일명 어떻게 저장할건지 확인하기
//   private String userRenameFileName;

   private String travel;

   private Date createDate;

   private Date modifyDate;
   
   private String status;

   public Member() {
   }


   public Member(int userNo, String userId, String userPwd, String userName, String phone, String email, int userRole,
         String address, String userimg, String travel, Date createDate, Date modifyDate, String status) {
      super();
      this.userNo = userNo;
      this.userId = userId;
      this.userPwd = userPwd;
      this.userName = userName;
      this.phone = phone;
      this.email = email;
      this.userRole = userRole;
      this.address = address;
      this.userimg = userimg;
      this.travel = travel;
      this.createDate = createDate;
      this.modifyDate = modifyDate;
      this.status = status;
   }


   public int getRowNum() {
      return rowNum;
   }


   public void setRowNum(int rowNum) {
      this.rowNum = rowNum;
   }


   public int getUserNo() {
      return userNo;
   }

   public void setUserNo(int userNo) {
      this.userNo = userNo;
   }

   public String getUserId() {
      return userId;
   }

   public void setUserId(String userId) {
      this.userId = userId;
   }

   public String getUserPwd() {
      return userPwd;
   }

   public void setUserPwd(String userPwd) {
      this.userPwd = userPwd;
   }

   public String getUserName() {
      return userName;
   }

   public void setUserName(String userName) {
      this.userName = userName;
   }


   public String getPhone() {
      return phone;
   }

   public void setPhone(String phone) {
      this.phone = phone;
   }

   public String getEmail() {
      return email;
   }

   public void setEmail(String email) {
      this.email = email;
   }

   public int getUserRole() {
      return userRole;
   }

   public void setUserRole(int userRole) {
      this.userRole = userRole;
   }

   public String getAddress() {
      return address;
   }

   public void setAddress(String address) {
      this.address = address;
   }

   public String getUserimg() {
      return userimg;
   }

   public void setUserimg(String userimg) {
      this.userimg = userimg;
   }

   public String getTravel() {
      return travel;
   }

   public void setTravel(String travel) {
      this.travel = travel;
   }

   public Date getCreateDate() {
      return createDate;
   }

   public void setCreateDate(Date createDate) {
      this.createDate = createDate;
   }

   public Date getModifyDate() {
      return modifyDate;
   }

   public void setModifyDate(Date modifyDate) {
      this.modifyDate = modifyDate;
   }

   public String getStatus() {
      return status;
   }


   public void setStatus(String status) {
      this.status = status;
   }


   @Override
   public String toString() {
      return "Member [userNo=" + userNo + ", rowNum=" + rowNum + ", userId=" + userId + ", userPwd=" + userPwd
            + ", userName=" + userName + ", phone=" + phone + ", email=" + email + ", userRole=" + userRole
            + ", address=" + address + ", userimg=" + userimg + ", travel=" + travel + ", createDate=" + createDate
            + ", modifyDate=" + modifyDate + ", status=" + status + "]";
   }


   

}
