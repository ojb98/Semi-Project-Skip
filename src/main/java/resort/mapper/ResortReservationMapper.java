package resort.mapper;

import java.util.List;
import java.util.Map;

import resort.dto.ResortReservationDetailDTO;
import resort.dto.ResortReservationPrintDto;

public interface ResortReservationMapper {
    int getResortIdByUUID(int adminUUID);
    int deleteReservation(int reserv_id);
    int deleteReview(int review_id);
    List<ResortReservationPrintDto> selectReservationByResortId(Map<String, Object> params);
    List<ResortReservationDetailDTO> getResortReservationDetail(Map<String, Object> params);
	void updateReservationStatusToCompleted(Map<String, Object> updateParams);

}