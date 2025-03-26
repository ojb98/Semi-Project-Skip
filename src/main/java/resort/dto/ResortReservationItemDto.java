package resort.dto;

public class ResortReservationItemDto {
	private int resortRoomId;
	private int resortReservId;
	private String resortRoomName;
	private String resortRoomType;
	private int pricePerNight;
	private int quantity;
	
	
	public ResortReservationItemDto() {
		
	}


	public ResortReservationItemDto(int resortRoomId,int resortReservId, String resortRoomName, String resortRoomType,
			int pricePerNight, int quantity) {
		super();
		this.resortRoomId = resortRoomId;
		this.resortReservId = resortReservId;		
		this.resortRoomName = resortRoomName;
		this.resortRoomType = resortRoomType;
		this.pricePerNight = pricePerNight;
		this.quantity = quantity;
	}
	
	
	public int getResortReservId() {
		return resortReservId;
	}


	public void setResortReservId(int resortReservId) {
		this.resortReservId = resortReservId;
	}


	public int getResortRoomId() {
		return resortRoomId;
	}

	public void setResortRoomId(int resortRoomId) {
		this.resortRoomId = resortRoomId;
	}

	public String getResortRoomName() {
		return resortRoomName;
	}

	public void setResortRoomName(String resortRoomName) {
		this.resortRoomName = resortRoomName;
	}

	public String getResortRoomType() {
		return resortRoomType;
	}

	public void setResortRoomType(String resortRoomType) {
		this.resortRoomType = resortRoomType;
	}

	public int getPricePerNight() {
		return pricePerNight;
	}

	public void setPricePerNight(int pricePerNight) {
		this.pricePerNight = pricePerNight;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	
	
}
