package dto;

public class ResortFacilityMapDTO {
    private int reosrt_id;
    private int facility_id;

    public ResortFacilityMapDTO() {
    }

    public ResortFacilityMapDTO(int reosrt_id, int facility_id) {
        this.reosrt_id = reosrt_id;
        this.facility_id = facility_id;
    }

    public int getReosrt_id() {
        return reosrt_id;
    }

    public void setReosrt_id(int reosrt_id) {
        this.reosrt_id = reosrt_id;
    }

    public int getFacility_id() {
        return facility_id;
    }

    public void setFacility_id(int facility_id) {
        this.facility_id = facility_id;
    }
}
