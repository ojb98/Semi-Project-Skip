package adminUtil;

import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.Map;

public class FilterMapping {
    private static final Map<String, String> FILTER_MAP;

    static {
        Map<String, String> map = new LinkedHashMap<>(); 
        map.put("userName", "name"); 
        map.put("userId", "user_id");
        map.put("userEmail", "email");

        FILTER_MAP = Collections.unmodifiableMap(map); 
    }

    public static String getColumn(String filterKey) {
        return FILTER_MAP.get(filterKey); 
    }

    public static Map<String, String> getFilterMap() {
        return FILTER_MAP; 
    }
}
