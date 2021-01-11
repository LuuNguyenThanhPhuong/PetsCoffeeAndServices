package Travel.vietnam.DAO;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import Travel.vietnam.Entity.NhanVien;

public interface NhanVienDAO extends JpaRepository<NhanVien, String>{

	@Query(value = "SELECT p FROM NhanVien p WHERE isDelete = :status ")
	public List<NhanVien> getAllNhanVien(@Param("status") boolean status);
	
	@Query("Select p FROM  NhanVien p "
			+ "where p.isDelete = 0 and p.tenNhanVien LIKE %:kw%  OR p.isDelete = 0 and p.maNhanVien LIKE %:kw% "
			+ "OR p.isDelete = 0 and p.diaChi LIKE %:kw% OR p.isDelete = 0 and p.email LIKE %:kw%")
	public List<NhanVien> findByKeyWords(@Param("kw") String keywords);
}
