package com.example.lovers.model;

public class AccountDetail {
    private int idDetail;


    private String dateOfBirth;
    private String fullName;
    private String gender;
    private String city;


    private String nationality;
    private String avatar;
    private String portrait;
    private String portrait1;
    private String portrait2;


    private String height;
    private String weight;
    private String interest;
    private String describeYourself;


    private String requestWithUser;
    private String facebook;


    private String joinDate;
private int numberOfRentals;
    private int account_id;
    private String price;
    private int view;

    public int getNumberOfRentals() {
        return numberOfRentals;
    }

    public void setNumberOfRentals(int numberOfRentals) {
        this.numberOfRentals = numberOfRentals;
    }

    public int getView() {
        return view;
    }

    public void setView(int view) {
        this.view = view;
    }

    public String getDescribeYourself() {
        return describeYourself;
    }

    public void setDescribeYourself(String describeYourself) {
        this.describeYourself = describeYourself;
    }

    public String getPortrait1() {
        return portrait1;
    }

    public void setPortrait1(String portrait1) {
        this.portrait1 = portrait1;
    }

    public String getPortrait2() {
        return portrait2;
    }

    public void setPortrait2(String portrait2) {
        this.portrait2 = portrait2;
    }

    public String getRequestWithUser() {
        return requestWithUser;
    }

    public void setRequestWithUser(String requestWithUser) {
        this.requestWithUser = requestWithUser;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }


    public int getAccount_id() {
        return account_id;
    }

    public void setAccount_id(int account_id) {
        this.account_id = account_id;
    }

    public int getIdDetail() {
        return idDetail;
    }

    public void setIdDetail(int idDetail) {
        this.idDetail = idDetail;
    }

    public String getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(String dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getNationality() {
        return nationality;
    }

    public void setNationality(String nationality) {
        this.nationality = nationality;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getPortrait() {
        return portrait;
    }

    public void setPortrait(String portrait) {
        this.portrait = portrait;
    }

    public String getHeight() {
        return height;
    }

    public void setHeight(String height) {
        this.height = height;
    }

    public String getWeight() {
        return weight;
    }

    public void setWeight(String weight) {
        this.weight = weight;
    }

    public String getInterest() {
        return interest;
    }

    public void setInterest(String interest) {
        this.interest = interest;
    }


    public String getFacebook() {
        return facebook;
    }

    public void setFacebook(String facebook) {
        this.facebook = facebook;
    }

    public String getJoinDate() {
        return joinDate;
    }

    public void setJoinDate(String joinDate) {
        this.joinDate = joinDate;
    }

    public AccountDetail() {
    }

    public AccountDetail(int idDetail, String dateOfBirth, String fullName, String gender, String city, String nationality, String avatar, String portrait, String portrait1, String portrait2, String height, String weight, String interest, String describeYourself, String requestWithUser, String facebook, String joinDate, int numberOfRentals, int account_id, String price, int view) {
        this.idDetail = idDetail;
        this.dateOfBirth = dateOfBirth;
        this.fullName = fullName;
        this.gender = gender;
        this.city = city;
        this.nationality = nationality;
        this.avatar = avatar;
        this.portrait = portrait;
        this.portrait1 = portrait1;
        this.portrait2 = portrait2;
        this.height = height;
        this.weight = weight;
        this.interest = interest;
        this.describeYourself = describeYourself;
        this.requestWithUser = requestWithUser;
        this.facebook = facebook;
        this.joinDate = joinDate;
        this.numberOfRentals = numberOfRentals;
        this.account_id = account_id;
        this.price = price;
        this.view = view;
    }

    @Override
    public String toString() {
        return "AccountDetail{" +
                "idDetail=" + idDetail +
                ", dateOfBirth='" + dateOfBirth + '\'' +
                ", fullName='" + fullName + '\'' +
                ", gender='" + gender + '\'' +
                ", city='" + city + '\'' +
                ", nationality='" + nationality + '\'' +
                ", avatar='" + avatar + '\'' +
                ", portrait='" + portrait + '\'' +
                ", portrait1='" + portrait1 + '\'' +
                ", portrait2='" + portrait2 + '\'' +
                ", height='" + height + '\'' +
                ", weight='" + weight + '\'' +
                ", interest='" + interest + '\'' +
                ", describeYourself='" + describeYourself + '\'' +
                ", requestWithUser='" + requestWithUser + '\'' +
                ", facebook='" + facebook + '\'' +
                ", joinDate='" + joinDate + '\'' +
                ", numberOfRentals=" + numberOfRentals +
                ", account_id=" + account_id +
                ", price='" + price + '\'' +
                ", view=" + view +
                '}';
    }
}
