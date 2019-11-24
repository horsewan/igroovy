
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

double distance = getDistance(22.68308826800817,114.13281696660855,22.68181674899255,114.12946072685526);
double distance2 = getDistance2(22.68308826800817,114.13281696660855,22.68181674899255,114.12946072685526);
println(distance);
println(distance2);