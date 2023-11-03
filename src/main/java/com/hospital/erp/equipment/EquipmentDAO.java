package com.hospital.erp.equipment;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.hospital.erp.common.CodeVO;
import com.hospital.erp.member.MemberVO;

@Mapper
public interface EquipmentDAO {

	 public List<EquipmentVO> equipmentList() throws Exception;

	 public List<CodeVO> categoriesList() throws Exception;

	 public void codeUpdate(CodeVO codeVO) throws Exception;

	 public void codeInsert(CodeVO codeVO) throws Exception;

	 public void codeDelete(CodeVO codeVO) throws Exception;

	 public List<EquipmentVO> equipmentListCategorySelected(CodeVO codeVO);

	 public CodeVO equipmentCodeData(CodeVO codeVO);
	 
	 public CodeVO equipmentCodeData2(CodeVO codeVO);

	 public void equipmentInsert(EquipmentVO equipmentVO);

	 public EquipmentVO equipmentData(EquipmentVO equipmentVO);

	 public List<EquipmentHistoryVO> historyList(EquipmentVO equipmentVO);

	 public MemberVO memberData(int memCd);

	 public void equipmentDelete(EquipmentVO equipmentVO);

	 public void equipmentUpdate(EquipmentVO equipmentVO);

	 public void equipmenthistoryInsert(EquipmentHistoryVO equipmentHistoryVO);

	 public void historyDelete(EquipmentHistoryVO equipmentHistoryVO);

	 public EquipmentHistoryVO equipmentHistoryData(EquipmentHistoryVO equipmentHistoryVO);

	 public EquipmentHistoryVO equipmentHistoryCheck(EquipmentHistoryVO equipmentHistoryVO);

	 public EquipmentVO codeCheck(CodeVO codeVO);
	 
}
