package neu.edu.coe.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import neu.edu.coe.model.Product;

public class ProductMapper implements RowMapper<Product> {
	
	@Override
	public Product mapRow(ResultSet rs, int rowNum) throws SQLException {
		// TODO Auto-generated method stub
		Product prod = new Product();
		prod.setPid(rs.getInt("pid"));
		prod.setPname(rs.getString("pname"));
		prod.setMarket_price(rs.getDouble("market_price"));
		prod.setShop_price(rs.getDouble("shop_price"));
		prod.setImage(rs.getString("image"));
		prod.setPdesc(rs.getString("pdesc"));
		prod.setIs_hot(rs.getInt("is_hot"));
		prod.setPdate(rs.getDate("pdata"));
		
		
		
//		prod.setCsid(rs.getInt("csid"));
		
		
		
		return prod;
	}
	

}
