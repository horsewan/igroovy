import groovy.sql.Sql

def static getDBUrl(){
    return  "jdbc:mysql://192.168.1.169:3306/"
}

def static getDBUserName(){
    return  "root"
}

def static getDBPassword(){
    return  "yopoun123456?"   //
}

def static getDriverClass(){
    return  "com.mysql.cj.jdbc.Driver"
}

def static getDBSql(dbName){
    def dburl= Global.getDBUrl()+dbName+"?useUnicode=true&characterEncoding=UTF-8&allowMultiQueries=true&serverTimezone=GMT"

    def sql = Sql.newInstance(dburl, Global.getDBUserName(), Global.getDBPassword(), Global.getDriverClass())
    return sql
}



def static getPackage(){
    return "com.yp.enterprise"
}
def static getBaseDir(){
    return "out/"
}

def static getAuthor (){
    return "horse wan"
}
def static getDate(){
    return (new Date()).toString()
}

def static getBasicPackageDir(){
    def ret =getBaseDir()+getPackage().replaceAll("\\.","/")
    //println ret
    return ret //"out/com/yp/enterprise"
}

def static getEntityPackage(){
    return getPackage()+".entity"
}
def static getMapperPackage(){
    return getPackage()+".mapper"
}
def static getServicePackage(){
    return getPackage()+".service"
}
def static getServiceImplPackage(){
    return getPackage()+".service.impl"
}
def static getControllerPackage(){
    return getPackage()+".controller"
}

def static getEntityDir(){
    return getBasicPackageDir()+"/entity"
}
def static getMapperDir(){
    return getBasicPackageDir()+"/mapper"
}
def static getServiceDir(){
    return getBasicPackageDir()+"/service"
}
def static getServiceImplDir(){
    return getBasicPackageDir()+"/service/impl"
}
def static getControllerDir(){
    return getBasicPackageDir()+"/controller"
}

def static initDirs(){
    def dir = new File( getBaseDir())
    dir.deleteDir()
    def file = new File(getBaseDir())
    file.mkdirs()
    //def dirs =[]
    //dirs = (getBasicPackageDir()-getBaseDir()).split("/")
    file = new File(getBasicPackageDir())
    file.mkdirs()
    //file = new File('out/com/yp/enterprise')
    //file.mkdirs()
    file = new File(getEntityDir())
    file.mkdirs()
    file = new File(getMapperDir())
    file.mkdirs()
    file = new File(getServiceDir())
    file.mkdirs()
    file = new File(getServiceImplDir())
    file.mkdirs()
    file = new File(getControllerDir())
    file.mkdirs()

}

def static getClassName(str) {
    return toCamelStr(str).capitalize()
}
def static getVarName(str) {
    return toCamelStr(str)
}

def static toCamelStr(str) {
        if (!str || str.size() <= 1) return str
        String r = str.toLowerCase().split('_').collect { cc -> cc.capitalize() }.join('')
        return r[0].toLowerCase() + r[1..-1]
}


def static getType(str){
    str=str.toLowerCase()
    if (str.indexOf("date")>=0){
        return "Date"
    }else if(str.indexOf("int")>=0){
        return "Integer"
    }else if(str.indexOf("varchar")>=0){
        return "String"
    }else if(str.indexOf("char")>=0){
        return "String"
    }else if(str.indexOf("decimal")>=0) {
        return "BigDecimal"
    }else if(str.indexOf("float")>=0) {
        return "BigDecimal"
    }else if(str.indexOf("double")>=0) {
        return "BigDecimal"
    }else{
        return "String"
    }
}

