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

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.NumberFormat;
@Entity
@Table(name = "Tour")
public class Tour {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "MaTour")
	private Integer maTour;
	
	@Column(name = "TenTour")
	private String tenTour;
	
	@NumberFormat(pattern =  "###,###.###")
	@Column(name = "GiaTour")
	private double giaTour;
	
	@Column(name = "NoiKhoiHanh")
	private String noiKhoiHanh;
	
	@Column( name ="IsDelete")
	private Boolean isDelete;
	
	@Column(name = "SoLuongKhach")
	private Integer soLuongKhach;
	
	@Column(name = "SoLuongDaDat")
	private Integer soLuongDaDat;
	
	@Column(name = "GiamGia")
	private Integer giamGia;
	
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm")
	@Column(name = "NgayDi")
	private Date ngayDi;
	
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm")
	@Column(name = "NgayVe")
	private Date ngayVe;
	
	@Column(name = "PhuongTien")
	private String phuongTien;
	
	@Column(name = "PhuongTien1")
	private String phuongTien1;
	
	@Column(name = "PhuongTien2")
	private String phuongTien2;
	
	@Column(name = "Hinh")
	private String hinh;
	
	@Column(name = "Hinh1")
	private String hinh1;
	
	@Column(name = "Hinh2")
	private String hinh2;
	
	@Column(name = "Hinh3")
	private String hinh3;
	
	@Column(name = "Video")
	private String video;
	
	@Column(name = "MoTa")
	private String moTa;
	

	@ManyToOne
	@JoinColumn(name ="idLoaiTour")
	LoaiTour loaiTour;
	
	@OneToMany(mappedBy = "tour")
	List<DonTour> donTour;

	public Integer getMaTour() {
		return maTour;
	}

	public String getTenTour() {
		return tenTour;
	}

	public double getGiaTour() {
		return giaTour;
	}

	public String getNoiKhoiHanh() {
		return noiKhoiHanh;
	}

	public Boolean getIsDelete() {
		return isDelete;
	}

	public Integer getSoLuongKhach() {
		return soLuongKhach;
	}

	public Integer getSoLuongDaDat() {
		return soLuongDaDat;
	}

	public Integer getGiamGia() {
		return giamGia;
	}

	public Date getNgayDi() {
		return ngayDi;
	}



	public String getPhuongTien() {
		return phuongTien;
	}

	public String getPhuongTien1() {
		return phuongTien1;
	}

	public String getPhuongTien2() {
		return phuongTien2;
	}

	public String getHinh() {
		return hinh;
	}

	public String getHinh1() {
		return hinh1;
	}

	public String getHinh2() {
		return hinh2;
	}

	public String getHinh3() {
		return hinh3;
	}

	public String getVideo() {
		return video;
	}

	public String getMoTa() {
		return moTa;
	}

	public LoaiTour getLoaiTour() {
		return loaiTour;
	}

	public List<DonTour> getDonTour() {
		return donTour;
	}

	public void setMaTour(Integer maTour) {
		this.maTour = maTour;
	}

	public void setTenTour(String tenTour) {
		this.tenTour = tenTour;
	}

	public void setGiaTour(double giaTour) {
		this.giaTour = giaTour;
	}

	public void setNoiKhoiHanh(String noiKhoiHanh) {
		this.noiKhoiHanh = noiKhoiHanh;
	}

	public void setIsDelete(Boolean isDelete) {
		this.isDelete = isDelete;
	}

	public void setSoLuongKhach(Integer soLuongKhach) {
		this.soLuongKhach = soLuongKhach;
	}

	public void setSoLuongDaDat(Integer soLuongDaDat) {
		this.soLuongDaDat = soLuongDaDat;
	}

	public void setGiamGia(Integer giamGia) {
		this.giamGia = giamGia;
	}

	public void setNgayDi(Date ngayDi) {
		this.ngayDi = ngayDi;
	}


	public void setPhuongTien(String phuongTien) {
		this.phuongTien = phuongTien;
	}

	public void setPhuongTien1(String phuongTien1) {
		this.phuongTien1 = phuongTien1;
	}

	public void setPhuongTien2(String phuongTien2) {
		this.phuongTien2 = phuongTien2;
	}

	public void setHinh(String hinh) {
		this.hinh = hinh;
	}

	public void setHinh1(String hinh1) {
		this.hinh1 = hinh1;
	}

	public void setHinh2(String hinh2) {
		this.hinh2 = hinh2;
	}

	public void setHinh3(String hinh3) {
		this.hinh3 = hinh3;
	}

	public void setVideo(String video) {
		this.video = video;
	}

	public void setMoTa(String moTa) {
		this.moTa = moTa;
	}

	public void setLoaiTour(LoaiTour loaiTour) {
		this.loaiTour = loaiTour;
	}

	public void setDonTour(List<DonTour> donTour) {
		this.donTour = donTour;
	}

	public Date getNgayVe() {
		return ngayVe;
	}

	public void setNgayVe(Date ngayVe) {
		this.ngayVe = ngayVe;
	}


	
	
}

