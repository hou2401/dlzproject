
package com.jk.pojo;


public class MyShipCarid {

	private Integer myPuTongId;
	
	private Double myPuTongZheKou;
	
	private Integer myBoJinId;
	
	private Double myBoJinZheKou;
	
	private Integer myZuanShiId;
	
	private Double myZuanShiZheKou;

	   
	/**    
	 * <pre>创建一个新的实例 MyShipCarid.    
	 *    </pre>    
	 */
	public MyShipCarid() {
	}


	   
	/**    
	 * <pre>创建一个新的实例 MyShipCarid.    
	 *    
	 * @param myPuTongId
	 * @param myPuTongZheKou
	 * @param myBoJinId
	 * @param myBoJinZheKou
	 * @param myZuanShiId
	 * @param myZuanShiZheKou</pre>    
	 */
	public MyShipCarid(Integer myPuTongId, Double myPuTongZheKou,
			Integer myBoJinId, Double myBoJinZheKou, Integer myZuanShiId,
			Double myZuanShiZheKou) {
		this.myPuTongId = myPuTongId;
		this.myPuTongZheKou = myPuTongZheKou;
		this.myBoJinId = myBoJinId;
		this.myBoJinZheKou = myBoJinZheKou;
		this.myZuanShiId = myZuanShiId;
		this.myZuanShiZheKou = myZuanShiZheKou;
	}



	public Integer getMyPuTongId() {
		return myPuTongId;
	}



	public void setMyPuTongId(Integer myPuTongId) {
		this.myPuTongId = myPuTongId;
	}



	public Double getMyPuTongZheKou() {
		return myPuTongZheKou;
	}



	public void setMyPuTongZheKou(Double myPuTongZheKou) {
		this.myPuTongZheKou = myPuTongZheKou;
	}



	public Integer getMyBoJinId() {
		return myBoJinId;
	}



	public void setMyBoJinId(Integer myBoJinId) {
		this.myBoJinId = myBoJinId;
	}



	public Double getMyBoJinZheKou() {
		return myBoJinZheKou;
	}



	public void setMyBoJinZheKou(Double myBoJinZheKou) {
		this.myBoJinZheKou = myBoJinZheKou;
	}



	public Integer getMyZuanShiId() {
		return myZuanShiId;
	}



	public void setMyZuanShiId(Integer myZuanShiId) {
		this.myZuanShiId = myZuanShiId;
	}



	public Double getMyZuanShiZheKou() {
		return myZuanShiZheKou;
	}



	public void setMyZuanShiZheKou(Double myZuanShiZheKou) {
		this.myZuanShiZheKou = myZuanShiZheKou;
	}



	/* (non-Javadoc)    
	 * @see java.lang.Object#toString()    
	 */
	@Override
	public String toString() {
		return "MyShipCarid [myPuTongId=" + myPuTongId + ", myPuTongZheKou="
				+ myPuTongZheKou + ", myBoJinId=" + myBoJinId
				+ ", myBoJinZheKou=" + myBoJinZheKou + ", myZuanShiId="
				+ myZuanShiId + ", myZuanShiZheKou=" + myZuanShiZheKou + "]";
	}


	
	
	
	
	
	
	
	
}
