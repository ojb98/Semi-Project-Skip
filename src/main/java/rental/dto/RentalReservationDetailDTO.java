package rental.dto;

import java.sql.Date;

public class RentalReservationDetailDTO {
	private int itemId;
    private String categoryId;
    private String itemImg;
    private String itemName;
    private String quantity; 	//유저가 담은수량
    private String subtotalPrice;
    private String totalQuantity; //아이템총수량
    
    
    public RentalReservationDetailDTO() {}
	public RentalReservationDetailDTO(int itemId, String categoryId, String itemImg, String itemName, String quantity,
			String subtotalPrice, String totalQuantity) {
		super();
		this.itemId = itemId;
		this.categoryId = categoryId;
		this.itemImg = itemImg;
		this.itemName = itemName;
		this.quantity = quantity;
		this.subtotalPrice = subtotalPrice;
		this.totalQuantity = totalQuantity;
	}



	public int getItemId() {
		return itemId;
	}

	public void setItemId(int itemId) {
		this.itemId = itemId;
	}

	public String getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(String categoryId) {
		this.categoryId = categoryId;
	}

	public String getItemImg() {
		return itemImg;
	}

	public void setItemImg(String itemImg) {
		this.itemImg = itemImg;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public String getQuantity() {
		return quantity;
	}

	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}

	public String getSubtotalPrice() {
		return subtotalPrice;
	}

	public void setSubtotalPrice(String subtotalPrice) {
		this.subtotalPrice = subtotalPrice;
	}

	public String getTotalQuantity() {
		return totalQuantity;
	}

	public void setTotalQuantity(String totalQuantity) {
		this.totalQuantity = totalQuantity;
	}
    
	
}
