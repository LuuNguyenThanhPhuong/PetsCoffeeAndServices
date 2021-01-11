package PetsCoffeeServices.asm.Entity;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name ="KhachHang")
public class KhachHang {

	@Id
	@Column( name ="MaKhachHang")
	private String maKhachHang;
	
	@Column( name ="TenKhachHang")
	private String tenKhachHang;
	
	@Column( name ="SoDienThoai")
	private String soDienThoai;
	
	@Column( name ="Cmnd")
	private Integer cmnd;
	
	@Column( name ="Email")
	private String email;
	
	@Column( name ="IsDelete")
	private Boolean isDelete;
	
	@Column( name ="Password")
	private String password;
	
	@Column( name ="DiaChi")
	private String diaChi;
	
	@Column( name ="Hinh")
	private String hinh;
	
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@Column( name ="NgaySinh")
	private Date ngaySinh;
	
	@Column ( name ="Active")
	private boolean active;
	
	@OneToMany(mappedBy = "khachHang")
	List<DonTour> donTour;





	public String getMaKhachHang() {
		return maKhachHang;
	}

	public void setMaKhachHang(String maKhachHang) {
		this.maKhachHang = maKhachHang;
	}

	public String getTenKhachHang() {
		return tenKhachHang;
	}

	public void setTenKhachHang(String tenKhachHang) {
		this.tenKhachHang = tenKhachHang;
	}


	public String getSoDienThoai() {
		return soDienThoai;
	}

	public void setSoDienThoai(String soDienThoai) {
		this.soDienThoai = soDienThoai;
	}

	public Integer getCmnd() {
		return cmnd;
	}

	public void setCmnd(Integer cmnd) {
		this.cmnd = cmnd;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Boolean getIsDelete() {
		return isDelete;
	}

	public void setIsDelete(Boolean isDelete) {
		this.isDelete = isDelete;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getDiaChi() {
		return diaChi;
	}

	public void setDiaChi(String diaChi) {
		this.diaChi = diaChi;
	}

	public String getHinh() {
		return hinh;
	}

	public void setHinh(String hinh) {
		this.hinh = hinh;
	}

	public Date getNgaySinh() {
		return ngaySinh;
	}

	public void setNgaySinh(Date ngaySinh) {
		this.ngaySinh = ngaySinh;
	}

	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}

	public List<DonTour> getDonTour() {
		return donTour;
	}

	public void setDonTour(List<DonTour> donTour) {
		this.donTour = donTour;
	}



	
}
