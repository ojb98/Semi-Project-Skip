package adminPageMapper;

import java.util.List;
import java.util.Map;

import adminDto.UsersDTO;

public interface RootAdminMapper {
	int getUsersID();
	int getTotalUsers();
    int getUserCount();
    int getSkiOwners();
    int getRentalOwners();
    int getResortOwners();
    int approvalPendingUsers(int uuid);
    int denyPendingUsers(int uuid);
    int deleteUsers(int uuid);
    int getPendingCounts();
    List<UsersDTO> getNewUsers();
    List<UsersDTO> getUsersList();
    List<UsersDTO> getSearchUsersList(Map<String, Object> params);
    List<UsersDTO> getPendingUsers();
    List<UsersDTO> getDeniedUsers();
    List<UsersDTO> getSearchPendingUsers(Map<String, Object> params);
    List<UsersDTO> getSearchDeniedUsers(Map<String, Object> params);
}