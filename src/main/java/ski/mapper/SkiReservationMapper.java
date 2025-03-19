package ski.mapper;

import java.util.List;
import java.util.Map;

import ski.dto.SkiReservationDetailDTO;
import ski.dto.SkiReservationPrintDto;

public interface SkiReservationMapper {
    int getSkiIdByUUID(int adminUUID);
    int deleteReservation(int reserv_id);
    int deleteReview(int review_id);
    List<SkiReservationPrintDto> selectReservationBySkiId(Map<String, Object> params);
    List<SkiReservationDetailDTO> getSkiReservationDetail(Map<String, Object> params);
	void updateReservationStatusToCompleted(Map<String, Object> updateParams);

}