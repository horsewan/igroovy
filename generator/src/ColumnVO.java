public class ColumnVO {
    private String columnName;
    private String columnType;
    private String columnComment;

    public String getColumnComment() {
        return columnComment;
    }

    public String getColumnName() {
        return columnName;
    }

    public String getColumnType() {
        return columnType;
    }

    public void setColumnComment(String columnComment) {
        this.columnComment = columnComment;
    }

    public void setColumnName(String columnName) {
        this.columnName = columnName;
    }

    public void setColumnType(String columnType) {
        this.columnType = columnType;
    }
}
