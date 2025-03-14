package dto;

public class CartItemDTO {
    int cart_id;
    int uuid;
    String category;
    int ref_id;
    int quantity;
    int price;

    public CartItemDTO() {
    }

    public CartItemDTO(int cart_id, int uuid, String category, int ref_id, int quantity, int price) {
        this.cart_id = cart_id;
        this.uuid = uuid;
        this.category = category;
        this.ref_id = ref_id;
        this.quantity = quantity;
        this.price = price;
    }

    public int getCart_id() {
        return cart_id;
    }

    public void setCart_id(int cart_id) {
        this.cart_id = cart_id;
    }

    public int getUuid() {
        return uuid;
    }

    public void setUuid(int uuid) {
        this.uuid = uuid;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public int getRef_id() {
        return ref_id;
    }

    public void setRef_id(int ref_id) {
        this.ref_id = ref_id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }
}
