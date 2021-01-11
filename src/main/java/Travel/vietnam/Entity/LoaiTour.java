package Travel.vietnam.Entity;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "LoaiTour")
public class LoaiTour {
	
	@Id
	@Column(name = "IdLoaiTour")
	private String idLoaiTour;
	
	@Column(name = "TenLoaiTour")
	private String tenLoaiTour;
	
	@OneToMany(mappedBy = "loaiTour")
	List<Tour> tour;

	public String getIdLoaiTour() {
		return idLoaiTour;
	}

	public void setIdLoaiTour(String idLoaiTour) {
		this.idLoaiTour = idLoaiTour;
	}

	public String getTenLoaiTour() {
		return tenLoaiTour;
	}

	public void setTenLoaiTour(String tenLoaiTour) {
		this.tenLoaiTour = tenLoaiTour;
	}

	public List<Tour> getTour() {
		return tour;
	}

	public void setTour(List<Tour> tour) {
		this.tour = tour;
	}

	
	
}
