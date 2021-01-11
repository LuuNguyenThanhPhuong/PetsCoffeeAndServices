package PetsCoffeeServices.asm.DAO;

import java.util.List;

import PetsCoffeeServices.asm.Entity.NhanVien;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface NhanVienDAO extends JpaRepository<NhanVien, String>{

	@Query(value = "SELECT p FROM NhanVien p WHERE isDelete = :status ")
	public List<NhanVien> getAllNhanVien(@Param("status") boolean status);
	
	@Query("Select p FROM  NhanVien p "
			+ "where p.isDelete = 0 and p.tenNhanVien LIKE %:kw%  OR p.isDelete = 0 and p.maNhanVien LIKE %:kw% "
			+ "OR p.isDelete = 0 and p.diaChi LIKE %:kw% OR p.isDelete = 0 and p.email LIKE %:kw%")
	public List<NhanVien> findByKeyWords(@Param("kw") String keywords);
}
