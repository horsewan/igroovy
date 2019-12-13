import groovy.sql.Sql

def  static getTableNames(dbname){
    def sql=Global.getDBSql("information_schema")
    def list=[]
    sql.eachRow("SELECT TABLE_NAME FROM TABLES WHERE TABLE_SCHEMA='"+dbname+"'") { row ->
        def tableName=row.table_name
        //println tableName
        list << tableName
    }
    return list
}


def  static getColumns(tableName){
    def sql=Global.getDBSql("information_schema")
    def map=[:]
    sql.eachRow("SELECT COLUMN_NAME,COLUMN_TYPE,COLUMN_COMMENT FROM COLUMNS WHERE TABLE_NAME='"+tableName+"' order by ORDINAL_POSITION") { row ->
        def tableColName=row.column_name
        def tableColType=row.column_type
        def tableColComment=row.column_comment
        //println tableName
        map.put(tableColName,tableColType)
    }
    return map
}


def  static getTables(dbname){
    def sql=Global.getDBSql("information_schema")
    def listmap=[:]
    sql.eachRow("SELECT TABLE_NAME,TABLE_COMMENT FROM TABLES WHERE TABLE_SCHEMA='"+dbname+"'") { row ->
        def TableVO tableVO = new TableVO();
        def tableName = row.table_name
        def tableComment = row.table_comment
        tableVO.setTableName(tableName)
        tableVO.setTableComment(tableComment)
        def List<ColumnVO> columnVOList = new LinkedList<>()
        sql.eachRow("SELECT COLUMN_NAME,COLUMN_TYPE,COLUMN_COMMENT FROM COLUMNS WHERE TABLE_NAME='" + tableName + "' AND TABLE_SCHEMA='"+dbname+"' order by ORDINAL_POSITION") { crow ->
            def tableColName = crow.column_name
            def tableColType = crow.column_type
            def tableColComment = crow.column_comment
            ColumnVO columnVO = new ColumnVO()
            columnVO.setColumnName(tableColName)
            columnVO.setColumnType(tableColType)
            columnVO.setColumnComment(tableColComment)
            columnVOList.add(columnVO)
        }
        tableVO.setColumnVOList(columnVOList)
        listmap.put(tableName,tableVO)
    }
    return listmap
}
