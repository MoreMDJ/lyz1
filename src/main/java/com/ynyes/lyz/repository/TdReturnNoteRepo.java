package com.ynyes.lyz.repository;

import java.util.Date;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.ynyes.lyz.entity.TdReturnNote;

public interface TdReturnNoteRepo extends PagingAndSortingRepository<TdReturnNote, Long>, JpaSpecificationExecutor<TdReturnNote>{
	Page<TdReturnNote> findByDiySiteTitleOrOrderNumberOrReturnNumberOrUsername(String keywords, String keywords1, String keywords2, String keywords3, Pageable page);
	
	List <TdReturnNote> findByUsername(String username);
	
	List <TdReturnNote> findByOrderNumberContaining(String orderNumber);
	
	TdReturnNote findByReturnNumber(String returnNumber);
    //以前的退货查询方法
	List<TdReturnNote> findByStatusIdAndOrderTimeBetweenOrderByIdDesc(Long statusId, Date start, Date end);
	//以前的退货查询方法
	List<TdReturnNote> findByStatusIdAndOrderTimeAfterOrderByIdDesc(Long statusId, Date time);
	//以前的退货查询方法
	Integer countByStatusIdAndOrderTimeBetweenOrderByIdDesc(Long statusId, Date start, Date end);
	//以前的退货查询方法
	Integer countByStatusIdAndOrderTimeAfterOrderByIdDesc(Long statusId, Date time);
	
	Page<TdReturnNote> findByDiySiteId(Long siteId,Pageable page);
	
	Page<TdReturnNote> findByDiySiteIdAndReturnNumberContainingOrDiySiteIdAndOrderNumberContainingOrDiySiteIdAndUsernameContaining(Long siteId0,String returnNumebr,Long siteId1,String orderNumebr,Long siteId2,String username,Pageable page);
	
	@Query(value = "select ds.title from td_manager m join td_manager_role mr on m.role_id = "
			+ " mr.id left JOIN td_diy_site ds on m.diy_code = ds.store_code "
			+ " where mr.is_sys = 0 and m.username = ?1 ", nativeQuery = true)
	String findSiteTitleByUserName(String username);
	
	//退货查询 增加配送员编号
	List<TdReturnNote> findByDriverAndStatusIdAndOrderTimeBetweenOrderByIdDesc(String driver,Long statusId, Date start, Date end);
	//退货查询 增加配送员编号
	List<TdReturnNote> findByDriverAndStatusIdAndOrderTimeAfterOrderByIdDesc(String driver,Long statusId, Date time);
	//退货查询 增加配送员编号
	Integer countByDriverAndStatusIdAndOrderTimeBetweenOrderByIdDesc(String driver,Long statusId, Date start, Date end);
	//退货查询 增加配送员编号
	Integer countByDriverAndStatusIdAndOrderTimeAfterOrderByIdDesc(String driver,Long statusId, Date time);
}
