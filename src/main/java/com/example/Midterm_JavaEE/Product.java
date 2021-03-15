package com.example.Midterm_JavaEE;

public class Product {
    private String flowerType;
    private String color;
    private String price;
    private String season;

    public Product(String flowerType, String color, String price, String season){
        this.flowerType = flowerType;
        this.color = color;
        this.price = price;
        this.season = season;
    }

    public String getFlowerType() {
        return flowerType;
    }

    public void setFlowerType(String flowerType) {
        this.flowerType = flowerType;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getSeason() {
        return season;
    }

    public void setSeason(String season) {
        this.season = season;
    }
}
