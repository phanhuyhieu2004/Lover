package com.example.lover.modal;

public class User {
    private int idUser;
    private String userName;
    private String password;
    private String email;
    private String phoneNumber;
    private String identifyCard;
    private String surname;
    private String name;
    private String nickName;
    private boolean status;
    private int permission;

    public User() {
    }
    public User(int idUser, String userName, String password, String email, String phoneNumber, String identifyCard, String surname, String name, String nickName, boolean status, int permission) {
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
        this.permission = permission;
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

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
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

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public int getPermission() {
        return permission;
    }

    public void setPermission(int permission) {
        this.permission = permission;
    }

    @Override
    public String toString() {
        return "User{" +
                "idUser=" + idUser +
                ", userName='" + userName + '\'' +
                ", password='" + password + '\'' +
                ", email='" + email + '\'' +
                ", phoneNumber='" + phoneNumber + '\'' +
                ", identifyCard='" + identifyCard + '\'' +
                ", surname='" + surname + '\'' +
                ", name='" + name + '\'' +
                ", nickName='" + nickName + '\'' +
                ", status=" + status +
                ", permission=" + permission +
                '}';
    }
}
