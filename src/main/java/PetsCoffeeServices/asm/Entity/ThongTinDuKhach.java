package PetsCoffeeServices.asm.Entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "ThongTinDuKhach")
public class ThongTinDuKhach {
	
//	@Column(name = "MaDonTour")
//	private String madontour;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "MaThongTin")
	private Integer maThongTin;
	
	@ManyToOne
	@JoinColumn(name ="maDonTour")
	DonTour donTour;
	
	@Column(name = "Cmnd")
	private Integer cmnd;
	
	@Column(name = "Sdt_Zalo")
	private String sdtZalo;
	
	@Column(name = "TenDuKhach")
	private String tenDuKhach;
	
	
	@Column( name ="GioiTinh")
	private String gioiTinh;
	

	public Integer getMaThongTin() {
		return maThongTin;
	}

	public void setMaThongTin(Integer maThongTin) {
		this.maThongTin = maThongTin;
	}

	public DonTour getDonTour() {
		return donTour;
	}

	public void setDonTour(DonTour donTour) {
		this.donTour = donTour;
	}

	public Integer getCmnd() {
		return cmnd;
	}

	public void setCmnd(Integer cmnd) {
		this.cmnd = cmnd;
	}



	public String getGioiTinh() {
		return gioiTinh;
	}

	public void setGioiTinh(String gioiTinh) {
		this.gioiTinh = gioiTinh;
	}


	public String getSdtZalo() {
		return sdtZalo;
	}

	public void setSdtZalo(String sdtZalo) {
		this.sdtZalo = sdtZalo;
	}

	public String getTenDuKhach() {
		return tenDuKhach;
	}

	public void setTenDuKhach(String tenDuKhach) {
		this.tenDuKhach = tenDuKhach;
	}

	
	
}
