package rental.mapper;

import java.util.List;
import java.util.Map;

import rental.dto.RentalSalesListDto;

public interface RentalSalesManageMapper {
    Integer getTotalSale(Map<String, Object> params);
    Integer getConfirmReserv(Map<String, Object> params);
    Integer getCancleReserv(Map<String, Object> params);
    Integer totalRecords();
    List<RentalSalesListDto> getSalesListByRentalId(Map<String, Object> params);
    List<Map<String,Object>>getSalesChartData(Map<String, Object> params);
    List<Map<String,Object>>selectCategorySales(Map<String, Object> params);
	int getConfirmedTotalCount(Map<String, Object> params);
}