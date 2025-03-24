package ski.dto;

public class SkiReservationItemDto {
	private int ski_item_id;
	private int ski_reserv_id;
	private int item_id;
	private String item_name;
	private int quantity;
	private int subtotal_price;
	
	public SkiReservationItemDto() {
		
	}

	public SkiReservationItemDto(int ski_item_id, int ski_reserv_id, int item_id, String item_name, int quantity,
			int subtotal_price) {
		super();
		this.ski_item_id = ski_item_id;
		this.ski_reserv_id = ski_reserv_id;
		this.item_id = item_id;
		this.item_name = item_name;
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

	public String getItem_name() {
		return item_name;
	}

	public void setItem_name(String item_name) {
		this.item_name = item_name;
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
