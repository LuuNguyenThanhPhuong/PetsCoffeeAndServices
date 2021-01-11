package Travel.vietnam.DAO;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import Travel.vietnam.Entity.Tour;

public interface TourDAO extends JpaRepository<Tour, Integer> {

	// Tìm Kiếm theo từ Khóa
	@Query("Select p FROM  Tour p "
			+ "where p.isDelete = 0 and p.tenTour LIKE %:kw% "
			+ "OR p.isDelete = 0 and p.ngayDi LIKE %:kw% "
			+ "OR p.isDelete = 0 and p.noiKhoiHanh LIKE %:kw% "
			+ "OR p.isDelete = 0 and p.phuongTien LIKE %:kw% "
			+ "OR p.isDelete = 0 and p.phuongTien1 LIKE %:kw% "
			+ "OR p.isDelete = 0 and p.phuongTien2 LIKE %:kw% ")
	List<Tour> findByKeyWords(@Param("kw") String keywords);

	// Lọc Theo Loại Tour
	@Query(value = "SELECT p FROM Tour p WHERE p.isDelete = 0 AND p.loaiTour.id=:id")
	public List<Tour> findByLoaiTour(@Param("id") String id);
	
	@Query(value = "SELECT p FROM Tour p WHERE p.giamGia > 0 and p.isDelete = 0")
	public List<Tour> findByGiamGia();
	
	@Query(value = "SELECT p FROM Tour p WHERE p.isDelete = :status ")
	public List<Tour> getAllTour(@Param("status") boolean status);

	

	


}
