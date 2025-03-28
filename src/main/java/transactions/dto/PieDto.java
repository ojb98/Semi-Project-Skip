package transactions.dto;

public class PieDto {
	private String category;
	private int pie;
	
	public PieDto() {
		
	}

	public PieDto(String category, int pie) {
		super();
		this.category = category;
		this.pie = pie;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getPie() {
		return pie;
	}

	public void setPie(int pie) {
		this.pie = pie;
	}
}
