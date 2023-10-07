package spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.dao.AddressDAO;
import spring.model.Address;

@Service
public class AddressService {
	@Autowired
	private AddressDAO addressDAO;

	public List<Address> getListProvinces() {
		return addressDAO.getListProvinces();
	}
	public List<Address> getListDistricts(String code) {
		return addressDAO.getListDistricts(code);
	}
	public List<Address> getListWards(String code) {
		return addressDAO.getListWards(code);
	}
	public Address getProvince(String code) {
		return addressDAO.getProvince(code);
	}
	public Address getDistrict(String code) {
		return addressDAO.getDistrict(code);
	}
	public Address getWard(String code) {
		return addressDAO.getWard(code);
	}
	
}
