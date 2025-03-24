package rental.mapper;

import java.util.List;
import java.util.Map;

import rental.dto.RentalReservationDetailDTO;
import rental.dto.RentalReservationPrintDto;

public interface RentalReservationMapper {
    int getRentalIdByUUID(int adminUUID);
    int deleteReservation(int reserv_id);
    int deleteReview(int review_id);
    List<RentalReservationPrintDto> selectReservationByRentalId(Map<String, Object> params);
    List<RentalReservationDetailDTO> getRentalReservationDetail(Map<String, Object> params);
	void updateReservationStatusToCompleted(Map<String, Object> updateParams);

}