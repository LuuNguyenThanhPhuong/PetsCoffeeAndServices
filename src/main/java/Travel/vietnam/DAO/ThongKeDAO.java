package Travel.vietnam.DAO;

import java.io.Serializable;
import java.util.List;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import Travel.vietnam.Entity.ThongKe;

public interface ThongKeDAO extends JpaRepository<ThongKe, Serializable>{
	
	
	
	@Query("SELECT new ThongKe(o.loaiTour.tenLoaiTour, "
			+ " sum(o.giaTour * o.soLuongKhach), "
			+ " count(o.giaTour),"
			+ " min(o.giaTour), "
			+ " max(o.giaTour), "
			+ " avg(o.giaTour)) "
			+ " FROM Tour o "
			+ " WHERE o.isDelete = 0"
			+ " GROUP BY o.loaiTour.tenLoaiTour")
	List<ThongKe> inventoryByLoaiTour();
//-------------------
	@Query("SELECT new ThongKe(o.tour.loaiTour.tenLoaiTour, "

			+ " sum(o.giaTour),"
			+ " count(o.trangThaiDuyetDon),"
			+ " min(o.giaTour), "
			+ " max(o.giaTour), "
			+ " avg(o.giaTour)) "
			+ " FROM DonTour o "
			+ " WHERE o.tinhTrang = 0"
			+ " GROUP BY o.tour.loaiTour.tenLoaiTour")
	List<ThongKe> revenueByLoaiTour();
	
//-------------------
	@Query("SELECT new ThongKe(o.khachHang.tenKhachHang, "
			
			+ " sum(o.giaTour),"
			+ " count(o.trangThaiDuyetDon),"
			+ " min(o.giaTour), "
			+ " max(o.giaTour), "
			+ " avg(o.giaTour)) "
			+ " FROM DonTour o "
			+ " WHERE o.tinhTrang = 0"
			+ " GROUP BY o.khachHang.tenKhachHang"
			+ " ORDER BY sum(o.giaTour) DESC")
	List<ThongKe> revenueByKhachHang(Pageable pageable);
//-------------------
	@Query("SELECT new ThongKe(month(o.ngayDat), "
			+ " sum(o.giaTour) , "
			+ " count(o.trangThaiDuyetDon),"
			+ " min(o.giaTour), "
			+ " max(o.giaTour), "
			+ " avg(o.giaTour)) "
			+ " FROM DonTour o "
			+ " WHERE o.tinhTrang = 0"
			+ " GROUP BY month(o.ngayDat)"
			+ " ORDER BY month(o.ngayDat)")
	List<ThongKe> revenueByMonth();

	@Query("SELECT new ThongKe(month(o.ngayDat), "
			+ " sum(o.giaTour), "
			+ " count(o.trangThaiDuyetDon),"
			+ " min(o.giaTour), "
			+ " max(o.giaTour), "
			+ " avg(o.giaTour)) "
			+ " FROM DonTour o "
			+ " WHERE o.trangThaiDuyetDon = -1"
			+ " GROUP BY month(o.ngayDat)"
			+ " ORDER BY month(o.ngayDat)")
	List<ThongKe> revenueByHuyTour();
	
	@Query("SELECT new ThongKe(year(o.ngayDat), "
			+ " sum(o.giaTour), "
			+ " count(o.trangThaiDuyetDon),"
			+ " min(o.giaTour), "
			+ " max(o.giaTour), "
			+ " avg(o.giaTour)) "
			+ " FROM DonTour o "
			+ " WHERE o.tinhTrang = 0"
			+ " GROUP BY year(o.ngayDat)"
			+ " ORDER BY year(o.ngayDat)")
	List<ThongKe> revenueByYear();
//-------------------
	@Query("SELECT new ThongKe(o.nhanVien.tenNhanVien, "
			+ " sum(o.giaTour),"
			+ " count(o.trangThaiDuyetDon),"
			+ " min(o.giaTour), "
			+ " max(o.giaTour), "
			+ " avg(o.giaTour)) "
			+ " FROM DonTour o "
			+ " WHERE o.tinhTrang = 0"
			+ " GROUP BY o.nhanVien.tenNhanVien"
			+ " ORDER BY sum(o.giaTour) DESC")
	List<ThongKe> revenueByNhanVien(Pageable pageable);
	//-------------------
		@Query("SELECT new ThongKe(o.tour.tenTour, "

				+ " sum(o.giaTour),"
				+ " count(o.trangThaiDuyetDon),"
				+ " min(o.giaTour), "
				+ " max(o.giaTour), "
				+ " avg(o.giaTour)) "
				+ " FROM DonTour o "
				+ " WHERE o.tinhTrang = 0"
				+ " GROUP BY o.tour.tenTour")
		List<ThongKe> revenueByTour();

}