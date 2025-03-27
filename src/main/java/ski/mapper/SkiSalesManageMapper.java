package ski.mapper;

import java.util.List;
import java.util.Map;

import ski.dto.SkiReservationDetailDTO;
import ski.dto.SkiReservationPrintDto;
import ski.dto.SkiSalesListDto;

public interface SkiSalesManageMapper {
    Integer getTotalSale(Map<String, Object> params);
    Integer getConfirmReserv(Map<String, Object> params);
    Integer getCancleReserv(Map<String, Object> params);
    List<SkiSalesListDto> getSalesListBySkiId(Map<String, Object> params);
    List<Map<String,Object>>getSalesChartData(Map<String, Object> params);
    List<Map<String,Object>>selectCategorySales();
}