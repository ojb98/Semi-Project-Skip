package ski.mapper;

import java.util.List;
import java.util.Map;

import ski.dto.SkiReservationDetailDTO;
import ski.dto.SkiReservationPrintDto;
import ski.dto.SkiReviewsDTO;

public interface SkiReservationMapper {
    int getSkiIdByUUID(int adminUUID);
    int deleteReservation(int reserv_id);
    int deleteReview(int review_id);
    List<SkiReviewsDTO> getSkiReviews(Map<String, Object> params);
    List<SkiReviewsDTO> getSearchSkiReviews(Map<String, Object> params);
    List<SkiReservationPrintDto> selectReservationBySkiId(Map<String, Object> params);
    List<SkiReservationDetailDTO> getSkiReservationDetail(Map<String, Object> params);

}