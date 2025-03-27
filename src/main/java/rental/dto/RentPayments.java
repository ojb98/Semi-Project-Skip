package rental.dto;

import java.util.Date;

public class RentPayments {
    private int payment_id;
    private int rent_reserv_id;
    private int uuid;
    private int total_price;
    private String payment_method;
    private String status;
    private String imp_uid;
    private int card_num;
    private String card_name;
    private Date created_at;

    public RentPayments() {
    }

    public RentPayments(int payment_id, int rent_reserv_id, int uuid, int total_price, String payment_method, String status, String imp_uid, int card_num, String card_name, Date created_at) {
        this.payment_id = payment_id;
        this.rent_reserv_id = rent_reserv_id;
        this.uuid = uuid;
        this.total_price = total_price;
        this.payment_method = payment_method;
        this.status = status;
        this.imp_uid = imp_uid;
        this.card_num = card_num;
        this.card_name = card_name;
        this.created_at = created_at;
    }

    public int getPayment_id() {
        return payment_id;
    }

    public void setPayment_id(int payment_id) {
        this.payment_id = payment_id;
    }

    public int getRent_reserv_id() {
        return rent_reserv_id;
    }

    public void setRent_reserv_id(int rent_reserv_id) {
        this.rent_reserv_id = rent_reserv_id;
    }

    public int getUuid() {
        return uuid;
    }

    public void setUuid(int uuid) {
        this.uuid = uuid;
    }

    public int getTotal_price() {
        return total_price;
    }

    public void setTotal_price(int total_price) {
        this.total_price = total_price;
    }

    public String getPayment_method() {
        return payment_method;
    }

    public void setPayment_method(String payment_method) {
        this.payment_method = payment_method;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getImp_uid() {
        return imp_uid;
    }

    public void setImp_uid(String imp_uid) {
        this.imp_uid = imp_uid;
    }

    public int getCard_num() {
        return card_num;
    }

    public void setCard_num(int card_num) {
        this.card_num = card_num;
    }

    public String getCard_name() {
        return card_name;
    }

    public void setCard_name(String card_name) {
        this.card_name = card_name;
    }

    public Date getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Date created_at) {
        this.created_at = created_at;
    }
}
