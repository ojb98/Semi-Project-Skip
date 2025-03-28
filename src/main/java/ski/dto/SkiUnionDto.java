package ski.dto;

public class SkiUnionDto {
	private String category;
	private int ref_id;
	private String name;
	private String description;
	private String phone;
	private String location;
	
	public SkiUnionDto() {
		
	}

	public SkiUnionDto(String category, int ref_id, String name, String description, String phone, String location) {
		super();
		this.category = category;
		this.ref_id = ref_id;
		this.name = name;
		this.description = description;
		this.phone = phone;
		this.location = location;
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}
}
