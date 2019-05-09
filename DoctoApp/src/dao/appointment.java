package dao;

public class appointment {

	private String date_time, takendate, payment, status;
	private int did, aid, pid;
	
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getDate_time() {
		return date_time;
	}
	public void setDate_time(String date_time) {
		this.date_time = date_time;
	}
	public String getTakendate() {
		return takendate;
	}
	public void setTakendate(String takendate) {
		this.takendate = takendate;
	}
	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
	public int getDid() {
		return did;
	}
	
	public void setDid(int did) {
		this.did = did;
	}
	public int getAid() {
		return aid;
	}
	public void setAid(int aid) {
		this.aid = aid;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	

	
	
}
