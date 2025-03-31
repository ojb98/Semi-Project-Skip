package resort.mapper;

import java.util.List;
import java.util.Map;

import resort.dto.ResortSalesListDto;

public interface ResortSalesManageMapper {
    Integer getTotalSale(Map<String, Object> params);
    Integer getConfirmReserv(Map<String, Object> params);
    Integer getCancleReserv(Map<String, Object> params);
    Integer totalRecords();
    List<ResortSalesListDto> getSalesListByResortId(Map<String, Object> params);
    List<Map<String,Object>>getSalesChartData(Map<String, Object> params);
    List<Map<String,Object>>selectCategorySales(Map<String, Object> params);
	int getConfirmedTotalCount(Map<String, Object> params);
}