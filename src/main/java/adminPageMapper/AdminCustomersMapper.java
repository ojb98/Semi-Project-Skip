package adminPageMapper;

import java.util.List;
import java.util.Map;

import adminDto.UsersDTO;

public interface AdminCustomersMapper {
	int deleteUsers(int uuid);
    List<UsersDTO> getUsersList();
    List<UsersDTO> getSearchUsersList(Map<String, Object> params);
}
