package util;
import java.util.HashMap;
import java.util.Map;

/**
 * ItemType 을 입력하여 img_num 을 리턴하기 위한 클래스
 * */
public class ItemTypeMapUtil {
    private static final Map<String, Integer> map = new HashMap<>();

   static {
        map.put("리프트권", 1);
        map.put("패키지", 2);
        map.put("스키", 3);
        map.put("보드", 4);
        map.put("보호구", 5);
        map.put("상의", 6);
        map.put("하의", 7);
        map.put("신발", 8);
    }

    /**
     * @param itemType 아이템 타입을 넣어서 img_num 을 반환
     * */
    public static int getImgNum(String itemType) {
        return map.getOrDefault(itemType, -1); // 없는 값이면 -1 리턴
    }

}
