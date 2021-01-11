package Travel.vietnam.Entity;


import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.Cascade;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.NumberFormat;

@Entity
@Table(name ="DonTour")
public class DonTour {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column( name ="MaDonTour")
	private Integer maDonTour;
	
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "dd/MM/yyyy HH:mm:ss")
	@Column( name ="NgayDat")
	private Date ngayDat = new Date();
	
	@NumberFormat(pattern =  "###,###.###")
	@Column( name ="GiaTour")
	private double giaTour;
	
	@Column( name ="SoLuongKhach")
	private Integer soLuongKhach;
	
	@Column( name ="TrangThaiThanhToan")
	private Boolean trangThaiThanhToan;
	
	@Column( name ="TrangThaiDuyetDon")
	private Integer trangThaiDuyetDon;
	
	@Column( name ="TinhTrang")
	private Integer tinhTrang;
	
	@Column( name ="GhiChu")
	private  String ghiChu;

	
	@OneToMany(mappedBy = "donTour")
	@Cascade(value= {org.hibernate.annotations.CascadeType.SAVE_UPDATE, org.hibernate.annotations.CascadeType.DELETE})
	List<ThongTinDuKhach> thongTinDuKhach; 
	
	@ManyToOne
	@JoinColumn(name = "maNhanVien")
	NhanVien nhanVien;
	
	@ManyToOne
	@JoinColumn(name = "maKhachHang")
	KhachHang khachHang;
	
	@ManyToOne
	@JoinColumn(name = "maTour")
	Tour tour;

	public Integer getMaDonTour() {
		return maDonTour;
	}

	public void setMaDonTour(Integer maDonTour) {
		this.maDonTour = maDonTour;
	}





	public Date getNgayDat() {
		return ngayDat;
	}

	public void setNgayDat(Date ngayDat) {
		this.ngayDat = ngayDat;
	}

	public double getGiaTour() {
		return giaTour;
	}

	public void setGiaTour(double giaTour) {
		this.giaTour = giaTour;
	}

	public Integer getSoLuongKhach() {
		return soLuongKhach;
	}

	public void setSoLuongKhach(Integer soLuongKhach) {
		this.soLuongKhach = soLuongKhach;
	}




	public Boolean getTrangThaiThanhToan() {
		return trangThaiThanhToan;
	}

	public void setTrangThaiThanhToan(Boolean trangThaiThanhToan) {
		this.trangThaiThanhToan = trangThaiThanhToan;
	}

	public Integer getTrangThaiDuyetDon() {
		return trangThaiDuyetDon;
	}

	public void setTrangThaiDuyetDon(Integer trangThaiDuyetDon) {
		this.trangThaiDuyetDon = trangThaiDuyetDon;
	}

	public String getGhiChu() {
		return ghiChu;
	}

	public void setGhiChu(String ghiChu) {
		this.ghiChu = ghiChu;
	}

	public List<ThongTinDuKhach> getThongTinDuKhach() {
		return thongTinDuKhach;
	}

	public void setThongTinDuKhach(List<ThongTinDuKhach> thongTinDuKhach) {
		this.thongTinDuKhach = thongTinDuKhach;
	}

	public NhanVien getNhanVien() {
		return nhanVien;
	}

	public void setNhanVien(NhanVien nhanVien) {
		this.nhanVien = nhanVien;
	}

	public KhachHang getKhachHang() {
		return khachHang;
	}

	public void setKhachHang(KhachHang khachHang) {
		this.khachHang = khachHang;
	}

	public Tour getTour() {
		return tour;
	}

	public void setTour(Tour tour) {
		this.tour = tour;
	}

	public Integer getTinhTrang() {
		return tinhTrang;
	}

	public void setTinhTrang(Integer tinhTrang) {
		this.tinhTrang = tinhTrang;
	}




}
