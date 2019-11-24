package {packageEntity};

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;
import java.io.Serializable;
import java.util.Date;

/**
 *
 * @author ${author}
 * @since ${date}
 * {tableComment}实体对象
 */


@Data

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

