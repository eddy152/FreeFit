package co.team.files.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.team.files.service.FilesService;
import co.team.files.service.FilesVO;

@Service
public class FilesServiceImpl implements FilesService {
	@Autowired
	FilesMapper mapper;

	@Override
	public int uploadImage(FilesVO vo) {

		return mapper.uploadImage(vo);
	}

}
