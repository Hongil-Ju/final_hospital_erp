package com.hospital.erp.surgery;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.hospital.erp.schedule.ScheduleVO;

@Mapper
public interface SurgeryDAO {

	public List<SurgeryVO> surgeryList() throws Exception;

	public void surgeryUpdate(SurgeryVO surgeryVO) throws Exception;

	public void surgeryDelete(SurgeryVO surgeryVO) throws Exception;

	public void surgeryInsert(SurgeryVO surgeryVO) throws Exception;

	public SurgeryVO surgeryData(SurgeryVO surgeryVO) throws Exception;

	public List<ScheduleVO> surgeryScheduleCheck(ScheduleVO scheduleVO) throws Exception;

	public void surgeryScheduleInsert(ScheduleVO scheduleVO) throws Exception;

	public SurgeryVO surgeryCheck(SurgeryVO surgeryVO) throws Exception;

//	public List<SurgeryParticiantVO> memberList() throws Exception;

}
