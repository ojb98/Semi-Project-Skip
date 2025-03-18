package ski.mapper;

import java.util.List;
import java.util.Map;

import ski.dto.SkiReservationPrintDto;

public interface SkiReservationMapper {
	List<SkiReservationPrintDto> selectReservationBySkiId(Map<String, Object> params);
}
