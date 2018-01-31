package dto;

public class EIPBean {
	private String EmployeeID, FirstName, Extension;
	private String CustomerID, CompanyName, Phone, Fax, Email, PaymentTerm,
					Address, City, Region, PostalCode, Country;
	private String ProductID, ProductName, UnitPrice, QuantityPerUnit, Homemade;

	public void setEmployeeID(String EmployeeID) { this.EmployeeID = EmployeeID; }
	public String getEmployeeID() { return EmployeeID; }	
	
	public void setFirstName(String FirstName) { this.FirstName = FirstName; }
	public String getFirstName() { return FirstName; }
	
	public void setExtension(String Extension) { this.Extension = Extension; }
	public String getExtension() { return Extension; }
	
	public void setCustomerID(String CustomerID) { this.CustomerID = CustomerID; }
	public String getCustomerID() { return CustomerID; }
	
	public void setCompanyName(String CompanyName) { this.CompanyName = CompanyName; }
	public String getCompanyName() { return CompanyName; }
	
	public void setPhone(String Phone) { this.Phone = Phone; }
	public String getPhone() { return Phone; }

	public void setFax(String Fax) { this.Fax = Fax; }
	public String getFax() { return Fax; }	

	public void setEmail(String Email) { this.Email = Email; }
	public String getEmail() { return Email; }
	
	public void setPaymentTerm(String PaymentTerm) { this.PaymentTerm = PaymentTerm; }
	public String getPaymentTerm() { return PaymentTerm; }	

	public void setAddress(String Address) { this.Address = Address; }
	public String getAddress() { return Address; }
	
	public void setCity(String City) { this.City = City; }
	public String getCity() { return City; }
	
	public void setRegion(String Region) { this.Region = Region; }
	public String getRegion() { return Region; }
	
	public void setPostalCode(String PostalCode) { this.PostalCode = PostalCode; }
	public String getPostalCode() { return PostalCode; }
	
	public void setCountry(String Country) { this.Country = Country; }
	public String getCountry() { return Country; }
	
	public void setProductID(String ProductID) { this.ProductID = ProductID; }
	public String getProductID() { return ProductID; }	
	
	public void setProductName(String ProductName) { this.ProductName = ProductName; }
	public String getProductName() { return ProductName; }	

	public void setUnitPrice(String UnitPrice) { this.UnitPrice = UnitPrice; }
	public String getUnitPrice() { return UnitPrice; }

	public void setQuantityPerUnit(String QuantityPerUnit) { this.QuantityPerUnit = QuantityPerUnit; }
	public String getQuantityPerUnit() { return QuantityPerUnit; }
	
	public void setHomemade(String Homemade) { this.Homemade = Homemade; }
	public String getHomemade() { return Homemade; }	
	
}
