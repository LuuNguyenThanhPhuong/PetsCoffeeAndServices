package Travel.vietnam.Entity;

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
@Table(name ="NhanVien")
public class NhanVien {

	@Id
	@Column( name ="MaNhanVien")
	private String maNhanVien;
	
	@Column( name ="TenNhanVien")
	private String tenNhanVien;
	
	@Column( name ="SoDienThoai")
	private String soDienThoai;
	
	@Column( name ="IsDelete")
	private Boolean isDelete;

	@Column( name ="Email")
	private String email;
	
	@Column( name ="Password")
	private String password;
	
	@Column( name ="DiaChi")
	private String diaChi;
	
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@Column( name ="NgaySinh")
	private Date ngaySinh;
	
	@Column( name ="Hinh")
	private String hinh;
	
	@Column( name ="GioiTinh")
	private String gioiTinh;
	
	@Column( name ="VaiTro")
	private  Boolean vaiTro;
	
	@OneToMany(mappedBy = "nhanVien")
	List<DonTour> donTour;





	public String getMaNhanVien() {
		return maNhanVien;
	}

	public void setMaNhanVien(String maNhanVien) {
		this.maNhanVien = maNhanVien;
	}

	public String getTenNhanVien() {
		return tenNhanVien;
	}

	public void setTenNhanVien(String tenNhanVien) {
		this.tenNhanVien = tenNhanVien;
	}



	public String getSoDienThoai() {
		return soDienThoai;
	}

	public void setSoDienThoai(String soDienThoai) {
		this.soDienThoai = soDienThoai;
	}

	public Boolean getIsDelete() {
		return isDelete;
	}

	public void setIsDelete(Boolean isDelete) {
		this.isDelete = isDelete;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
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

	public Date getNgaySinh() {
		return ngaySinh;
	}

	public void setNgaySinh(Date ngaySinh) {
		this.ngaySinh = ngaySinh;
	}

	public String getHinh() {
		return hinh;
	}

	public void setHinh(String hinh) {
		this.hinh = hinh;
	}

	public String getGioiTinh() {
		return gioiTinh;
	}

	public void setGioiTinh(String gioiTinh) {
		this.gioiTinh = gioiTinh;
	}



	public Boolean getVaiTro() {
		return vaiTro;
	}

	public void setVaiTro(Boolean vaiTro) {
		this.vaiTro = vaiTro;
	}

	public List<DonTour> getDonTour() {
		return donTour;
	}

	public void setDonTour(List<DonTour> donTour) {
		this.donTour = donTour;
	}




	
}
