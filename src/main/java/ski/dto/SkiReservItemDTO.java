package ski.dto;

public class SkiReservItemDTO {
	private int ski_item_id;
	private int ski_reserv_id;
	private int item_id; 
	private int quantity;  //수량
	private double subtotal_price;  //총가격

	public SkiReservItemDTO() {}

	public SkiReservItemDTO(int ski_item_id, int ski_reserv_id, int item_id, int quantity, double subtotal_price) {
		super();
		this.ski_item_id = ski_item_id;
		this.ski_reserv_id = ski_reserv_id;
		this.item_id = item_id;
		this.quantity = quantity;
		this.subtotal_price = subtotal_price;
	}

	public int getSki_item_id() {
		return ski_item_id;
	}

	public void setSki_item_id(int ski_item_id) {
		this.ski_item_id = ski_item_id;
	}

	public int getSki_reserv_id() {
		return ski_reserv_id;
	}

	public void setSki_reserv_id(int ski_reserv_id) {
		this.ski_reserv_id = ski_reserv_id;
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

	public double getSubtotal_price() {
		return subtotal_price;
	}

	public void setSubtotal_price(double subtotal_price) {
		this.subtotal_price = subtotal_price;
	}

	@Override
	public String toString() {
		return "SkiReservItemDTO [ski_item_id=" + ski_item_id + ", ski_reserv_id=" + ski_reserv_id + ", item_id="
				+ item_id + ", quantity=" + quantity + ", subtotal_price=" + subtotal_price + "]";
	}
	
	
}
