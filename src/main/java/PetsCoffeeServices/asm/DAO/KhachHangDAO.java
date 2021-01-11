package PetsCoffeeServices.asm.DAO;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import PetsCoffeeServices.asm.Entity.KhachHang;




public interface KhachHangDAO extends JpaRepository<KhachHang, String>{

	@Query(value = "SELECT p FROM KhachHang p WHERE isDelete = :status ")
	public List<KhachHang> getAllKhachHang(@Param("status") boolean status);

	@Query("Select p FROM  KhachHang p "
			+ "where p.isDelete = 0 and p.tenKhachHang LIKE %:kw%  OR p.isDelete = 0 and p.maKhachHang LIKE %:kw% "
			+ "OR p.isDelete = 0 and p.diaChi LIKE %:kw% OR p.isDelete = 0 and p.email LIKE %:kw% OR p.isDelete = 0 and p.soDienThoai LIKE %:kw% ")
	public List<KhachHang> findByKeyWords(@Param("kw") String keywords);

}
