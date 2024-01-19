package com.m2m.fo.bo.mapper;

import com.m2m.fo.bo.model.BoCoCommCdVO;
import com.m2m.fo.bo.model.BoMberVO;

import java.util.List;

public interface BoMberMngMapper {

    List<BoCoCommCdVO> getBoCommCdList();

    List<BoMberVO> getMberList(BoMberVO vo);
}
