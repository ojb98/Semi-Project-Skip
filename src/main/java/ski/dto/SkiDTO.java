package ski.dto;

public class SkiDTO {
    private int ski_id;
    private int uuid;
    private String name;
    private String location;
    private String webcam_url;

    public SkiDTO() {
    }

    public SkiDTO(int ski_id, int uuid, String name, String location, String webcam_url) {
        this.ski_id = ski_id;
        this.uuid = uuid;
        this.name = name;
        this.location = location;
        this.webcam_url = webcam_url;
    }

    public int getSki_id() {
        return ski_id;
    }

    public void setSki_id(int ski_id) {
        this.ski_id = ski_id;
    }

    public int getUuid() {
        return uuid;
    }

    public void setUuid(int uuid) {
        this.uuid = uuid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getWebcam_url() {
        return webcam_url;
    }

    public void setWebcam_url(String webcam_url) {
        this.webcam_url = webcam_url;
    }
}
