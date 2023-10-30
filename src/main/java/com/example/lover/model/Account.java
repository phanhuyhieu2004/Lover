package com.example.lover.model;

public class Account {
    private int idAccount;
    private String accountName;
    private String password;
    private String email;
    private String phoneNumber;
    private String identifyCard;
    private String surname;
    private String name;
    private String nickName;
    private String status;


    public Account(int idAccount, String accountName, String password, String email, String phoneNumber, String identifyCard, String surname, String name, String nickName, String status) {
        this.idAccount = idAccount;
        this.accountName = accountName;
        this.password = password;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.identifyCard = identifyCard;
        this.surname = surname;
        this.name = name;
        this.nickName = nickName;
        this.status = status;

    }

    public Account() {
    }

    public Account(String accountName, String password, String email, String phoneNumber, String identifyCard, String surname, String name, String nickName) {
    }



    public int getIdAccount() {
        return idAccount;
    }

    public void setIdAccount(int idAccount) {
        this.idAccount = idAccount;
    }

    public String getAccountName() {
        return accountName;
    }

    public void setAccountName(String accountName) {
        this.accountName = accountName;
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

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }



    @Override
    public String toString() {
        return "Account{" +
                "idAccount=" + idAccount +
                ", accountName='" + accountName + '\'' +
                ", password='" + password + '\'' +
                ", email='" + email + '\'' +
                ", phoneNumber=" + phoneNumber +
                ", identifyCard='" + identifyCard + '\'' +
                ", surname='" + surname + '\'' +
                ", name='" + name + '\'' +
                ", nickName='" + nickName + '\'' +
                ", status='" + status + '\'' +

                '}';
    }
}
