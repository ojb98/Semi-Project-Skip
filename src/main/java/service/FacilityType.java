package service;

public enum FacilityType {
    GYM(1, "운동시설", "fas fa-dumbbell"),
    SPA_AND_SAUNA(2, "스파&사우나", "fas fa-spa"),
    FOOD_AND_BEVERAGE(3, "식음료 시설", "fas fa-utensils"),
    ENTERTAINMENT(4, "엔터테인먼트", "fas fa-film"),
    OUTDOOR(5, "야외시설", "fas fa-tree"),
    KIDS(6, "어린이시설", "fas fa-child"),
    ACCOMMODATION(7, "숙박 편의시설", "fas fa-bed"),
    TRANSPORT_AND_PARKING(8, "교통&주차", "fas fa-parking");

    private final int id;
    private final String name;
    private final String icon;

    FacilityType(int id, String name, String icon) {
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

    public static FacilityType getById(int id) {
        for (FacilityType type : values()) {
            if (type.getId() == id) {
                return type;
            }
        }
        throw new IllegalArgumentException("Unknown id: " + id);
    }
}
