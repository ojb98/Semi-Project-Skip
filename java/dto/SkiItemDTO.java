package dto;

import java.util.Date;

public class SkiItemDTO {
    private int item_id;
    private int category_id;
    private int ski_id;
    private String item_name;
    private String item_detail;
    private int total_quantity;
    private String item_img;
    private Date created_at;

    public SkiItemDTO() {
    }

    public SkiItemDTO(int item_id, int category_id, int ski_id, String item_name, String item_detail, int total_quantity, String item_img, Date created_at) {
        this.item_id = item_id;
        this.category_id = category_id;
        this.ski_id = ski_id;
        this.item_name = item_name;
        this.item_detail = item_detail;
        this.total_quantity = total_quantity;
        this.item_img = item_img;
        this.created_at = created_at;
    }

    public int getItem_id() {
        return item_id;
    }

    public void setItem_id(int item_id) {
        this.item_id = item_id;
    }

    public int getCategory_id() {
        return category_id;
    }

    public void setCategory_id(int category_id) {
        this.category_id = category_id;
    }

    public int getSki_id() {
        return ski_id;
    }

    public void setSki_id(int ski_id) {
        this.ski_id = ski_id;
    }

    public String getItem_name() {
        return item_name;
    }

    public void setItem_name(String item_name) {
        this.item_name = item_name;
    }

    public String getItem_detail() {
        return item_detail;
    }

    public void setItem_detail(String item_detail) {
        this.item_detail = item_detail;
    }

    public int getTotal_quantity() {
        return total_quantity;
    }

    public void setTotal_quantity(int total_quantity) {
        this.total_quantity = total_quantity;
    }

    public String getItem_img() {
        return item_img;
    }

    public void setItem_img(String item_img) {
        this.item_img = item_img;
    }

    public Date getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Date created_at) {
        this.created_at = created_at;
    }
}
