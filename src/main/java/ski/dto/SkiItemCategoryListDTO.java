package ski.dto;

import java.util.List;

public class SkiItemCategoryListDTO {
	private int category_id;
	private String item_type;
	private int price_per_hour;   //시간당 대여 가격	
	private List<SkiItemDTO> skiItemDto;
	
	public SkiItemCategoryListDTO() {}

	public SkiItemCategoryListDTO(int category_id, String item_type, int price_per_hour, List<SkiItemDTO> skiItemDto) {
		super();
		this.category_id = category_id;
		this.item_type = item_type;
		this.price_per_hour = price_per_hour;
		this.skiItemDto = skiItemDto;
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

	public List<SkiItemDTO> getSkiItemDto() {
		return skiItemDto;
	}

	public void setSkiItemDto(List<SkiItemDTO> skiItemDto) {
		this.skiItemDto = skiItemDto;
	}

	@Override
	public String toString() {
		return "SkiItemCategoryListDTO [category_id=" + category_id + ", item_type=" + item_type + ", price_per_hour="
				+ price_per_hour + ", skiItemDto=" + skiItemDto + "]";
	}

	
	
	
}
