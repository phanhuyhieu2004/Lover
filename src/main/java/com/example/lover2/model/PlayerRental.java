package com.example.lover2.model;

import java.time.LocalDateTime;

public class PlayerRental {
    private int rentalId;
    private int playerId;
    private int accountId;
    private int rentalHours;
    private LocalDateTime rentalDate;
    private int totalAmount;

    public PlayerRental() {
    }

    public PlayerRental(int rentalId, int playerId, int accountId, int rentalHours, LocalDateTime rentalDate, int totalAmount) {
        this.rentalId = rentalId;
        this.playerId = playerId;
        this.accountId = accountId;
        this.rentalHours = rentalHours;
        this.rentalDate = LocalDateTime.now();
        this.totalAmount = totalAmount;
    }

    public int getRentalId() {
        return rentalId;
    }

    public void setRentalId(int rentalId) {
        this.rentalId = rentalId;
    }

    public int getPlayerId() {
        return playerId;
    }

    public void setPlayerId(int playerId) {
        this.playerId = playerId;
    }

    public int getAccountId() {
        return accountId;
    }

    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }

    public int getRentalHours() {
        return rentalHours;
    }

    public void setRentalHours(int rentalHours) {
        this.rentalHours = rentalHours;
    }

    public LocalDateTime getRentalDate() {
        return rentalDate;
    }

    public void setRentalDate(LocalDateTime rentalDate) {
        this.rentalDate = rentalDate;
    }

    public int getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(int totalAmount) {
        this.totalAmount = totalAmount;
    }
}
