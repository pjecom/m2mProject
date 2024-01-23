package com.m2m.fo.bo.service;

import com.m2m.fo.bo.model.BoCoCommCdVO;
import com.m2m.fo.bo.model.BoMberVO;

import java.util.List;

public interface BoMberMngService {

    List<BoCoCommCdVO> getBoCommCdList();

    int getMberCnt(BoMberVO vo);

    List<BoMberVO> getMberList(BoMberVO vo);

    BoMberVO getMberDtl(String bidEntrpsNo);

    int beforeIntrcpMber(String bidEntrpsNo);

    void intrcpMber(String bidEntrpsNo);

    void unlockMber(String bidEntrpsNo);

    void confmMber(String bidEntrpsNo);

    void rejectMber(String bidEntrpsNo);
}
