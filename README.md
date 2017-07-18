# iOS-map3d
iOS 3D地图SDK官方Demo

## 前述 ##

- 工程是基于iOS 3D地图SDK实现的
- [开发指南](http://lbs.amap.com/api/ios-sdk/summary/).
- [高德官方网站申请key](http://lbs.amap.com/api/ios-sdk/guide/create-project/get-key/#t1).
- 查阅[参考手册](http://a.amap.com/lbs/static/unzip/iOS_Map_Doc/AMap_iOS_API_Doc_3D/index.html).

## 使用方法 ##

- 运行demo请先执行pod install --repo-update 安装依赖库，完成后打开.xcworkspace 文件
- 如有疑问请参阅[自动部署](http://lbs.amap.com/api/ios-sdk/guide/create-project/cocoapods/).


## 说明 ##

`创建地图`

| 功能说明 | 对应文件名 |
| -----|:-----:|
|显示定位蓝点(默认样式)|UserLocationViewController|
|显示定位蓝点(自定义样式)|CustomUserLocationViewController|
|显示室内地图|IndoorMapViewController|
|切换地图图层|MapTypeViewController|
|使用离线地图|OfflineViewController|
|自定义地图|CustomMapStyleViewController|

`与地图交互`

| 功能说明 | 对应文件名 |
| -----|:-----:|
|控件交互|AddControlsViewController|
|手势交互|OperateMapViewController|
|方法交互(改变地图缩放级别)|ChangeZoomViewController|
|方法交互(改变地图中心点)|ChangeCenterViewController|
|方法交互(限制地图的显示范围)|MapBoundaryViewController|
|地图截屏功能|ScreenshotViewController|
|地图POI点击功能|TouchPoiViewController|
|地图动画效果|CoreAnimationViewController|
|设置地图基于指定锚点进行缩放|MapZoomByScreenAnchor|


`在地图上绘制`

| 功能说明 | 对应文件名 |
| -----|:-----:|
|绘制点标记|AnnotationViewController|
|绘制点标记(自定义)|CustomAnnotationViewController|
|绘制点标记(动画)|AnimatedAnnotationViewController|
|绘制点标记(固定屏幕点)|LockedAnnotationViewController|
|绘制折线|LinesOverlayViewController|
|绘制面(圆形)|CircleOverlayViewController|
|绘制面(矩形)|PolygonOverlayViewController|
|轨迹纠偏|MATraceCorrectViewController|
|点平滑移动|MovingAnnotationViewController|
|绘制海量点图层|MultiPointOverlayViewController|
|多彩线|ColoredLinesOverlayViewController|
|大地曲线|GeodesicViewController|
|跑步轨迹|RunningLineViewController|
|热力图|HeatMapTileOverlayViewController|
|纹理线|TexturedLineOverlayViewController|
|自定义overlay|CustomOverlayViewController|
|OpenGl绘制|StereoOverlayViewController|
|TileOverlay|TileOverlayViewController|
|GroundOverlay|GroundOverlayViewController|
|海量点轨迹回放|TraceReplayOverlayViewController"|


`获取地图数据`

| 功能说明 | 对应文件名 |
| -----|:-----:|
|获取POI数据(根据关键字检索POI)|PoiSearchPerKeywordController|
|获取POI数据(根据id检索POI)|PoiSearchPerIdController|
|获取POI数据(检索指定位置周边的POI)|PoiSearchNearByController|
|获取POI数据(检索指定范围内的POI)|PoiSearchWithInPolygonController|
|获取POI数据(根据输入自动提示)|TipViewController|
|获取地址描述数据(地址转坐标)|GeoViewController|
|获取地址描述数据(坐标转地址)|ReGeoViewController|
|获取行政区划数据|DistrictViewController|
|获取公交数据(线路查询)|BusLineViewController|
|获取公交数据(站点查询)|BusStopViewController|
|获取天气数据|WeatherViewController|
|获取业务数据(检索指定位置周边的POI)|CloudPOIAroundSearchViewController|
|获取业务数据(根据id检索POI)|CloudPOIIDSearchViewController|
|获取业务数据(根据关键字检索某一地区POI)|CloudPOILocalSearchViewController|
|获取业务数据(检索指定范围内的POI)|CloudPOIPolygonSearchViewController|
|获取交通态势信息|RoadTrafficStatusViewController|


`出行路线规划`

| 功能说明 | 对应文件名 |
| -----|:-----:|
|驾车出行路线规划|RoutePlanDriveViewController|
|步行出行路线规划|RoutePlanWalkViewController|
|公交出行路线规划|RoutePlanBusViewController|
|骑行出行路线规划|RoutePlanRideViewController|
|公交出行路线规划(跨城)|RoutePlanBusCrossCityViewController|


`地图计算工具`

| 功能说明 | 对应文件名 |
| -----|:-----:|
|坐标转换|CooridinateSystemConvertController|
|两点间距离计算"|DistanceCalculateViewController|
|点与线的距离计算|DistanceCalculateViewController2|
|判断点是否在多边形内|InsideTestViewController|


`短串分享`

| 功能说明 | 对应文件名 |
| -----|:-----:|
|位置分享|LocationShareViewController|
|路径规划分享|RouteShareViewController|
|POI分享|POIShareViewController|
|导航分享|NaviShareViewController|


`其他`

| 功能说明 | 对应文件名 |
| -----|:-----:|
|周边搜索|NearbyVewController|


