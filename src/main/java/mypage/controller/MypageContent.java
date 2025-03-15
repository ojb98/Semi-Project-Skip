package mypage.controller;

public enum MypageContent {
	INFO("info", "info"), SKI_BOOKINGS("bookings", "skiBookings"), RENTAL_BOOKINGS("bookings", "rentalBookings"),
	RESORT_BOOKINGS("bookings", "resortBookings"), REVIEWS("reviews", "reviews"), INQUIRIES("inquiries", "inquiries"), CANCEL("cancel", "cancel");

	private final String tabName;
	private final String fileName;
	
	MypageContent(String tabName, String fileName) {
		this.tabName = tabName;
		this.fileName = fileName;
	}
	
	public String getTabName() {
		return tabName;
	}
	
	public String getFileName() {
		return fileName;
	}
}
