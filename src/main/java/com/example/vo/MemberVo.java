package com.example.vo;

public class MemberVo {
    private String userID, userPass, userName, regDate;
    private int Verify;

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getUserPass() {
        return userPass;
    }

    public void setUserPass(String userPass) {
        this.userPass = userPass;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getRegDate() {
        return regDate;
    }

    public void setRegDate(String regDate) {
        this.regDate = regDate;
    }

    public int getVerify() {
        return Verify;
    }

    public void setVerify(int verify) {
        Verify = verify;
    }
}
