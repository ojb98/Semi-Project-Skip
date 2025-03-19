package dto;

public class WishDTO {
    int wishList_id;
    int uuid;
    String category;
    int ref_id;

    public WishDTO() {
    }

    public WishDTO(int wishList_id, int uuid, String category, int ref_id) {
        this.wishList_id = wishList_id;
        this.uuid = uuid;
        this.category = category;
        this.ref_id = ref_id;
    }

    public int getWishList_id() {
        return wishList_id;
    }

    public void setWishList_id(int wishList_id) {
        this.wishList_id = wishList_id;
    }

    public int getUuid() {
        return uuid;
    }

    public void setUuid(int uuid) {
        this.uuid = uuid;
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
}
