package com.hospital.erp.surgery;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hospital.erp.member.MemberVO;
import com.hospital.erp.schedule.ScheduleService;
import com.hospital.erp.schedule.ScheduleVO;
import com.hospital.erp.util.TimeSetter;

@Controller
@RequestMapping("/surgery/*")
public class SurgeryController {
	
	@Autowired
	private SurgeryService surgeryService;
	
	@Autowired
	private ScheduleService scheduleService;
	
	@Autowired
	private TimeSetter timeSetter;
	
	@GetMapping("list") 
	public String surgeryList(Model model) throws Exception{ 

		List<SurgeryVO> allSurgeries = surgeryService.surgeryList();
		model.addAttribute("allSurgeries", allSurgeries);
		return "surgery/list";
		
	}
	
	@ResponseBody
	@PostMapping("update")
	public int surgeryUpdate(SurgeryVO surgeryVO)throws Exception{
		
		SurgeryVO check = surgeryService.surgeryCheck(surgeryVO);
		
		if(check == null) {
			surgeryService.surgeryUpdate(surgeryVO);
			return 1;
		}else {
			return 0;
		}
	}
	
	@ResponseBody
	@PostMapping("delete")
	public String surgeryDelete(SurgeryVO surgeryVO)throws Exception{
		
		surgeryService.surgeryDelete(surgeryVO);
		
		String st = "list";
		return st;
		
	}
	
	@ResponseBody
	@PostMapping("insert")
	public int surgeryInsert(SurgeryVO surgeryVO)throws Exception{
		
		SurgeryVO check = surgeryService.surgeryCheck(surgeryVO);
		
		if(check == null) {
			surgeryService.surgeryInsert(surgeryVO);
			return 1;
		}else {
			return 0;
		}	
	}
	
	@GetMapping("scheduleInsert") 
	public String surgeryScheduleInsert(SurgeryVO surgeryVO, Model model, ScheduleVO scheduleVO, String paramDate) throws Exception{ 
		
		surgeryVO = surgeryService.surgeryData(surgeryVO);
		model.addAttribute("surgeryVO", surgeryVO);
		
		if(paramDate != null) {
			String stringDate = timeSetter.stringDateChanger(paramDate);
	        SimpleDateFormat formatter = new SimpleDateFormat("dd MM yyyy");
	        Date date = formatter.parse(stringDate);    
	        LocalDate localDate = timeSetter.dateToLocalDate(date);
	        LocalDateTime localDateTime = localDate.atStartOfDay();
			String ldt = timeSetter.localDateTimeToString(localDateTime, "yyyy년 MM월 dd일");
			// view에 보여주기용 데이터
			model.addAttribute("ldt", ldt);
			
			LocalDateTime localDateTimeL = localDate.atTime(LocalTime.MAX);//(날짜 + 23:59:59:9999999)
			
			scheduleVO.setSchSdate(localDateTime);
			scheduleVO.setSchEdate(localDateTimeL);
		}else {
			LocalDate localDate = timeSetter.currentLocalDate();
			LocalDateTime localDateTime = localDate.atStartOfDay();
			String ldt = timeSetter.localDateTimeToString(localDateTime, "yyyy년 MM월 dd일");
			// view에 보여주기용 데이터
			model.addAttribute("ldt", ldt);
			
			LocalDateTime localDateTimeL = localDate.atTime(LocalTime.MAX);//(날짜 + 23:59:59:9999999)
			
			scheduleVO.setSchSdate(localDateTime);
			scheduleVO.setSchEdate(localDateTimeL);
		}
		
		scheduleVO.setCodeCd(15);
		scheduleVO.setSchFk(surgeryVO.getSurCd());	

		// 해당 날짜에 해당하는 (surgery) schedule을 조회
		List<ScheduleVO> list = scheduleService.scheduleList(scheduleVO);
		
		for (int i = 0; i < list.size(); i++) {
			list.get(i).setStartNum(Integer.parseInt(timeSetter.localDateTimeToString(list.get(i).getSchSdate(), "HHmm"))); 
			list.get(i).setEndNum(Integer.parseInt(timeSetter.localDateTimeToString(list.get(i).getSchEdate(), "HHmm")));	
		};
		
		model.addAttribute("list", list);
		
//		// 예약자 선택란을 위한 MEMBER 데이터
//		List<SurgeryParticiantVO> surgeryParticiantList =  surgeryService.memberList();
//		model.addAttribute("surgeryParticiantList", surgeryParticiantList);
		
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal(); 
	    UserDetails userDetails = (UserDetails)principal;
	    MemberVO memberVO = (MemberVO)userDetails;
	    model.addAttribute("memberVO", memberVO);
		
		return "surgery/scheduleInsert"; 	
	}
	
	@ResponseBody
	@PostMapping("reservation")
	public String surgeryReservationInsert(SurgeryReservationVO surgeryReservationVO, ScheduleVO scheduleVO, String memCd)throws Exception{
		
		Date date = timeSetter.stringToDate(surgeryReservationVO.getParamDate(), "yyyy년 MM월 dd일");
		LocalDateTime localDateTime = timeSetter.dateTolocalDateTime(date);
		scheduleVO.setSchSdate(localDateTime.plusHours(surgeryReservationVO.getSTime()));
		scheduleVO.setSchEdate(localDateTime.plusHours(surgeryReservationVO.getETime()));
		scheduleVO.setSchFk(surgeryReservationVO.getSurCd());
		scheduleVO.setCodeCd(15);
		scheduleVO.setMemCd(memCd);
		List<ScheduleVO> checkResult = surgeryService.surgeryScheduleCheck(scheduleVO);
		
		String result;
		if(checkResult.size()==0) {
			// 등록가능
			surgeryService.surgeryScheduleInsert(scheduleVO);
			result = "scheduleInsert?surCd="+surgeryReservationVO.getSurCd();
			return result;
		}else {
			// 등록 불가능
			result = "x";
			return result;
		}
	}
	
	@GetMapping("scheduleList") 
	public String surgeryScheduleList(ScheduleVO scheduleVO, Model model) throws Exception{ 
		
		scheduleVO.setCodeCd(15);
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal(); 
	    UserDetails userDetails = (UserDetails)principal;
	    MemberVO memberVO = (MemberVO)userDetails;
	    model.addAttribute("memberVO", memberVO);
		scheduleVO.setMemCd(memberVO.getMemCd());
		
		List<ScheduleVO> scheduleList = scheduleService.myScheduleList(scheduleVO);
		
		for(int i = 0; i < scheduleList.size(); i++) {
			scheduleList.get(i).setStartNumString(timeSetter.localDateTimeToString(scheduleList.get(i).getSchSdate(), "HH시 mm분"));
			scheduleList.get(i).setEndNumString(timeSetter.localDateTimeToString(scheduleList.get(i).getSchEdate(), "HH시 mm분"));
			scheduleList.get(i).setDateString(timeSetter.localDateTimeToString(scheduleList.get(i).getSchSdate(), "yyyy년 MM월 dd일"));
		}
	
		model.addAttribute("scheduleList", scheduleList);
		
		return "surgery/scheduleList"; 
		
	}
	
	@ResponseBody
	@PostMapping("scheduleDelete")
	public String surgeryScheduleDelete(ScheduleVO scheduleVO)throws Exception{
		
		scheduleService.surgeryScheduleDelete(scheduleVO);
		
		return "complete";
	}
	
	@GetMapping("scheduleData") 
	public String surgeryScheduleData() throws Exception{ 
		   
		return "surgery/scheduleData"; 
		
	}
	
	@GetMapping("update") 
	public String surgeryRoomList() throws Exception{ 
		   
		return "surgery/update"; 
		
	}
	
	@GetMapping("scheduleUpdate") 
	public String surgeryscheduleUpdate() throws Exception{ 
		   
		return "surgery/scheduleUpdate"; 
		
	}
}
