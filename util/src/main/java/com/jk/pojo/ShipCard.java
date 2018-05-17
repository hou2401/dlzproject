
package com.jk.pojo;


public class ShipCard {

	
	private Integer carId;
	
	private String types;
	
	private Double caprice;

	/**    
	 * <pre>创建一个新的实例 ShipCard.    
	 *    </pre>    
	 */
	public ShipCard() {
	}

	/**    
	 * <pre>创建一个新的实例 ShipCard.    
	 *    
	 * @param carId
	 * @param types
	 * @param caprice</pre>    
	 */
	public ShipCard(Integer carId, String types, Double caprice) {
		this.carId = carId;
		this.types = types;
		this.caprice = caprice;
	}


	public Integer getCarId() {
		return carId;
	}

	public void setCarId(Integer carId) {
		this.carId = carId;
	}

	public String getTypes() {
		return types;
	}

	public void setTypes(String types) {
		this.types = types;
	}

	public Double getCaprice() {
		return caprice;
	}

	public void setCaprice(Double caprice) {
		this.caprice = caprice;
	}

	/* (non-Javadoc)    
	 * @see java.lang.Object#toString()    
	 */
	@Override
	public String toString() {
		return "ShipCard [carId=" + carId + ", types=" + types + ", caprice="
				+ caprice + "]";
	}

	
}
