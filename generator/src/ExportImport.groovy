import groovy.sql.Sql

def static export(db_name,to_db_name,table_names) {
    def tablenames = TableColumns.getTables(db_name)
    def from_sql = Global.getDBSql(db_name)
    def to_sql = Global.getDBSql(to_db_name)
    List outFileList = []
    table_names.each() { tableKV ->
        //print tableKV.key + '-->'
        //println tableKV.value
        def fromTableName=tableKV.key
        def toTableName=tableKV.value
        def columsMap = tablenames.get(fromTableName)
        def sqlList=getSqlString(tableKV.key,tableKV.value,columsMap,from_sql,to_sql)
        outFileList=outFileList+sqlList

    }
    //println outFileList
    return outFileList
}

def static exportT(db_name,to_db_name,table_names) {
    def tablenames = TableColumns.getTables(db_name)
    def from_sql = Global.getDBSql(db_name)
    def to_sql = Global.getDBSql(to_db_name)
    table_names.each() { tableKV ->
       // print tableKV.key + '-->'
        //println tableKV.value
        def fromTableName=tableKV.key
        def toTableName=tableKV.value
        def columsMap = tablenames.get(fromTableName)
        getTSqlString(tableKV.key,tableKV.value,columsMap,from_sql,to_sql)

    }
}


def static getSqlString(from_tablename,to_table_name,columnsMap,from_sql,to_sql){
    def sqlList = []
    def f_sql_string='select * from '+ from_tablename +""
//    def insert_sql_string = "insert into ( TCLOUMNS ) " +tablename+ +" values ( TVALUES ) ; "
    from_sql.eachRow(f_sql_string){ row ->
        def columns=''
        def values=''
        columnsMap.each{  col ->
                columns=columns+col.key+","
                values=values+"'"+row[col.key]+"',"
        }
        columns=columns+"]"-",]"
        values=values+"]"-",]"
        def from_insert_sql = "insert into "+from_tablename+" ( "+columns+") "+" values ( "+values+" );"
        def to_insert_sql = "insert into "+to_table_name+" ( "+columns+") "+" values ( "+values+" );"
        //println to_insert_sql
        sqlList <<  to_insert_sql
        //to_sql.executeInsert(to_insert_sql)
    }

    return sqlList

}

def static getTSqlString(from_tablename,to_table_name,columnsMap,from_sql,to_sql){

    columnsMap=['id','name','p_id','url','order_num','menu_type','icon','permission']

    def f_sql_string='select id,name,p_id,url,order_num,menu_type,icon,permission from '+ from_tablename +" where menu_type=2  order by order_num"
//    def insert_sql_string = "insert into ( TCLOUMNS ) " +tablename+ +" values ( TVALUES ) ; "

    from_sql.eachRow(f_sql_string){ row ->
        def columns=''
        def values=''
        columnsMap.each{  col ->
            //println col.key
                columns = columns + col + ","
                values = values + "'" + row[col] + "',"
        }
        columns=columns+"]"-",]"
        values=values+"]"-",]"
       // def from_insert_sql = "insert into "+from_tablename+" ( "+columns+") "+" values ( "+values+" );"
        def to_insert_sql = "insert into "+to_table_name+" ( "+columns+") "+" values ( "+values+" );"
        println to_insert_sql
       // to_sql.executeInsert(to_insert_sql)
    }

}


