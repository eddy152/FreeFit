package co.team.admin.service;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


//admin vo

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class AdminVO {

	private String admin_id;
	private String password;
}
