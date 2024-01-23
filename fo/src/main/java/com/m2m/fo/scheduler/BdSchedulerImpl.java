package com.m2m.fo.scheduler;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.m2m.fo.scheduler.BdSchedulerVO;
import com.m2m.fo.scheduler.mapper.BdSchedulerMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@EnableScheduling
public class BdSchedulerImpl implements BdScheduler {
	
	@Autowired
	private BdSchedulerMapper bdSchedulerMapper;
	
	@Override
	@Scheduled(cron = "0 0/1 * * * *", zone = "Asia/Seoul")
	public void lowDibSheduler() {
		log.info("########### 최저가 낙찰 스케쥴러 시작 ###########");
		
		// cnt:0 -> 낙찰업체 cnt:1~ -> 패찰업체
		int cnt = 0;
		
		BdSchedulerVO schedulerVO = new BdSchedulerVO();
		BdSchedulerVO cmpVO = new BdSchedulerVO();
		      
        // 현재날짜
        long currentValue = getNowDate();
        
        log.info("currentValue >>> ::: {}", currentValue);
        
		//투찰중인 목록 불러오기
		List<BdSchedulerVO> selectBidList = bdSchedulerMapper.selectBidList();
		       
		if(selectBidList != null && selectBidList.size() > 0) {
			for(BdSchedulerVO bdSchedulerVO : selectBidList) {
				
				String bidPblancIdbd = bdSchedulerVO.getBidPblancId();	//입찰공고 아이디
				
				// vo에 입찰공고아이디 주입
				schedulerVO.setBidPblancId(bidPblancIdbd);
				schedulerVO.setLastChangerId("admin");
				
				String bddprEndDt = bdSchedulerVO.getBddprEndDt();	//투찰종료시간			
				
				//투찰종료시간
				long EndDtValue = Long.parseLong(bddprEndDt);
				
				log.info("bidPblancIdbd >>> ::: {}", bidPblancIdbd);
				log.info("EndDtValue >>> ::: {}", EndDtValue);
				
				// currentValue-현재시간, EndDtValue-투찰마감시간
				// 현재시간이 투찰마감시간보다 크거나 같을때 -> 투찰한 기업 리스트 불러오기
				if(currentValue >= EndDtValue) {
					
					//투찰한 기업 리스트 불러오기
					List<BdSchedulerVO> selectCmpList = bdSchedulerMapper.selectCmpList(schedulerVO);
					
					log.info("selectCmpList >>> ::: {}", selectCmpList.size());
					
					if(selectCmpList.size() >0 && selectCmpList != null) {
						for(BdSchedulerVO bdCmpVO : selectCmpList) {
							String bidCompany = bdCmpVO.getBidEntrpsNo();	//입찰업체 번호
							String bidPblancid = bdCmpVO.getBidPblancId();	//입찰공고 아이디
							
							// vo에 업체번호,입찰공고 아이디 주입, 최초,수정 아이디
							cmpVO.setBidEntrpsNo(bidCompany);
							cmpVO.setBidPblancId(bidPblancIdbd);
							cmpVO.setLastChangerId("admin");
							cmpVO.setFrstRegisterId("admin");
							
							//첫번쨰 회사 낙찰로 업데이트
							if(cnt == 0) {
								// 입찰기본, 입찰상테 update
								bdSchedulerMapper.updateFirstCom(cmpVO);
								// 낙찰상세 insert
								bdSchedulerMapper.insetScsbidDtl(cmpVO);
								
								// 카운트 1증가
								cnt ++;
							}else {
								//두번째 회사부턴 패찰로 업데이트
								// 낙찰상세 insert
								bdSchedulerMapper.updateOtherCom(cmpVO);
							}
						}	
					}else {
						log.info("투찰한 기업이 존재하지 않습니다.");
						// 마감
						bdSchedulerMapper.updateNonCom(schedulerVO);
						
					}
				}
			}	
		}
		log.info("########### 최저가 낙찰 스케쥴러 종료 ###########");
	}
	
	@Override
	@Scheduled(cron = "0 0/1 * * * *", zone = "Asia/Seoul")
	public void changeBid() {
		log.info("########### 투찰중 상태이상 변경 스케쥴러 시작 ###########");
		BdSchedulerVO schedulerVO = new BdSchedulerVO();
		// 현재날짜
        long currentValue = getNowDate();
        
        //입찰예정 목록 불러오기
        List<BdSchedulerVO> selectPlanList = bdSchedulerMapper.selectPlanList();
        if(selectPlanList != null && selectPlanList.size() > 0) {
        	for(BdSchedulerVO bdSchedulerVO : selectPlanList) {
				
        		String bidPblancIdbd = bdSchedulerVO.getBidPblancId();	//입찰공고 아이디
				
				// vo에 주입
				schedulerVO.setBidPblancId(bidPblancIdbd);	//입찰공고아이디
				schedulerVO.setLastChangerId("admin");	//최종수정자
				
				String bddprStartDt = bdSchedulerVO.getBddprBeginDt();	//투찰시작시간			
				
				//투찰종료시간
				long StartDtValue = Long.parseLong(bddprStartDt);
				
				log.info("bidPblancIdbd >>> ::: {}", bidPblancIdbd);
				log.info("StartDtValue >>> ::: {}", StartDtValue);
				
				// currentValue-현재시간, EndDtValue-투찰시작시간
				// 현재시간이 투찰마감시간보다 크거나 같을때 -> 해당 공고의 상태값을 투찰중(13)으로 변환
				if(currentValue >= StartDtValue) {
					bdSchedulerMapper.updateBidPlan(schedulerVO);
				}				
        	}
        }
        log.info("########### 투찰중 상태이상 변경 스케쥴러 종료 ###########");
	}
	
	// 현재 날짜 숫자로 변환해서 가져오는 메소드
	private static long getNowDate() {
		// 현재 시간 얻기
        LocalDateTime currentTime = LocalDateTime.now();
        // 출력 포맷 지정 (선택사항)
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMddHHmmss");
        String formattedTime = currentTime.format(formatter);
        
        return Long.parseLong(formattedTime);
	}

}





















