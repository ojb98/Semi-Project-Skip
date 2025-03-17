package ski.mapper;

import java.util.List;
import java.util.Map;

import ski.dto.SkiReservationListDto;

public interface SkiReservationMapper {
	List<SkiReservationListDto> selectByUuid(Map<String, Object> params);
}
