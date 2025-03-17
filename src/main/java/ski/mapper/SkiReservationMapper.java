<<<<<<< HEAD:src/main/java/ski/mapper/SkiReservationMapper.java
package ski.mapper;

import java.util.List;
import java.util.Map;

import ski.dto.SkiReservationListDto;

public interface SkiReservationMapper {
	List<SkiReservationListDto> selectByUuid(Map<String, Object> params);
}
=======
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
>>>>>>> f9db9f64cec6d200ce5e3ddf53f562876165c9fd:src/main/java/skiAdminPageMapper/SkiReservationMapper.java
