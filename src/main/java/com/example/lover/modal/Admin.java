package com.example.lover.modal;

public class Admin {
    private int idAdmin;
    private String userName;
    private String password;
    private int permission;

    public Admin() {
    }

    public Admin(int idAdmin, String userName, String password, int permission) {
        this.idAdmin = idAdmin;
        this.userName = userName;
        this.password = password;
        this.permission = permission;
    }


    public int getIdAdmin() {
        return idAdmin;
    }

    public void setIdAdmin(int idAdmin) {
        this.idAdmin = idAdmin;
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

    public int getPermission() {
        return permission;
    }

    public void setPermission(int permission) {
        this.permission = permission;
    }

    @Override
    public String toString() {
        return "Admin{" +
                "idAdmin=" + idAdmin +
                ", userName='" + userName + '\'' +
                ", password='" + password + '\'' +
                ", permission=" + permission +
                '}';
    }
}
