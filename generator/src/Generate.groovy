import java.text.SimpleDateFormat

/**
 * 通过经纬度获取距离(单位：米)
 *
 * @param lat1
 * @param lng1
 * @param lat2
 * @param lng2
 * @return
 */
public static double getDistance(double lat1, double lng1, double lat2,
                                 double lng2) {
    double radLat1 = rad(lat1);
    double radLat2 = rad(lat2);
    double a = radLat1 - radLat2;
    double b = rad(lng1) - rad(lng2);
    double s = 2 * Math.asin(Math.sqrt(Math.pow(Math.sin(a / 2), 2) +
            Math.cos(radLat1) * Math.cos(radLat2) * Math.pow(Math.sin(b / 2), 2)));
    s = s * 6378137;
    s = Math.round(s * 10000d) / 10000d;
    return s;
}

private static double rad(double d) {
    return d * Math.PI / 180.0;
}


public static double getDistance2(double lat_a, double lng_a, double lat_b, double lng_b){
    double pk = 180 / 3.14169;
    double a1 = lat_a / pk;
    double a2 = lng_a / pk;
    double b1 = lat_b / pk;
    double b2 = lng_b / pk;
    double t1 = Math.cos(a1) * Math.cos(a2) * Math.cos(b1) * Math.cos(b2);
    double t2 = Math.cos(a1) * Math.sin(a2) * Math.cos(b1) * Math.sin(b2);
    double t3 = Math.sin(a1) * Math.sin(b1);
    double tt = Math.acos(t1 + t2 + t3);
    return 6378137 * tt;
}

double distance = getDistance(22.68678576525857,114.13688995385728,22.681768172008898,114.12991071306615);
double distance2 = getDistance2(22.68678576525857114,114.13688995385728,22.681768172008898,114.12991071306615);
println(distance);
println(distance2);
/*
#github
192.30.253.113 github.com
192.30.253.113 github.com
192.30.253.118 gist.github.com
192.30.253.119 gist.github.com

 */

long nd = 1000 * 24 * 60 * 60;
long nh = 1000 * 60 * 60;
long nm = 1000 * 60;
// long ns = 1000;
// 获得两个时间的毫秒时间差异
SimpleDateFormat sdf_date = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
def endDate= sdf_date.parse("2019-12-12 14:16:20");
def startDate= sdf_date.parse("2019-12-12 6:19:20");
long diff = endDate.getTime() - startDate.getTime();
// 计算差多少天
long day = diff / nd;
// 计算差多少小时
long hour = diff % nd / nh;

long min = diff/1000/60;



println(day)
println(hour)
println min