package skiAdminPageMapper;

import java.util.List;
import java.util.Map;
import adminDto.SkiReservationDTO;
import adminDto.SkiReviewDTO;

public interface SkiReservationMapper {
    int getSkiIdByUUID(int adminUUID);
    int deleteReservation(int reserv_id);
    int deleteReview(int review_id);
    List<SkiReviewDTO> getSkiReviewUsers(Map<String, Object> params);
    List<SkiReviewDTO> getSearchSkiReviewUsers(Map<String, Object> params);
    List<SkiReservationDTO> getSkiReservationUsers(Map<String, Object> params);
    List<SkiReservationDTO> getSearchSkiReservationUsers(Map<String, Object> params);
}