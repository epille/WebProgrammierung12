package services;

import java.util.Date;

public class DateBeanJava implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Date today;

	public Date getToday() {
		return today;
	}

	public DateBeanJava() {
		this.today = new Date();
	}

} 
