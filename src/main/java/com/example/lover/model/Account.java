package com.example.lover.model;

public class Account {
    private int idUser;
    private String userName;
    private String password;
    private String email;
    private int phoneNumber;
    private String identifyCard;
    private String surname;
    private String name;
    private String nickName;
    private String status;
    private int idRole;

    public Account(int idUser, String userName, String password, String email, int phoneNumber, String identifyCard, String surname, String name, String nickName, String status, int idRole) {
        this.idUser = idUser;
        this.userName = userName;
        this.password = password;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.identifyCard = identifyCard;
        this.surname = surname;
        this.name = name;
        this.nickName = nickName;
        this.status = status;
        this.idRole = idRole;
    }

    public Account() {
    }

    public int getIdUser() {
        return idUser;
    }

    public void setIdUser(int idUser) {
        this.idUser = idUser;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(int phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getIdentifyCard() {
        return identifyCard;
    }

    public void setIdentifyCard(String identifyCard) {
        this.identifyCard = identifyCard;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getIdRole() {
        return idRole;
    }

    public void setIdRole(int idRole) {
        this.idRole = idRole;
    }

    @Override
    public String toString() {
        return "Account{" +
                "idUser=" + idUser +
                ", userName='" + userName + '\'' +
                ", password='" + password + '\'' +
                ", email='" + email + '\'' +
                ", phoneNumber=" + phoneNumber +
                ", identifyCard='" + identifyCard + '\'' +
                ", surname='" + surname + '\'' +
                ", name='" + name + '\'' +
                ", nickName='" + nickName + '\'' +
                ", status='" + status + '\'' +
                ", idRole=" + idRole +
                '}';
    }
}
