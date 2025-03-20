package dto;

public class SkiCategoryDTO {
    private int item_id;
    private int category_id;
    private int ski_id;
    private String item_name;
    private String item_img;
    private String item_type;
    private String price_per_hour;

    public SkiCategoryDTO() {
    }

    public SkiCategoryDTO(int item_id, int category_id, int ski_id, String item_name, String item_img, String item_type, String price_per_hour) {
        this.item_id = item_id;
        this.category_id = category_id;
        this.ski_id = ski_id;
        this.item_name = item_name;
        this.item_img = item_img;
        this.item_type = item_type;
        this.price_per_hour = price_per_hour;
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
