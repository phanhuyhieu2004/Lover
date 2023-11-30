package com.example.lover2.model;

public class ServiceCategory {
    private int idServiceCategory;
    private String serviceNameCategory;


    public ServiceCategory() {
    }

    public ServiceCategory(int idServiceCategory, String serviceNameCategory) {
        this.idServiceCategory = idServiceCategory;
        this.serviceNameCategory = serviceNameCategory;
    }

    public int getIdServiceCategory() {
        return idServiceCategory;
    }

    public void setIdServiceCategory(int idServiceCategory) {
        this.idServiceCategory = idServiceCategory;
    }

    public String getServiceNameCategory() {
        return serviceNameCategory;
    }

    public void setServiceNameCategory(String serviceNameCategory) {
        this.serviceNameCategory = serviceNameCategory;
    }

    @Override
    public String toString() {
        return "ServiceCategory{" +
                "idServiceCategory=" + idServiceCategory +
                ", serviceNameCategory='" + serviceNameCategory + '\'' +
                '}';
    }
}
