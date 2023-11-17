package com.example.lovers.model;

public class Service {
    private int idService;
    private String serviceName;

    public Service(int idService, String serviceName) {
        this.idService = idService;
        this.serviceName = serviceName;
    }

    public Service() {

    }

    public int getIdService() {
        return idService;
    }

    public void setIdService(int idService) {
        this.idService = idService;
    }

    public String getServiceName() {
        return serviceName;
    }

    public void setServiceName(String serviceName) {
        this.serviceName = serviceName;
    }

    @Override
    public String toString() {
        return "Service{" +
                "idService=" + idService +
                ", serviceName='" + serviceName + '\'' +
                '}';
    }
}
