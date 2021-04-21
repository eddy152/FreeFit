package co.team.Facility.service;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class FacilityVO {
	private String facility_num;
	private String fitness_id;
	private String location;
	private String facility_name;
	private String special_content;
	private String purchase_date;
	private String broken;
	private String image;
}
