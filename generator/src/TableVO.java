import java.util.List;
public class TableVO {
    private String tableName;
    private String tableComment;
    private List<ColumnVO> columnVOList;

    public String getTableComment() {
        return tableComment;
    }

    public List<ColumnVO> getColumnVOList() {
        return columnVOList;
    }

    public String getTableName() {
        return tableName;
    }

    public void setColumnVOList(List<ColumnVO> columnVOList) {
        this.columnVOList = columnVOList;
    }

    public void setTableComment(String tableComment) {
        this.tableComment = tableComment;
    }

    public void setTableName(String tableName) {
        this.tableName = tableName;
    }
}
