package dto;

import java.util.Date;

public class RoomDTO {
    //링크(resort_id), 메인이미지, 카테고리, 이름, 평점, 가격 보내야댐
    private int room_id;
    private int resort_id;
    private String room_name;
    private String room_type;
    private int room_quantity;
    private int max_guests;
    private int price_per_night;
    private String rmain_img;
    private String rsub_img1;
    private String rsub_img2;
    private String rsub_img3;
    private String description;
    private Date created_at;

    public RoomDTO() {
    }

    public RoomDTO(int room_id, int resort_id, String room_name, String room_type, int room_quantity, int max_guests, int price_per_night, String rmain_img, String rsub_img1, String rsub_img2, String rsub_img3, String description, Date created_at) {
        this.room_id = room_id;
        this.resort_id = resort_id;
        this.room_name = room_name;
        this.room_type = room_type;
        this.room_quantity = room_quantity;
        this.max_guests = max_guests;
        this.price_per_night = price_per_night;
        this.rmain_img = rmain_img;
        this.rsub_img1 = rsub_img1;
        this.rsub_img2 = rsub_img2;
        this.rsub_img3 = rsub_img3;
        this.description = description;
        this.created_at = created_at;
    }

    public int getRoom_id() {
        return room_id;
    }

    public void setRoom_id(int room_id) {
        this.room_id = room_id;
    }

    public int getResort_id() {
        return resort_id;
    }

    public void setResort_id(int resort_id) {
        this.resort_id = resort_id;
    }

    public String getRoom_name() {
        return room_name;
    }

    public void setRoom_name(String room_name) {
        this.room_name = room_name;
    }

    public String getRoom_type() {
        return room_type;
    }

    public void setRoom_type(String room_type) {
        this.room_type = room_type;
    }

    public int getRoom_quantity() {
        return room_quantity;
    }

    public void setRoom_quantity(int room_quantity) {
        this.room_quantity = room_quantity;
    }

    public int getMax_guests() {
        return max_guests;
    }

    public void setMax_guests(int max_guests) {
        this.max_guests = max_guests;
    }

    public int getPrice_per_night() {
        return price_per_night;
    }

    public void setPrice_per_night(int price_per_night) {
        this.price_per_night = price_per_night;
    }

    public String getRmain_img() {
        return rmain_img;
    }

    public void setRmain_img(String rmain_img) {
        this.rmain_img = rmain_img;
    }

    public String getRsub_img1() {
        return rsub_img1;
    }

    public void setRsub_img1(String rsub_img1) {
        this.rsub_img1 = rsub_img1;
    }

    public String getRsub_img2() {
        return rsub_img2;
    }

    public void setRsub_img2(String rsub_img2) {
        this.rsub_img2 = rsub_img2;
    }

    public String getRsub_img3() {
        return rsub_img3;
    }

    public void setRsub_img3(String rsub_img3) {
        this.rsub_img3 = rsub_img3;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Date created_at) {
        this.created_at = created_at;
    }
}
