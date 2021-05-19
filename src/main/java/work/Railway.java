package work;

public class Railway {
	
	private int id;
	private String trainNum;
	private String departure;
	private String arrival;
	private String carriage;
	private int seat;
	private int price;
	
	public Railway(int id, String trainNum, String departure, String arrival, String carriage, int seat, int price) {
		this.id = id;
		this.trainNum = trainNum;
		this.departure = departure;
		this.arrival = arrival;
		this.carriage = carriage;
		this.seat = seat;
		this.price = price;
	}

	public Railway(String trainNum, String departure, String arrival, String carriage, int seat, int price) {
		this.trainNum = trainNum;
		this.departure = departure;
		this.arrival = arrival;
		this.carriage = carriage;
		this.seat = seat;
		this.price = price;
		
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTrainNum() {
		return trainNum;
	}

	public void setTrainNum(String trainNum) {
		this.trainNum = trainNum;
	}

	public String getDeparture() {
		return departure;
	}

	public void setDeparture(String departure) {
		this.departure = departure;
	}

	public String getArrival() {
		return arrival;
	}

	public void setArrival(String arrival) {
		this.arrival = arrival;
	}

	public String getCarriage() {
		return carriage;
	}

	public void setCarriage(String carriage) {
		this.carriage = carriage;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}
	

	public int getSeat() {
		return seat;
	}

	public void setSeat(int seat) {
		this.seat = seat;
	}

	@Override
	public String toString() {
		return "Railway [id=" + id + ", trainNum=" + trainNum + ", departure=" + departure + ", arrival=" + arrival
				+ ", carriage=" + carriage + ", seat=" + seat + ", price=" + price + "]";
	}

	


}
