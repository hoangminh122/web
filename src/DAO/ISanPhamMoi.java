package DAO;

import java.util.ArrayList;

import model.products;

public interface ISanPhamMoi {
	ArrayList<products> getSanPhamMoi(String sql);
	ArrayList<products> getSanPhamMoibyPage(ArrayList<products> arr,int start,int end);
	ArrayList<products> getSanPhamKhuyenMai(String sql);
}
