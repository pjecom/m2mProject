package com.m2m.fo.bo.mapper;

import com.m2m.fo.bo.model.BoCoCommCdVO;
import com.m2m.fo.bo.model.BoMberVO;

import java.util.List;

public interface BoMberMngMapper {

    List<BoCoCommCdVO> getBoCommCdList();

    List<BoMberVO> getMberList(BoMberVO vo);

    BoMberVO getMberDtl(String bidEntrpsNo);

    int beforeIntrcpMber(String bidEntrpsNo);

    void intrcpMber(String bidEntrpsNo);

    void unlockMber(String bidEntrpsNo);

    void rejectMber(String bidEntrpsNo);

    void confmMber(String bidEntrpsNo);
}
