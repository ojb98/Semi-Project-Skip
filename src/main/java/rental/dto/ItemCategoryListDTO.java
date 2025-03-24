package rental.dto;

import java.util.List;

public class ItemCategoryListDTO {
	private int category_id;
	private String item_type;
	private int price_per_hour;   //시간당 대여 가격	
	private List<RentItemDTO> itemesDto;
	
	public ItemCategoryListDTO() {}

	public ItemCategoryListDTO(int category_id, String item_type, int price_per_hour, List<RentItemDTO> itemesDto) {
		super();
		this.category_id = category_id;
		this.item_type = item_type;
		this.price_per_hour = price_per_hour;
		this.itemesDto = itemesDto;
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

	public List<RentItemDTO> getItemesDto() {
		return itemesDto;
	}

	public void setItemesDto(List<RentItemDTO> itemesDto) {
		this.itemesDto = itemesDto;
	}

	@Override
	public String toString() {
		return "ItemCategoryListDTO [category_id=" + category_id + ", item_type=" + item_type + ", price_per_hour="
				+ price_per_hour + ", itemesDto=" + itemesDto + "]";
	}
	
	
}
