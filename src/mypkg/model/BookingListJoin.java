package mypkg.model;

public class BookingListJoin {

	private String aplane_name;
	private String m_id;
	private String c_code;
	private String s_num;
	private String name;
	private String category;
	private String local;
	private String destination;
	private String p_date;
	private String departure_tim;
	private String arrival_time;
	private String lead_time;
	private String fare;
	private String mpoint;
	public String getAplane_name() {
		return aplane_name;
	}
	public void setAplane_name(String aplane_name) {
		this.aplane_name = aplane_name;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getC_code() {
		return c_code;
	}
	public void setC_code(String c_code) {
		this.c_code = c_code;
	}
	public String getS_num() {
		return s_num;
	}
	public void setS_num(String s_num) {
		this.s_num = s_num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getLocal() {
		return local;
	}
	public void setLocal(String local) {
		this.local = local;
	}
	public String getDestination() {
		return destination;
	}
	public void setDestination(String destination) {
		this.destination = destination;
	}
	public String getP_date() {
		return p_date;
	}
	public void setP_date(String p_date) {
		this.p_date = p_date;
	}
	public String getDeparture_tim() {
		return departure_tim;
	}
	public void setDeparture_tim(String departure_tim) {
		this.departure_tim = departure_tim;
	}
	public String getArrival_time() {
		return arrival_time;
	}
	public void setArrival_time(String arrival_time) {
		this.arrival_time = arrival_time;
	}
	public String getLead_time() {
		return lead_time;
	}
	public void setLead_time(String lead_time) {
		this.lead_time = lead_time;
	}
	public String getFare() {
		return fare;
	}
	public void setFare(String fare) {
		this.fare = fare;
	}
	public String getMpoint() {
		return mpoint;
	}
	public void setMpoint(String mpoint) {
		this.mpoint = mpoint;
	}
	@Override
	public String toString() {
		return "BookingListJoin [aplane_name=" + aplane_name + ", m_id=" + m_id
				+ ", c_code=" + c_code + ", s_num=" + s_num + ", name=" + name
				+ ", category=" + category + ", local=" + local
				+ ", destination=" + destination + ", p_date=" + p_date
				+ ", departure_tim=" + departure_tim + ", arrival_time="
				+ arrival_time + ", leadtim=" + lead_time + ", fare=" + fare
				+ ", mpoint=" + mpoint + "]";
	}
	
	
	
	
}
