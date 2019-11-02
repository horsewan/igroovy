import groovy.sql.Sql

//def url="jdbc:mysql://192.168.1.169:3306/" ///information_schema
//def db_url_hr="jdbc:mysql://192.168.1.169:3306/hr"
//def db_url_yp="jdbc:mysql://192.168.1.169:3306/yp_enterprise"
//def username="root"
//def password="yopoun123456?"
//def driverClass="com.mysql.cj.jdbc.Driver"
//def sql = Sql.newInstance(db_url, username, password, driverClass)
//def srcSql=Sql.newInstance(db_url_hr, username, password, driverClass)
//def targetSql=Sql.newInstance(db_url_hr, username, password, driverClass)

def tablenames=TableColumns.getTables('hr')
tablenames.each{ t->
    //println t
}
// hr_addr_area={id=int(8), area_code=varchar(16), city_code=varchar(16), area_name=varchar(16), short_name=varchar(16), lng=varchar(32), lat=varchar(32)}
//hr_addr_city={id=int(8), city_code=varchar(16), city_name=varchar(16), short_name=varchar(8), province_code=varchar(16), lng=varchar(32), lat=varchar(32)}
//hr_addr_province={id=int(8), province_code=varchar(16), province_name=varchar(8), short_name=varchar(8), lng=varchar(32), lat=varchar(32)}
//hr_addr_street
//
def from_to_table_names=['hr_addr_area':'addr_area','hr_addr_city':'addr_city','hr_addr_province':'addr_province','hr_addr_street':'addr_street']
//def to_table_names=['addr_area','addr_city','addr_province','addr_street']

/*def fileList =ExportImport.export('hr','yp_enterprise',from_to_table_names)

def file = new File("initAddr.sql")
def writer=file.newPrintWriter()
fileList.each{line->
        writer.write(line)
        writer.write("\n")
}
writer.flush()
writer.close()
*/
from_to_table_names=['hr_sys_menu':'menu']
ExportImport.exportT('hr','yp_enterprise',from_to_table_names)

//def getTableInsertSql()


