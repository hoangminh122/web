package DAO;

import java.util.ArrayList;

import model.type_products;

public interface IDanhMucDAO {
      ArrayList<type_products> getTypeProduct(String sql);
}
