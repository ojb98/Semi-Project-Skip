package rental.dto;

public class RentReservationItemDTO {

    private int rent_item_id;
    private int rent_reserv_id;
    private int item_id;
    private int quantity;
    private int subtotal_price;

    public RentReservationItemDTO() {
    }

    public RentReservationItemDTO(int rent_item_id, int rent_reserv_id, int item_id, int quantity, int subtotal_price) {
        this.rent_item_id = rent_item_id;
        this.rent_reserv_id = rent_reserv_id;
        this.item_id = item_id;
        this.quantity = quantity;
        this.subtotal_price = subtotal_price;
    }

    public int getRent_item_id() {
        return rent_item_id;
    }

    public void setRent_item_id(int rent_item_id) {
        this.rent_item_id = rent_item_id;
    }

    public int getRent_reserv_id() {
        return rent_reserv_id;
    }

    public void setRent_reserv_id(int rent_reserv_id) {
        this.rent_reserv_id = rent_reserv_id;
    }

    public int getItem_id() {
        return item_id;
    }

    public void setItem_id(int item_id) {
        this.item_id = item_id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getSubtotal_price() {
        return subtotal_price;
    }

    public void setSubtotal_price(int subtotal_price) {
        this.subtotal_price = subtotal_price;
    }
}
