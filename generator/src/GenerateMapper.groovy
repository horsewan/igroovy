def static generateMapperJAVA(db_name){
    def templateContent = []
    def temlateFile = new File("template/Mapper.tl")
    temlateFile.eachLine{ line ->
        templateContent << line
    }
    def tablenames=TableColumns.getTables(db_name)
    def colLines = []
    def lineStatus = 0
    tablenames.each{ t->
        println t.key+"----+++++>"
        def entityName = t.key
        TableVO tableVO = tablenames.get(t.key)
        def mapperName = Global.getClassName(t.key)+"Mapper"
        def outFile = new File(Global.getMapperDir()+"/"+mapperName+".java")
        def writer=outFile.newPrintWriter()

        templateContent.each{line->
            if(line.indexOf("#foreach({fields})")>=0 ){
                lineStatus=1
            } else if(line.indexOf("#end#")>=0 ){
                lineStatus=0
                doWriteColumns(tableVO,writer,colLines)
                colLines = []
            }else if ( lineStatus ==0) {
                line = line.replaceAll("\\{packageEntity\\}",Global.getEntityPackage())
                line = line.replaceAll("\\{packageMapper\\}",Global.getMapperPackage())
                line = line.replaceAll("\\{author\\}",Global.getAuthor())
                line = line.replaceAll("\\{date\\}",Global.getDate())
                line = line.replaceAll("\\{valueEntity\\}",Global.getVarName(entityName))
                line = line.replaceAll("\\{entity\\}",Global.getClassName(entityName))
                line = line.replaceAll("\\{tableComment\\}",tableVO.getTableComment())
                line = line.replaceAll("\\{tableMapperName\\}",mapperName)
                if(line.indexOf("##")<0){
                    writer.write(line)
                    writer.write("\n")
                }
            }else if ( lineStatus ==1){
                colLines.add(line)
            }
        }
        writer.flush()
        writer.close()
    }

}

def static generateMapperXML(db_name){

}


def  static doWriteColumns (TableVO tableVO,writer,colLines) {
    def columnList = tableVO.getColumnVOList()
    columnList.forEach { col ->
        // def ColumnVO columnVO = new ColumnVO();
        // columnVO.getColumnName()
        def colName = col.getColumnName()
        println colName
        def colType = col.getColumnType()
        def colComment = col.getColumnComment()
        colLines.each{ line ->
            line = line.replaceAll("\\{fieldPropertyType\\}",Global.getType(colType))
            line = line.replaceAll("\\{fieldPropertyName\\}",Global.getVarName(colName))
            line = line.replaceAll("\\{fieldComment\\}",colComment)
            writer.write(line)
            writer.write("\n")
        }
    }
}





