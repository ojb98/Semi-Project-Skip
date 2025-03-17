package adminPageMapper;

import java.util.List;
import adminDto.UsersDTO;

public interface AdminDashboardMapper {
    int getTotalUsers();
    int getUserCount();
    int getSkiOwners();
    int getRentalOwners();
    int getResortOwners();
    int getAdminCount();
    int getPendingCounts();
    List<UsersDTO> getNewUsers();
}