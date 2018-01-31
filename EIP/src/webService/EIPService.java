package webService;

import java.util.ArrayList;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import com.google.gson.Gson;

import dto.EIPBean;
import model.EIPModel;

@Path("WebService")
public class EIPService {
	
	//GET_5 Get ArrayList of Employee from Model and write into JSON format using "gson.toJson"
	@GET
	@Path("/GetEmps")
	@Produces(MediaType.APPLICATION_JSON)
	public String EmpData() {
		EIPModel eipModel = new EIPModel();
		ArrayList<EIPBean> EmpsS = eipModel.get_EmployeesM();
		Gson gson = new Gson();
		String EmpData = gson.toJson(EmpsS);
		return EmpData;
	}

	//GET_5 Get ArrayList of Customer from Model and write into JSON format using "gson.toJson"
	@GET
	@Path("/GetCuss")
	@Produces(MediaType.APPLICATION_JSON)
	public String CusData() {
		EIPModel eipModel = new EIPModel();
		ArrayList<EIPBean> CussS = eipModel.get_CustomersM();
		Gson gson = new Gson();
		String CusData = gson.toJson(CussS);
		return CusData;
	}	

	//GET_5 Get ArrayList of Product from Model and write into JSON format using "gson.toJson"
	@GET
	@Path("/GetPros")
	@Produces(MediaType.APPLICATION_JSON)
	public String ProData() {
		EIPModel eipModel = new EIPModel();
		ArrayList<EIPBean> ProsS = eipModel.get_ProductsM();
		Gson gson = new Gson();
		String ProData = gson.toJson(ProsS);
		return ProData;
	}	
	
}
