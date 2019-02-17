package com.sxt.bean;

public class Customer {

    Integer id;

    String name;

    String phone;

    String industry;

    String companysize;

    String des;

    public Customer() {
    }

    public Customer(Integer id, String name, String phone, String industry, String companysize, String des) {
        this.id = id;
        this.name = name;
        this.phone = phone;
        this.industry = industry;
        this.companysize = companysize;
        this.des = des;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getIndustry() {
        return industry;
    }

    public void setIndustry(String industry) {
        this.industry = industry;
    }

    public String getCompanysize() {
        return companysize;
    }

    public void setCompanysize(String companysize) {
        this.companysize = companysize;
    }

    public String getDes() {
        return des;
    }

    public void setDes(String des) {
        this.des = des;
    }

    @Override
    public String toString() {
        return "Customer{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", phone='" + phone + '\'' +
                ", industry='" + industry + '\'' +
                ", companysize='" + companysize + '\'' +
                ", des='" + des + '\'' +
                '}';
    }
}
