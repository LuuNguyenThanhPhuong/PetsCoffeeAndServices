package Travel.vietnam.Entity;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class ThongKe {

	@Id
	Serializable group;
	Double sum;
	Long count;
	Double min;
	Double max;
	Double avg;
	public ThongKe(Serializable group, Double sum, Long count, Double min, Double max, Double avg) {
		super();
		this.group = group;
		this.sum = sum;
		this.count = count;
		this.min = min;
		this.max = max;
		this.avg = avg;
	}
	public ThongKe() {
		super();
	}
	public Serializable getGroup() {
		return group;
	}
	public void setGroup(Serializable group) {
		this.group = group;
	}
	public Double getSum() {
		return sum;
	}
	public void setSum(Double sum) {
		this.sum = sum;
	}
	public Long getCount() {
		return count;
	}
	public void setCount(Long count) {
		this.count = count;
	}
	public Double getMin() {
		return min;
	}
	public void setMin(Double min) {
		this.min = min;
	}
	public Double getMax() {
		return max;
	}
	public void setMax(Double max) {
		this.max = max;
	}
	public Double getAvg() {
		return avg;
	}
	public void setAvg(Double avg) {
		this.avg = avg;
	}
	
	
}