package jehc.zxmodules.service.impl;
import java.util.List;
import java.util.Map;
import jehc.xtmodules.xtcore.base.BaseService;
import jehc.xtmodules.xtcore.util.ExceptionUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import jehc.zxmodules.service.ZxPurchaseApplyDetailService;
import jehc.zxmodules.dao.ZxPurchaseApplyDetailDao;
import jehc.zxmodules.model.ZxPurchaseApplyDetail;

/**
* 行政采购申领详情表 
* 2018-01-15 09:50:27  季建吉
*/
@Service("zxPurchaseApplyDetailService")
public class ZxPurchaseApplyDetailServiceImpl extends BaseService implements ZxPurchaseApplyDetailService{
	@Autowired
	private ZxPurchaseApplyDetailDao zxPurchaseApplyDetailDao;
	/**
	* 分页
	* @param condition 
	* @return
	*/
	public List<ZxPurchaseApplyDetail> getZxPurchaseApplyDetailListByCondition(Map<String,Object> condition){
		try{
			return zxPurchaseApplyDetailDao.getZxPurchaseApplyDetailListByCondition(condition);
		} catch (Exception e) {
			/**捕捉异常并回滚**/
			throw new ExceptionUtil(e.getMessage(),e.getCause());
		}
	}
	/**
	* 查询对象
	* @param id 
	* @return
	*/
	public ZxPurchaseApplyDetail getZxPurchaseApplyDetailById(String id){
		try{
			ZxPurchaseApplyDetail zxPurchaseApplyDetail = zxPurchaseApplyDetailDao.getZxPurchaseApplyDetailById(id);
			return zxPurchaseApplyDetail;
		} catch (Exception e) {
			/**捕捉异常并回滚**/
			throw new ExceptionUtil(e.getMessage(),e.getCause());
		}
	}
	/**
	* 添加
	* @param zx_purchase_apply_detail 
	* @return
	*/
	public int addZxPurchaseApplyDetail(ZxPurchaseApplyDetail zxPurchaseApplyDetail){
		int i = 0;
		try {
			i = zxPurchaseApplyDetailDao.addZxPurchaseApplyDetail(zxPurchaseApplyDetail);
		} catch (Exception e) {
			i = 0;
			/**捕捉异常并回滚**/
			throw new ExceptionUtil(e.getMessage(),e.getCause());
		}
		return i;
	}
	/**
	* 修改
	* @param zx_purchase_apply_detail 
	* @return
	*/
	public int updateZxPurchaseApplyDetail(ZxPurchaseApplyDetail zxPurchaseApplyDetail){
		int i = 0;
		try {
			i = zxPurchaseApplyDetailDao.updateZxPurchaseApplyDetail(zxPurchaseApplyDetail);
		} catch (Exception e) {
			i = 0;
			/**捕捉异常并回滚**/
			throw new ExceptionUtil(e.getMessage(),e.getCause());
		}
		return i;
	}
	/**
	* 修改（根据动态条件）
	* @param zx_purchase_apply_detail 
	* @return
	*/
	public int updateZxPurchaseApplyDetailBySelective(ZxPurchaseApplyDetail zxPurchaseApplyDetail){
		int i = 0;
		try {
			i = zxPurchaseApplyDetailDao.updateZxPurchaseApplyDetailBySelective(zxPurchaseApplyDetail);
		} catch (Exception e) {
			i = 0;
			/**捕捉异常并回滚**/
			throw new ExceptionUtil(e.getMessage(),e.getCause());
		}
		return i;
	}
	/**
	* 删除
	* @param condition 
	* @return
	*/
	public int delZxPurchaseApplyDetail(Map<String,Object> condition){
		int i = 0;
		try {
			i = zxPurchaseApplyDetailDao.delZxPurchaseApplyDetail(condition);
		} catch (Exception e) {
			i = 0;
			/**捕捉异常并回滚**/
			throw new ExceptionUtil(e.getMessage(),e.getCause());
		}
		return i;
	}
	/**
	* 批量添加
	* @param zx_purchase_apply_detailList 
	* @return
	*/
	public int addBatchZxPurchaseApplyDetail(List<ZxPurchaseApplyDetail> zxPurchaseApplyDetailList){
		int i = 0;
		try {
			i = zxPurchaseApplyDetailDao.addBatchZxPurchaseApplyDetail(zxPurchaseApplyDetailList);
		} catch (Exception e) {
			i = 0;
			/**捕捉异常并回滚**/
			throw new ExceptionUtil(e.getMessage(),e.getCause());
		}
		return i;
	}
	/**
	* 批量修改
	* @param zx_purchase_apply_detailList 
	* @return
	*/
	public int updateBatchZxPurchaseApplyDetail(List<ZxPurchaseApplyDetail> zxPurchaseApplyDetailList){
		int i = 0;
		try {
			i = zxPurchaseApplyDetailDao.updateBatchZxPurchaseApplyDetail(zxPurchaseApplyDetailList);
		} catch (Exception e) {
			i = 0;
			/**捕捉异常并回滚**/
			throw new ExceptionUtil(e.getMessage(),e.getCause());
		}
		return i;
	}
	/**
	* 批量修改（根据动态条件）
	* @param zx_purchase_apply_detailList 
	* @return
	*/
	public int updateBatchZxPurchaseApplyDetailBySelective(List<ZxPurchaseApplyDetail> zxPurchaseApplyDetailList){
		int i = 0;
		try {
			i = zxPurchaseApplyDetailDao.updateBatchZxPurchaseApplyDetailBySelective(zxPurchaseApplyDetailList);
		} catch (Exception e) {
			i = 0;
			/**捕捉异常并回滚**/
			throw new ExceptionUtil(e.getMessage(),e.getCause());
		}
		return i;
	}
	/**
	* 清点入库（根据动态条件）
	* @param zx_purchase_apply_detailList 
	* @return
	*/
	public int updateBatchZxPurchaseApplystore(List<ZxPurchaseApplyDetail> zxPurchaseApplyDetailList){
		int i = 0;
			i = zxPurchaseApplyDetailDao.updateBatchZxPurchaseApplystore(zxPurchaseApplyDetailList);
		return i;
	}
	/**
	* 根据外键删除方法
	* @param apply_id
	* @return
	*/
	public int delZxPurchaseApplyDetailByForeignKey(String apply_id){
		int i = 0;
		try {
			i = zxPurchaseApplyDetailDao.delZxPurchaseApplyDetailByForeignKey(apply_id);
		} catch (Exception e) {
			i = 0;
			/**捕捉异常并回滚**/
			throw new ExceptionUtil(e.getMessage(),e.getCause());
		}
		return i;
	}
}
