package rental.dto;

public class ItemCategoryDTO {
    private int category_id;
    private String item_type;
    private int price_per_hour;

    public ItemCategoryDTO() {
    }

    public ItemCategoryDTO(int category_id, String item_type, int price_per_hour) {
        this.category_id = category_id;
        this.item_type = item_type;
        this.price_per_hour = price_per_hour;
    }

    public int getCategory_id() {
        return category_id;
    }

    public void setCategory_id(int category_id) {
        this.category_id = category_id;
    }

    public String getItem_type() {
        return item_type;
    }

    public void setItem_type(String item_type) {
        this.item_type = item_type;
    }

    public int getPrice_per_hour() {
        return price_per_hour;
    }

    public void setPrice_per_hour(int price_per_hour) {
        this.price_per_hour = price_per_hour;
    }
}
