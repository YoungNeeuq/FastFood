/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.List;

/**
 *
 * @author Asus
 */
public class DeliveryPerson {

    private int delivery_id;
    private String name;
    private String phonenNumber;
    private String deliveryUnit;
    private String username;
    private String password;
    private String role;

    public DeliveryPerson() {
    }

    public DeliveryPerson(int delivery_id, String name, String phonenNumber,
            String deliveryUnit, String username,
            String password, String role) {
        this.delivery_id = delivery_id;
        this.name = name;
        this.phonenNumber = phonenNumber;
        this.deliveryUnit = deliveryUnit;
        this.username = username;
        this.password = password;
        this.role = role;
    }

    public int getDelivery_id() {
        return delivery_id;
    }

    public String getUsername() {
        return username;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setDelivery_id(int delivery_id) {
        this.delivery_id = delivery_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhonenNumber() {
        return phonenNumber;
    }

    public void setPhonenNumber(String phonenNumber) {
        this.phonenNumber = phonenNumber;
    }

    public String getDeliveryUnit() {
        return deliveryUnit;
    }

    public void setDeliveryUnit(String deliveryUnit) {
        this.deliveryUnit = deliveryUnit;
    }

    public String getNameById(List<DeliveryPerson> list, int id) {

        String name = null;
        for (DeliveryPerson d : list) {
            if (d.getDelivery_id() == id) {
                return d.getName();
            }
        }
        return name;
    }

    @Override
    public String toString() {
        return "DeliveryPerson{" + "delivery_id=" + delivery_id + ", name=" + name + ", phonenNumber=" + phonenNumber + ", deliveryUnit=" + deliveryUnit + '}';
    }

}
