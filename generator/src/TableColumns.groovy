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
    sql.eachRow("SELECT COLUMN_NAME,COLUMN_TYPE FROM COLUMNS WHERE TABLE_NAME='"+tableName+"'") { row ->
        def tableColName=row.column_name
        def tableColType=row.column_type
        //println tableName
        map.put(tableColName,tableColType)
    }
    return map
}


def  static getTables(dbname){
    def sql=Global.getDBSql("information_schema")
    def listmap=[:]
    sql.eachRow("SELECT TABLE_NAME FROM TABLES WHERE TABLE_SCHEMA='"+dbname+"'") { row ->
        def tableName=row.table_name
        def map=[:]
        sql.eachRow("SELECT COLUMN_NAME,COLUMN_TYPE FROM COLUMNS WHERE TABLE_NAME='"+tableName+"'") { crow ->
            def tableColName=crow.column_name
            def tableColType=crow.column_type
            //println tableName
            map.put(tableColName,tableColType)
        }
       listmap.put(tableName,map)
    }
    return listmap

}
