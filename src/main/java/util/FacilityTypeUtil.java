package util;

public enum FacilityTypeUtil {
    GYM(1, "운동시설", "fas fa-dumbbell"),
    ENTERTAINMENT(2, "엔터테인먼트", "fas fa-film"),
    KIDS(3, "어린이시설", "fas fa-child"),
    OUTDOOR(4, "야외시설", "fas fa-tree"),
    FOOD_AND_BEVERAGE(5, "식음료 시설", "fas fa-utensils"),
    SPA_AND_SAUNA(6, "스파&사우나", "fas fa-spa"),
    ACCOMMODATION(7, "숙박 편의시설", "fas fa-bed"),
    TRANSPORT_AND_PARKING(8, "교통&주차", "fas fa-parking"),
    
	GENERAL_FACILITY(9, "일반 시설", "fas fa-bed"),
    SAFETY(10, "안전", "fas fa-parking"),
	CABIN(11, "객실시설", "fas fa-bed"),
    popularity(12, "인기", "fas fa-parking");

    private final int id;
    private final String name;
    private final String icon;

    FacilityTypeUtil(int id, String name, String icon) {
        this.id = id;
        this.name = name;
        this.icon = icon;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getIcon() {
        return icon;
    }

    public static FacilityTypeUtil getById(int id) {
        for (FacilityTypeUtil type : values()) {
            if (type.getId() == id) {
                return type;
            }
        }
        throw new IllegalArgumentException("Unknown id: " + id);
    }
}
