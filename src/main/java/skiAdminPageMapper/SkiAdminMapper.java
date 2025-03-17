package skiAdminPageMapper;

import java.util.List;
import java.util.Map;
import adminDto.SkiReservationDTO;
import adminDto.SkiReservationDetailDTO;
import adminDto.SkiReviewsDTO;

public interface SkiAdminMapper {
    int getSkiIdByUUID(int adminUUID);
    int deleteReservation(int reserv_id);
    int deleteReview(int review_id);
    List<SkiReviewsDTO> getSkiReviews(Map<String, Object> params);
    List<SkiReviewsDTO> getSearchSkiReviews(Map<String, Object> params);
    List<SkiReservationDetailDTO> getSkiReservationDetail(Map<String, Object> params);
    List<SkiReservationDTO> getSkiReservationUsers(Map<String, Object> params);
    List<SkiReservationDTO> getSearchSkiReservationUsers(Map<String, Object> params);
}