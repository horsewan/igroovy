import groovy.sql.Sql

def static getDBUrl(){
    return  "jdbc:mysql://192.168.1.169:3306/"
}

def static getDBUserName(){
    return  "root"
}

def static getDBPassword(){
    return  "yopoun123456?"
}

def static getDriverClass(){
    return  "com.mysql.cj.jdbc.Driver"
}

def static getDBSql(dbName){
    def dburl= Global.getDBUrl()+dbName+"?useUnicode=true&characterEncoding=UTF-8&allowMultiQueries=true"
    def sql = Sql.newInstance(dburl, Global.getDBUserName(), Global.getDBPassword(), Global.getDriverClass())
    return sql
}