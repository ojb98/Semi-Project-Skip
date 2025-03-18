package adminPageMapper;

import java.util.List;
import java.util.Map;

import adminDto.UsersDTO;

public interface AdminApprovalRequestMapper {
    int approvalPendingUsers(int uuid);
    int denyPendingUsers(int uuid);
    int deleteUsers(int uuid);
    int getPendingCounts();
    List<UsersDTO> getPendingUsers();
    List<UsersDTO> getDeniedUsers();
    List<UsersDTO> getSearchPendingUsers(Map<String, Object> params);
    List<UsersDTO> getSearchDeniedUsers(Map<String, Object> params);
}