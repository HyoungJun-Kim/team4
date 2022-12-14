package com.goott.domain;

import java.util.Date;

public class DrawVO {
	
	public int draw_id;
	public String draw_title;
	public int product_id;
	public int draw_price;
	public Date draw_event_start_date;
	public Date draw_event_end_date;
	public String draw_comment;
	public Date draw_pur_start_date;
	public Date draw_pur_end_date;
	public int draw_reqruit;
	
	
	public int getDraw_id() {
		return draw_id;
	}
	public void setDraw_id(int draw_id) {
		this.draw_id = draw_id;
	}
	public String getDraw_title() {
		return draw_title;
	}
	public void setDraw_title(String draw_title) {
		this.draw_title = draw_title;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public int getDraw_price() {
		return draw_price;
	}
	public void setDraw_price(int draw_price) {
		this.draw_price = draw_price;
	}
	public Date getDraw_event_start_date() {
		return draw_event_start_date;
	}
	public void setDraw_event_start_date(Date draw_event_start_date) {
		this.draw_event_start_date = draw_event_start_date;
	}
	public Date getDraw_event_end_date() {
		return draw_event_end_date;
	}
	public void setDraw_event_end_date(Date draw_event_end_date) {
		this.draw_event_end_date = draw_event_end_date;
	}
	public String getDraw_comment() {
		return draw_comment;
	}
	public void setDraw_comment(String draw_comment) {
		this.draw_comment = draw_comment;
	}
	public Date getDraw_pur_start_date() {
		return draw_pur_start_date;
	}
	public void setDraw_pur_start_date(Date draw_pur_start_date) {
		this.draw_pur_start_date = draw_pur_start_date;
	}
	public Date getDraw_pur_end_date() {
		return draw_pur_end_date;
	}
	public void setDraw_pur_end_date(Date draw_pur_end_date) {
		this.draw_pur_end_date = draw_pur_end_date;
	}
	public int getDraw_reqruit() {
		return draw_reqruit;
	}
	public void setDraw_reqruit(int draw_reqruit) {
		this.draw_reqruit = draw_reqruit;
	}
	
	
	@Override
	public String toString() {
		return "DrawVO [draw_id=" + draw_id + ", draw_title=" + draw_title + ", product_id=" + product_id
				+ ", draw_price=" + draw_price + ", draw_event_start_date=" + draw_event_start_date
				+ ", draw_event_end_date=" + draw_event_end_date + ", draw_comment=" + draw_comment
				+ ", draw_pur_start_date=" + draw_pur_start_date + ", draw_pur_end_date=" + draw_pur_end_date
				+ ", draw_reqruit=" + draw_reqruit + "]";
	}
	
	
	
}
