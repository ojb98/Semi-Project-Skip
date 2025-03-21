package resort.dto;

public class FacilityTypesDTO {
	private int type_id;
	private String type_name;
	
	public FacilityTypesDTO() {}

	public FacilityTypesDTO(int type_id, String type_name) {
		this.type_id = type_id;
		this.type_name = type_name;
	}

	public int getType_id() {
		return type_id;
	}

	public void setType_id(int type_id) {
		this.type_id = type_id;
	}

	public String getType_name() {
		return type_name;
	}

	public void setType_name(String type_name) {
		this.type_name = type_name;
	}

	@Override
	public String toString() {
		return "FacilityTypesDTO [type_id=" + type_id + ", type_name=" + type_name + "]";
	}
	
	
	
}