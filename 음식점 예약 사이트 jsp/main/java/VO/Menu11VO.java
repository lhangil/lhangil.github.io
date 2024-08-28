package VO;

import java.math.BigDecimal;

public class Menu11VO {
    private String menu_id;
    private String menu_name;
    private String description;
    private int price;
    

    // 생성자, getter, setter
    public Menu11VO(String menu_id, String menu_name, String description, int price) {
        this.menu_id = menu_id;
        this.menu_name = menu_name;
        this.description = description;
        this.price = price;
        
    }
    public Menu11VO(String id, String name, int price) {
        this.menu_id = menu_id;
        this.menu_name = menu_name;
        this.price = price;
    }
	public String getMenu_id() {
		return menu_id;
	}
	public void setMenu_id(String menu_id) {
		this.menu_id = menu_id;
	}
	public String getMenu_name() {
		return menu_name;
	}
	public void setMenu_name(String menu_name) {
		this.menu_name = menu_name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	@Override
	public String toString() {
		return "Menu11VO [menu_id=" + menu_id + ", menu_name=" + menu_name + ", description=" + description + ", price="
				+ price + "]";
	}


	

	

    
}
