/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Asus
 */
public class Order {

    private int order_id;
    private String date;
    private int customer_id;
    private int totalmoney;
    private int store_id;
    private String status;
    private String customer_address;
    private String customer_phone;
    private String paymentStatus;

    public Order(int order_id, String date, int customer_id, int totalmoney,
            int store_id, String status, String customer_address, String customer_phone, String paymentStatus) {
        this.order_id = order_id;
        this.date = date;
        this.customer_id = customer_id;
        this.totalmoney = totalmoney;
        this.store_id = store_id;
        this.status = status;
        this.customer_address = customer_address;
        this.customer_phone = customer_phone;
        this.paymentStatus = paymentStatus;
    }

    public Order() {
    }

    public String getCustomer_address() {
        return customer_address;
    }

    public String getPaymentStatus() {
        return paymentStatus;
    }

    public void setPaymentStatus(String paymentStatus) {
        this.paymentStatus = paymentStatus;
    }

    public String getCustomer_phone() {
        return customer_phone;
    }

    public void setCustomer_phone(String customer_phone) {
        this.customer_phone = customer_phone;
    }

    public void setCustomer_address(String customer_address) {
        this.customer_address = customer_address;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getStore_id() {
        return store_id;
    }

    public void setStore_id(int store_id) {
        this.store_id = store_id;
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public int getCustomer_id() {
        return customer_id;
    }

    public void setCustomer_id(int customer_id) {
        this.customer_id = customer_id;
    }

    public int getTotalmoney() {
        return totalmoney;
    }

    public void setTotalmoney(int totalmoney) {
        this.totalmoney = totalmoney;
    }

    @Override
    public String toString() {
        return "Order{" + "order_id=" + order_id + ", date=" + date + ", customer_id=" + customer_id + ", totalmoney=" + totalmoney + '}';
    }

}
