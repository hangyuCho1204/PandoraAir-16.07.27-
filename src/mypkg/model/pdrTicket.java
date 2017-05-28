package mypkg.model;

public class pdrTicket {

	private String name;
	private String flight;
	private String deptime;
	private String to;
	private String gate;
	private String from;
	private String date;
	private String seat;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getFlight() {
		return flight;
	}
	public void setFlight(String flight) {
		this.flight = flight;
	}
	public String getDeptime() {
		return deptime;
	}
	public void setDeptime(String deptime) {
		this.deptime = deptime;
	}
	public String getTo() {
		return to;
	}
	public void setTo(String to) {
		this.to = to;
	}
	public String getGate() {
		return gate;
	}
	public void setGate(String gate) {
		this.gate = gate;
	}
	public String getFrom() {
		return from;
	}
	public void setFrom(String from) {
		this.from = from;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getSeat() {
		return seat;
	}
	public void setSeat(String seat) {
		this.seat = seat;
	}
	@Override
	public String toString() {
		return "pdrTicket [name=" + name + ", flight=" + flight + ", deptime="
				+ deptime + ", to=" + to + ", gate=" + gate + ", from=" + from
				+ ", date=" + date + ", seat=" + seat + "]";
	}
	
	
	
}
