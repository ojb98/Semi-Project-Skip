package ski.mapper;

public interface SkiStatisticsMapper {
	int getTotalSales(int skiId);
    int getTotalReservations(int skiId);
    int getConfirmedReservations(int skiId);
    int getCancelledReservations(int skiId);
}
