package wyk.bean;

public class BaseStation {

	
	
	public BaseStation() {
		super();
	}

	

	public BaseStation(boolean near) {
		super();
		this.near = near;
	}



	public boolean near;
	
	public String baseId;
	
	public int category;
	
	public String baseName;
	
	public String level;
	
	public String longitude;
	
	public String latitude;
	
	public String address;
	
	public String stationName;
	
	public String area;
	
	public String cell_id;
	

	public String getBaseId() {
		return baseId;
	}

	public void setBaseId(String baseId) {
		this.baseId = baseId;
	}

	public int getCategory() {
		return category;
	}

	public void setCategory(int category) {
		this.category = category;
	}

	public String getBaseName() {
		return baseName;
	}

	public void setBaseName(String baseName) {
		this.baseName = baseName;
	}

	public String getLevel() {
		return level;
	}

	public void setLevel(String level) {
		this.level = level;
	}

	public String getLongitude() {
		return longitude;
	}

	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}

	public String getLatitude() {
		return latitude;
	}

	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getStationName() {
		return stationName;
	}

	public void setStationName(String stationName) {
		this.stationName = stationName;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public String getCell_id() {
		return cell_id;
	}

	public void setCell_id(String cell_id) {
		this.cell_id = cell_id;
	}



	public boolean isNear() {
		return near;
	}



	public void setNear(boolean near) {
		this.near = near;
	}




	
	
}
