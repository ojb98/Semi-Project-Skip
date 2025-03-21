package rental.dto;

public class RentCategoryDTO {
    private int item_id;
    private int category_id;
    private int rentalshop_id;
    private String item_name;
    private String item_img;
    private String item_type;
    private String item_detail;
    private int total_quantity;
    private String price_per_hour;

    public RentCategoryDTO() {
    }

    public RentCategoryDTO(String item_detail, int total_quantity, int item_id, int category_id, int rentalshop_id, String item_name, String item_img, String item_type, String price_per_hour) {
        this.item_id = item_id;
        this.category_id = category_id;
        this.rentalshop_id = rentalshop_id;
        this.item_name = item_name;
        this.item_img = item_img;
        this.item_type = item_type;
        this.item_detail = item_detail;
        this.price_per_hour = price_per_hour;
        this.total_quantity = total_quantity;
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

    public int getRentalshop_id() {
        return rentalshop_id;
    }

    public void setRentalshop_id(int rentalshop_id) {
        this.rentalshop_id = rentalshop_id;
    }

    public String getItem_name() {
        return item_name;
    }

    public void setItem_name(String item_name) {
        this.item_name = item_name;
    }

    public String getItem_img() {
        return item_img;
    }

    public void setItem_img(String item_img) {
        this.item_img = item_img;
    }

    public String getItem_type() {
        return item_type;
    }

    public void setItem_type(String item_type) {
        this.item_type = item_type;
    }

    public String getPrice_per_hour() {
        return price_per_hour;
    }

    public void setPrice_per_hour(String price_per_hour) {
        this.price_per_hour = price_per_hour;
    }
}
