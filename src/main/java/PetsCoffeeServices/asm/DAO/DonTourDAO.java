package PetsCoffeeServices.asm.DAO;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import PetsCoffeeServices.asm.Entity.DonTour;

public interface DonTourDAO extends JpaRepository<DonTour, Integer>{

	@Query("Select p FROM  DonTour p "
			+ "where p.nhanVien.tenNhanVien LIKE %:kw% AND p.trangThaiDuyetDon = 1 "
			+ "OR  p.soLuongKhach LIKE %:kw% AND p.trangThaiDuyetDon = 1  "
			+ "OR p.nhanVien.maNhanVien LIKE %:kw% AND p.trangThaiDuyetDon = 1  "
			+ "OR p.khachHang.tenKhachHang LIKE %:kw% AND p.trangThaiDuyetDon = 1 "
			+ "OR  p.khachHang.maKhachHang LIKE %:kw% AND p.trangThaiDuyetDon = 1  "
			+ "OR p.nhanVien.tenNhanVien LIKE %:kw% AND p.trangThaiDuyetDon = 0  "
			+ "OR  p.soLuongKhach LIKE %:kw% AND p.trangThaiDuyetDon = 0  "
			+ "OR p.nhanVien.maNhanVien LIKE %:kw% AND p.trangThaiDuyetDon = 0  "
			+ "OR p.khachHang.tenKhachHang LIKE %:kw% AND p.trangThaiDuyetDon = 0 "
			+ "OR  p.khachHang.maKhachHang LIKE %:kw% AND p.trangThaiDuyetDon = 0"
			+ "OR p.tour.tenTour LIKE %:kw% AND p.trangThaiDuyetDon = 1 "
			+ "OR  p.tour.tenTour LIKE %:kw% AND p.trangThaiDuyetDon = 0"
			+ " ORDER BY p.ngayDat DESC")
	public List<DonTour> findByKeyWords(@Param("kw") String keywords);
	
	
	@Query(value = "SELECT p FROM DonTour p WHERE p.trangThaiDuyetDon = :status ORDER BY p.ngayDat DESC")
	public List<DonTour> findByTrangThai(@Param("status") int status);
	
	@Query("Select p FROM  DonTour p WHERE p.khachHang.maKhachHang=:maKhachHang AND p.trangThaiDuyetDon = :status "
			+ "ORDER BY p.ngayDat DESC")
	public List<DonTour> findByTrangThaiKhachHang(@Param("maKhachHang") String maKhachHang, @Param("status") int status);
	
	@Query("Select p FROM  DonTour p WHERE p.nhanVien.maNhanVien=:maNhanVien AND p.tinhTrang = :status "
			+ "AND p.trangThaiDuyetDon = 1")
	public List<DonTour> findByTinhTrang(@Param("maNhanVien") String maNhanVien, @Param("status") int status);
	
}
