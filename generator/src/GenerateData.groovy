import groovy.sql.Sql

import java.text.ParseException
import java.text.SimpleDateFormat

def static getRandomName(){
    def xings= ["赵","钱","孙","李","周","吴","郑","王","冯","陈","褚","卫","蒋","沈","韩","杨","朱","秦","尤","许",
                    "何","吕","施","张","孔","曹","严","华","金","魏","陶","姜","戚","谢","邹","喻","柏","水","窦","章","云","苏","潘","葛","奚","范","彭","郎",
                    "鲁","韦","昌","马","苗","凤","花","方","俞","任","袁","柳","酆","鲍","史","唐","费","廉","岑","薛","雷","贺","倪","汤","滕","殷",
                    "罗","毕","郝","邬","安","常","乐","于","时","傅","皮","卞","齐","康","伍","余","元","卜","顾","孟","平","黄","和",
                    "穆","萧","尹","姚","邵","湛","汪","祁","毛","禹","狄","米","贝","明","臧","计","伏","成","戴","谈","宋","茅","庞","熊","纪","舒",
                    "屈","项","祝","董","梁","杜","阮","蓝","闵","席","季","麻","强","贾","路","娄","危","江","童","颜","郭","梅","盛","林","刁","钟",
                    "徐","邱","骆","高","夏","蔡","田","樊","胡","凌","霍","虞","万","支","柯","昝","管","卢","莫","经","房","裘","缪","干","解","应",
                    "宗","丁","宣","贲","邓","郁","单","杭","洪","包","诸","左","石","崔","吉","钮","龚","程","嵇","邢","滑","裴","陆","荣","翁","荀",
                    "羊","于","惠","甄","曲","家","封","芮","羿","储","靳","汲","邴","糜","松","井","段","富","巫","乌","焦","巴","弓","牧","隗","山",
                    "谷","车","侯","宓","蓬","全","郗","班","仰","秋","仲","伊","宫","宁","仇","栾","暴","甘","钭","厉","戎","祖","武","符","刘","景",
                    "詹","束","龙","叶","幸","司","韶","郜","黎","蓟","溥","印","宿","白","怀","蒲","邰","从","鄂","索","咸","籍","赖","卓","蔺","屠",
                    "蒙","池","乔","阴","郁","胥","能","苍","双","闻","莘","党","翟","谭","贡","劳","逄","姬","申","扶","堵","冉","宰","郦","雍","却",
                    "璩","桑","桂","濮","牛","寿","通","边","扈","燕","冀","浦","尚","农","温","别","庄","晏","柴","瞿","阎","充","慕","连","茹","习",
                    "宦","艾","鱼","容","向","古","易","慎","戈","廖","庾","终","暨","居","衡","步","都","耿","满","弘","匡","国","文","寇","广","禄",
                    "阙","东","欧","殳","沃","利","蔚","越","夔","隆","师","巩","厍","聂","晁","勾","敖","融","冷","訾","辛","阚","那","简","饶","空",
                    "曾","毋","沙","乜","养","鞠","须","丰","巢","关","蒯","相","查","后","荆","红","游","郏","竺","权","逯","盖","益","桓","公","仉",
                    "督","岳","帅","缑","亢","况","郈","有","琴","归","海","晋","楚","闫","法","汝","鄢","涂","钦","商","牟","佘","佴","伯","赏","墨",
                    "哈","谯","篁","年","爱","阳","佟","言","福","南","火","铁","迟","漆","官","冼","真","展","繁","檀","祭","密","敬","揭","舜","楼",
                    "疏","冒","浑","挚","胶","随","高","皋","原","种","练","弥","仓","眭","蹇","覃","阿","门","恽","来","綦","召","仪","风","介","巨",
                    "木","京","狐","郇","虎","枚","抗","达","杞","苌","折","麦","庆","过","竹","端","鲜","皇","亓","老","是","秘","畅","邝","还","宾",
                    "闾","辜","纵","侴","万俟","司马","上官","欧阳","夏侯","诸葛","闻人","东方","赫连","皇甫","羊舌","尉迟","公羊","澹台","公冶","宗正",
                    "濮阳","淳于","单于","太叔","申屠","公孙","仲孙","轩辕","令狐","钟离","宇文","长孙","慕容","鲜于","闾丘","司徒","司空","兀官","司寇",
                    "南门","呼延","子车","颛孙","端木","巫马","公西","漆雕","车正","壤驷","公良","拓跋","夹谷","宰父","谷梁","段干","百里","东郭","微生",
                    "梁丘","左丘","东门","西门","南宫","第五","公仪","公乘","太史","仲长","叔孙","屈突","尔朱","东乡","相里","胡母","司城","张廖","雍门",
                    "毋丘","贺兰","綦毋","屋庐","独孤","南郭","北宫","王孙"];
     def mings = ["碧凡","夏菡","曼香","若烟","半梦","雅绿","冰蓝","灵槐","平安","书翠","翠风","香巧","代云","友巧","听寒","梦柏","醉易","访旋","亦玉","凌萱","访卉","怀亦","笑蓝","春翠",
                       "靖柏","书雪","乐枫","念薇","靖雁","寻春","恨山","从寒","忆香","觅波","静曼","凡旋","新波","代真","新蕾","雁玉","冷卉","紫山","千琴","恨天","傲芙","盼山","怀蝶",
                       "冰兰","问旋","从南","白易","问筠","如霜","半芹","寒雁","怜云","寻文","谷雪","乐萱","涵菡","海莲","傲蕾","青槐","冬儿","易梦","惜雪","宛海","之柔","夏青","大头","狗蛋"];



    def random = new Random();

    def  index = random.nextInt(xings.size()-1);
    def  name = xings[index]; //获得一个随机的姓氏
    def mindex = random.nextInt(mings.size()+50);
    if(mindex<mings.size()) return name+=mings[mindex]
    /* 从常用字中选取一个或两个字作为名 */
    if(random.nextBoolean()){
        name+=getChinese()+getChinese();
    }else {
        name+=getChinese();
    }
    return name;
}

 def static String getChinese() {
    String str = null;
    int highPos, lowPos;
    Random random = new Random();
    highPos = (176 + Math.abs(random.nextInt(71)));//区码，0xA0打头，从第16区开始，即0xB0=11*16=176,16~55一级汉字，56~87二级汉字
    random=new Random();
    lowPos = 161 + Math.abs(random.nextInt(94));//位码，0xA0打头，范围第1~94列

    byte[] bArr = new byte[2];
    bArr[0] = (new Integer(highPos)).byteValue();
    bArr[1] = (new Integer(lowPos)).byteValue();
    try {
        str = new String(bArr, "GB2312");	//区位码组合成汉字
    } catch (UnsupportedEncodingException e) {
        e.printStackTrace();
    }
    return str;
}

def static getRandomPhone(){
    Random random = new Random();
    int[] nums = new int[10];
        for(int j = 0; j <10 ;j++){
            if(j == 0){
                nums[j] = random.nextInt(7)+3;
                //System.out.print(nums[j]);
                continue;
            }
            nums[j] = random.nextInt(10);
        }
    return (("1"+nums)-"["-","-"]"-","-","-","-","-","-","-","-","-","-","-" "-" "-" "-" "-" "-" "-" "-" "-" ").trim()
}

def static getRandomSex(){
    def random = new Random()
    def name=""
    if(random.nextBoolean()){
        name="男"
    }else {
        name="女"
    }
}

def static getRandomAge(){
    def random = new Random()
    def age =random.nextInt(40)
    age+=18
    return age
}


def static genDataForUser(String dbName){
    def ex_sql = Global.getDBSql(dbName)
    def insert_sql="INSERT INTO c_user(name,gender,age,phone,user_type,STATUS,regist_date)  VALUES ('@name@','@gender@',@age@,'@phone@',1,1,NOW())";
    for(int i=0;i<10000;i++){
        def insert_string = insert_sql.replace("@name@",getRandomName())
        insert_string=insert_string.replace("@gender@",getRandomSex())
        insert_string=insert_string.replace("@age@",getRandomAge().toString())
        insert_string=insert_string.replace("@phone@",getRandomPhone())
        ex_sql.executeInsert(insert_string)
        println insert_string
    }
}


def static genDataForEmployer(String dbName){
    def ex_sql = Global.getDBSql(dbName)
    def insert_sql="INSERT INTO company_employer(user_id,company_id,hire_date,status,status_desc,isActive,fire_date)  VALUES (@userid@,@companyid@,NOW(),0,'雇佣',1,NOW())";
    for(int i=0;i<500;i++){
        def insert_string = insert_sql.replace("@userid@",(3500+i).toString())
        insert_string=insert_string.replace("@companyid@","11")
        ex_sql.executeInsert(insert_string)
        println insert_string
    }
}


def static genDataForPosition(String dbName){
    def ex_sql = Global.getDBSql(dbName)
    def insert_sql="INSERT INTO position (position_name,company_id)  VALUES ('@name@',@companyid@)";
    def insert_string = insert_sql.replace("@name@",'分拣')
    insert_string =insert_string.replace("@companyid@","10")
    ex_sql.executeInsert(insert_string)
    println insert_string
    insert_string = insert_sql.replace("@name@",'打包')
    insert_string =insert_string.replace("@companyid@","10")
    ex_sql.executeInsert(insert_string)
    println insert_string
    insert_string = insert_sql.replace("@name@",'装卸')
    insert_string =insert_string.replace("@companyid@","10")
    ex_sql.executeInsert(insert_string)
    println insert_string
}



/*
def static genRoleMenus(String dbName){
    def ex_sql = Global.getDBSql(dbName)
    def insert_sql="INSERT INTO role_menus (role_id,menu_id)  VALUES (@role@,@menu@)";
    for(int i=24;i<34 ;i++ ){
        for(int j=1;j<30;j++ ){
          def insert_string = insert_sql.replace("@role@",i.toString())
         insert_string =insert_string.replace("@menu@",j.toString())
            ex_sql.executeInsert(insert_string)
            println insert_string
        }
    }
}

 */


def static genApplyData(String dbName){
    def ex_sql = Global.getDBSql(dbName)
    def insert_company_job_sql="INSERT INTO company_employer_job (job_id,user_id,company_id,status,status_desc,apply_date,expect_date,end_date,day_end_time)  VALUES (@job@,@user@,@company@,1,'造数据',NOW(),NOW(),NOW(),NOW())";
    def selectJob ="select * from job where company_id=11";
    def jobList = []
    def companyList =[]
    ex_sql.eachRow(selectJob) { row ->
        jobList.add(row['id'])
        companyList.add(row['company_id'])
    }

    for(int i=3000;i<3500 ;i++ ){
            def random = new Random()
            def xRandom =random.nextInt(jobList.size()-1)
            def insert_string = insert_company_job_sql.replace("@job@",jobList.get(xRandom).toString())
            insert_string =insert_string.replace("@user@",i.toString())
            insert_string =insert_string.replace("@company@","6")  //companyList.get(xRandom).toString()
            ex_sql.executeInsert(insert_string)
            println insert_string

    }
}


def static genApplyEmployerId(String dbName){
    def ex_sql = Global.getDBSql(dbName)
    def selectEJob ="select * from company_employer_job";
    ex_sql.eachRow(selectEJob) { row ->
        def sql_update="update company_employer_job set company_employer_id="

        def sql_select="select * from company_employer where user_id="+row['user_id'];
        def item_id=0
        ex_sql.eachRow(sql_select){item ->
            item_id=item['id']
        }
        sql_update=sql_update+item_id+" where id="+row['id']
        println sql_update;
        ex_sql.executeUpdate(sql_update)
    }
}


//genRoleMenus("yp_enterprise");

//println genDataForUser("yp_enterprise");

//genDataForEmployer("yp_enterprise");

//genDataForPosition("yp_enterprise");

//genDataForJob("yp_enterprise")

//genApplyData("yp_enterprise");

//genApplyEmployerId("yp_enterprise")


public static List<String> findDates(Date startTime, Date endTime)
        throws ParseException {
    //SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
    Date dBegin =startTime;
    Date dEnd = endTime;

    List<String> allDate = new ArrayList();
    //allDate.add(sdf1.format(dBegin));
    Calendar calBegin = Calendar.getInstance();
// 使用给定的 Date 设置此 Calendar 的时间
    calBegin.setTime(dBegin);
    Calendar calEnd = Calendar.getInstance();
// 使用给定的 Date 设置此 Calendar 的时间
    calEnd.setTime(dEnd);
// 测试此日期是否在指定日期之后
    while (dEnd.after(calBegin.getTime())) {
// 根据日历的规则，为给定的日历字段添加或减去指定的时间量
        allDate.add(sdf1.format(calBegin.getTime()));
        calBegin.add(Calendar.DAY_OF_MONTH, 1);

    }
    return allDate;
}


SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
//Date startDate=sdf.parse("2019-11-13 22:00:00")
//Date endDate=sdf.parse("2019-11-15 05:00:00")
Date now = new Date();
String dString = "23:50-6:50";
String[] tempString = dString.split("-")
String ndate = null;
Date start_Date=null;
Date end_Date = null;

def static addDay(Date date , int days) {
    Calendar cal = Calendar.getInstance();
    cal.setTime(date);
    cal.add(Calendar.DAY_OF_MONTH, days);// 24小时制
    return cal.getTime();
}

def static addHour(date ,hours) {
    Calendar cal = Calendar.getInstance();
    cal.setTime(date);
    cal.add(Calendar.HOUR, hours);// 24小时制
    return cal.getTime();
}

try{
    ndate= sdf1.format(now)
    start_Date = sdf.parse(ndate+" "+ tempString[0]+":00")
    end_Date =  sdf.parse(ndate+" "+ tempString[1]+":00")
    SimpleDateFormat sdf2 = new SimpleDateFormat("EEEE yyyy-MM-dd");
    SimpleDateFormat sdf_2 = new SimpleDateFormat("MM月dd日 HH:mm");
    println(sdf_2.format(start_Date))
    //if(end_Date<start_Date) end_Date=addDay(end_Date)
}catch(Exception e){
   e.printStackTrace()
}





println ndate;
println start_Date;
println end_Date;


def static clearData(String dbName){
    def ex_sql = Global.getDBSql(dbName)
    ex_sql.execute("delete from user_work_turn");
    ex_sql.execute("delete from work_group_call");
    ex_sql.execute("delete from work_group_users");
    ex_sql.execute("delete from work_group_users_detail");
    ex_sql.execute("delete from work_turn");
    ex_sql.execute("delete from work_turn_timesheet");

}
//clearData("yp_enterprise")

//println BigDecimal.valueOf("29.429816026309216")

def static appData(){
    def dburl= "jdbc:mysql://192.168.1.171:3306/"+"yp_enterprise"+"?useUnicode=true&characterEncoding=UTF-8&allowMultiQueries=true&serverTimezone=GMT"
    def sql = Sql.newInstance(dburl, Global.getDBUserName(), Global.getDBPassword(), Global.getDriverClass())
    def file = new File("initAddr.sql")
    //def writer=file.newPrintWriter()
    println "test"
    file.eachLine{
        println it
       sql.executeInsert(it)
    }
}

//appData();

public static List<String> getDayListOfMonth(String yearMonth) {
    List<String> list = new ArrayList<String>();
    String[] ym=yearMonth.split("-");
    int year = Integer.valueOf(ym[0]);//年份
    int month =  Integer.valueOf(ym[1]);;//月份
    Calendar a = Calendar.getInstance();
    a.set(Calendar.YEAR, year);
    a.set(Calendar.MONTH, month - 1);
    a.set(Calendar.DATE, 1);//把日期设置为当月第一天
    a.roll(Calendar.DATE, -1);//日期回滚一天，也就是最后一天
    int day = a.get(Calendar.DATE);
    for (int i = 1; i <= day; i++) {
        String mm="0"+month;
        String dd="0"+i;
        if(mm.length()>2) mm=mm.substring(1)
        if(dd.length()>2) dd=dd.substring(1)
        String aDate = String.valueOf(year)+"-"+mm+"-"+dd;
        list.add(aDate);
    }
    return list;
}

//println getDayListOfMonth("2019-2");