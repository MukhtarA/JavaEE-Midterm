package com.example.Midterm_JavaEE;

import java.time.LocalDate;

public class Client {
    private int id;
    private String name;
    private String surname;
    private LocalDate birthday;
    private String address;
    private String orderstatus;

    public Client(int id, String name, String surname, LocalDate birthday, String address, String orderstatus) {
        this.id = id;
        this.name = name;
        this.surname = surname;
        this.birthday = birthday;
        this.address = address;
        this.orderstatus = orderstatus;
    }

    public Client(String name, String surname, LocalDate birthday, String address, String orderstatus) {
        this.name = name;
        this.surname = surname;
        this.birthday = birthday;
        this.address = address;
        this.orderstatus = orderstatus;
    }

    public Client() {

    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public LocalDate getBirthday() {
        return birthday;
    }

    public void setBirthday(LocalDate birthday) {
        this.birthday = birthday;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getOrderstatus() {
        return orderstatus;
    }

    public void setOrderstatus(String orderstatus) {
        this.orderstatus = orderstatus;
    }

}
