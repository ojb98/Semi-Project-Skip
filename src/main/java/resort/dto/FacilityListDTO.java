package resort.dto;

import java.util.List;

public class FacilityListDTO {
	private int type_id;
	private String type_name;
	private List<FacilitiesDTO> ftypesDto;
	
	public FacilityListDTO() {}

	public FacilityListDTO(int type_id, String type_name, List<FacilitiesDTO> ftypesDto) {
		super();
		this.type_id = type_id;
		this.type_name = type_name;
		this.ftypesDto = ftypesDto;
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

	public List<FacilitiesDTO> getFtypesDto() {
		return ftypesDto;
	}

	public void setFtypesDto(List<FacilitiesDTO> ftypesDto) {
		this.ftypesDto = ftypesDto;
	}

	@Override
	public String toString() {
		return "FacilityListDTO [type_id=" + type_id + ", type_name=" + type_name + ", ftypesDto=" + ftypesDto + "]";
	}
	
	
}