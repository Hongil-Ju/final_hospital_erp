package com.hospital.erp.equipment;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hospital.erp.common.CodeVO;
import com.hospital.erp.member.MemberVO;

@Service
public class EquipmentService {

	@Autowired 
	private EquipmentDAO equipmentDAO;

	public List<EquipmentVO> equipmentList() throws Exception {
		List<EquipmentVO> allEquipments = equipmentDAO.equipmentList();
		return allEquipments;
	}

	public List<CodeVO> categoriesList() throws Exception {
		List<CodeVO> categories = equipmentDAO.categoriesList();
		return categories;
	}

	public void codeUpdate(CodeVO codeVO) throws Exception {
		equipmentDAO.codeUpdate(codeVO);
	}

	public void codeInsert(CodeVO codeVO) throws Exception {
		equipmentDAO.codeInsert(codeVO);	
	}

	public void codeDelete(CodeVO codeVO) throws Exception {
		equipmentDAO.codeDelete(codeVO);
	}

	public List<EquipmentVO> equipmentListCategorySelected(CodeVO codeVO) {
		List<EquipmentVO> allEquipments = equipmentDAO.equipmentListCategorySelected(codeVO);
		return allEquipments;
	}
	
	// codeVO에 codeName값만 존재
	public CodeVO equipmentCodeData(CodeVO codeVO) {
		codeVO = equipmentDAO.equipmentCodeData(codeVO);
		return codeVO;
	}

	// codeVO에 codeCd값만 존재
	public CodeVO equipmentCodeData2(CodeVO codeVO) {
		codeVO = equipmentDAO.equipmentCodeData2(codeVO);
		return codeVO;
	}
	
	public void equipmentInsert(EquipmentVO equipmentVO) {
		equipmentDAO.equipmentInsert(equipmentVO);
	}

	public EquipmentVO equipmentData(EquipmentVO equipmentVO) {
		equipmentVO = equipmentDAO.equipmentData(equipmentVO);
		return equipmentVO;
	}

	public List<EquipmentHistoryVO> historyList(EquipmentVO equipmentVO) {
		List<EquipmentHistoryVO> equipmentHistoryVO = equipmentDAO.historyList(equipmentVO);
		return equipmentHistoryVO;
	}

	public MemberVO memberData(int memCd) {
		MemberVO memberVO = equipmentDAO.memberData(memCd);
		return memberVO;
	}

	public void equipmentDelete(EquipmentVO equipmentVO) {
		equipmentDAO.equipmentDelete(equipmentVO);
	}

	public void equipmentUpdate(EquipmentVO equipmentVO) {
		equipmentDAO.equipmentUpdate(equipmentVO);
	}

	public void equipmenthistoryInsert(EquipmentHistoryVO equipmentHistoryVO) {
		equipmentDAO.equipmenthistoryInsert(equipmentHistoryVO);
	}

	public void historyDelete(EquipmentHistoryVO equipmentHistoryVO) {
		equipmentDAO.historyDelete(equipmentHistoryVO);
	}

	public EquipmentHistoryVO equipmentHistoryData(EquipmentHistoryVO equipmentHistoryVO) {
		equipmentHistoryVO = equipmentDAO.equipmentHistoryData(equipmentHistoryVO);
		return equipmentHistoryVO;
	}

	public EquipmentHistoryVO equipmentHistoryCheck(EquipmentHistoryVO equipmentHistoryVO) {
		equipmentHistoryVO = equipmentDAO.equipmentHistoryCheck(equipmentHistoryVO);
		return equipmentHistoryVO;
	}

	public EquipmentVO codeCheck(CodeVO codeVO) {
		EquipmentVO ev = equipmentDAO.codeCheck(codeVO);
		return ev;
	}
	 
}
