package spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.dao.CountryDAO;
import spring.model.Country;

@Service
public class CountryService {
	@Autowired
	private CountryDAO countryDAO;

	public List<Country> getListCountry() {
		return countryDAO.getListCountry();
	}

	public int addCountry(Country country) {
		return countryDAO.addCountry(country);
	}
	
}
