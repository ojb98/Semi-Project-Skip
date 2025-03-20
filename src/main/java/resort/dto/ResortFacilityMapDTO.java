package resort.dto;

public class ResortFacilityMapDTO {
	private int resort_id;
	private int facility_id;
	
	public ResortFacilityMapDTO() {}

	public ResortFacilityMapDTO(int resort_id, int facility_id) {
		super();
		this.resort_id = resort_id;
		this.facility_id = facility_id;
	}

	public int getResort_id() {
		return resort_id;
	}

	public void setResort_id(int resort_id) {
		this.resort_id = resort_id;
	}

	public int getFacility_id() {
		return facility_id;
	}

	public void setFacility_id(int facility_id) {
		this.facility_id = facility_id;
	}

	@Override
	public String toString() {
		return "ResortFacilityMapDTO [resort_id=" + resort_id + ", facility_id=" + facility_id + "]";
	}
	
	
	
}