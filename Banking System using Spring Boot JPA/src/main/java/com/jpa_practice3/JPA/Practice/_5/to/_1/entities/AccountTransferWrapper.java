package com.jpa_practice3.JPA.Practice._5.to._1.entities;


public class AccountTransferWrapper {
    private String fromaccount;
    private String toaccount;
    private float amount;

    public AccountTransferWrapper() {}

    public AccountTransferWrapper(String fromaccount, String toaccount, float amount) {
        this.fromaccount = fromaccount;
        this.toaccount = toaccount;
        this.amount = amount;
    }

    public String getFromaccount() {
        return fromaccount;
    }

    public void setFromaccount(String fromaccount) {
        this.fromaccount = fromaccount;
    }

    public String getToaccount() {
        return toaccount;
    }

    public void setToaccount(String toaccount) {
        this.toaccount = toaccount;
    }

    public float getAmount() {
        return amount;
    }

    public void setAmount(float amount) {
        this.amount = amount;
    }
}
