package dto;

public class FacilityDTO {
    private int facility_id;
    private int type_id;
    private String facility_name;

    public FacilityDTO() {
    }

    public FacilityDTO(int facility_id, int type_id, String facility_name) {
        this.facility_id = facility_id;
        this.type_id = type_id;
        this.facility_name = facility_name;
    }

    public int getFacility_id() {
        return facility_id;
    }

    public void setFacility_id(int facility_id) {
        this.facility_id = facility_id;
    }

    public int getType_id() {
        return type_id;
    }

    public void setType_id(int type_id) {
        this.type_id = type_id;
    }

    public String getFacility_name() {
        return facility_name;
    }

    public void setFacility_name(String facility_name) {
        this.facility_name = facility_name;
    }
}
