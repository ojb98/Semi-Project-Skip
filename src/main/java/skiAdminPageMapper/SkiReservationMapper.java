package skiAdminPageMapper;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.Param;
import adminDto.SkiReservationDTO;

public interface SkiReservationMapper {
    int getSkiIdByUUID(int adminUUID);
    List<SkiReservationDTO> getSkiReservationUsers(Map<String, Object> params);
    List<SkiReservationDTO> getSearchSkiReservationUsers(Map<String, Object> params);
}