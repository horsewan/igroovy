package {packageEntity};

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import java.io.Serializable;
import java.util.Date;
import java.math.BigDecimal;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;

/**
 *
 * @author ${author}
 * @since ${date}
 * {tableComment}实体对象
 */


@Data
@ApiModel(value="{entity}实体对象", description="{tableComment}")

public class {entity} implements Serializable {
    private static final long serialVersionUID=1L;
## ----------  BEGIN 字段循环遍历  ----------
#foreach({fields})
    /**
     * {fieldComment}
     */
    @TableId(type = IdType.AUTO,value = "id")
    @ApiModelProperty(value = "{fieldComment}")
    private {fieldPropertyType} {fieldPropertyName};
#end#
## ----------  BEGIN 字段循环结束  ----------
}

