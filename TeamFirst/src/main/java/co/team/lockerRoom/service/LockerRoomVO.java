package co.team.lockerRoom.service;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class LockerRoomVO {
	private String room_no;
	private String gender;
	private String lock_width;
	private String lock_sum;
}
