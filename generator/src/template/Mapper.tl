package {packageMapper};

import {packageEntity}.{entity};
import java.util.List;

/**
 * <p>
 * {tableComment} Mapper 接口
 * </p>
 *
 * @author ${author}
 * @since ${date}
 */
public interface {tableMapperName} {
   /**
     * 插入一条记录
     *
     * @param  {valueEntity} 实体对象
     */
    int insert({entity} {valueEntity} );

    /**
     * 根据 ID 删除
     *
     * @param id 主键ID
     */
    int deleteById(Integer id);

    /**
     * 删除（根据ID 批量删除）
     *
     * @param idList 主键ID列表(不能为 null 以及 empty)
     */
    int deleteBatchIds(List<Integer> idList);

    /**
     * 根据 ID 修改
     *
     * @param {valueEntity} 实体对象
     */
    int updateById({entity} {valueEntity});

    /**
     * 根据 ID 查询
     *
     * @param id 主键ID
     */
    {entity} selectById(Integer id);


    /**
     * 查询（根据ID 批量查询）
     *
     * @param idList 主键ID列表(不能为 null 以及 empty)
     */
    List<{entity}> selectBatchIds(List<Integer> idList);

    /**
     * 根据 Entity 条件，查询总记录数
     *
     * @param  {valueEntity} 实体对象封装操作类（可以为 null）
     */
    Integer selectCount({entity} {valueEntity});

    /**
     * 根据 entity 条件，查询全部记录
     *
     * @param {valueEntity} 实体对象封装操作类（可以为 null）
     */
    List<{entity}> selectList({entity} {valueEntity});

    /**
     * 根据 entity 条件，查询全部记录（并翻页）
     *
     * @param page         分页查询条件（可以为 RowBounds.DEFAULT）
     * @param {valueEntity} 体对象封装操作类（可以为 null）
     */
    IPage<{entity}> selectPage(IPage<{entity}> page, {entity} {valueEntity});
}
