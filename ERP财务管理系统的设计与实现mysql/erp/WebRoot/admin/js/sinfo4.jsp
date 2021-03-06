<%@ page language="java" import="java.util.*,java.util.List" contentType="text/html;charset=gb2312" %> 
<%@ page import="org.jfree.data.category.DefaultCategoryDataset,org.jfree.chart.ChartFactory,org.jfree.chart.JFreeChart,org.jfree.chart.plot.PlotOrientation,org.jfree.chart.servlet.ServletUtilities,org.jfree.data.category.CategoryDataset,org.jfree.data.general.DatasetUtilities,org.jfree.chart.plot.*,org.jfree.chart.labels.*,org.jfree.chart.renderer.category.BarRenderer3D,java.awt.*,org.jfree.ui.*,org.jfree.chart.axis.AxisLocation,org.jfree.chart.StandardChartTheme"%>
<jsp:useBean id="cb" scope="page" class="com.bean.ComBean"/>
<%
String ysnd=request.getParameter("ysnd");
DefaultCategoryDataset dataset = new DefaultCategoryDataset();
 List zyList=cb.getCom("select * from nj order by id desc",2);
 if(!zyList.isEmpty()){
 	for(int i=0;i<zyList.size();i++){
 		List list2=(List)zyList.get(i);
 		float str=cb.getFloat("select sum(ysje) from ndys where bmmc='"+list2.get(1).toString()+"' and ysnd like '%"+ysnd+"%'");
 		dataset.addValue(str, " ", list2.get(1).toString());
 	}
 }



 
JFreeChart chart = ChartFactory.createBarChart3D("各部门统计图","部门","金额",dataset,PlotOrientation.VERTICAL,false,false,false);

//创建主题样式         
StandardChartTheme standardChartTheme=new StandardChartTheme("CN");         
//设置标题字体         
standardChartTheme.setExtraLargeFont(new Font("隶书",Font.BOLD,20));        
 //设置图例的字体         
 standardChartTheme.setRegularFont(new Font("宋书",Font.PLAIN,15));         
 //设置轴向的字体         
 standardChartTheme.setLargeFont(new Font("宋书",Font.PLAIN,15));         
 //应用主题样式         
 ChartFactory.setChartTheme(standardChartTheme);  
CategoryPlot plot = chart.getCategoryPlot();
//设置网格背景颜色
plot.setBackgroundPaint(Color.white);
//设置网格竖线颜色
plot.setDomainGridlinePaint(Color.pink);
//设置网格横线颜色
plot.setRangeGridlinePaint(Color.pink);
//显示每个柱的数值，并修改该数值的字体属性
BarRenderer3D renderer = new BarRenderer3D();

renderer.setSeriesPaint(0, new Color(0, 255, 255));//设置柱子颜色

renderer.setBaseItemLabelGenerator(new StandardCategoryItemLabelGenerator());
renderer.setBaseItemLabelsVisible(true);
//默认的数字显示在柱子中，通过如下两句可调整数字的显示
//注意：此句很关键，若无此句，那数字的显示会被覆盖，给人数字没有显示出来的问题
renderer.setBasePositiveItemLabelPosition(new ItemLabelPosition(ItemLabelAnchor.OUTSIDE12, TextAnchor.BASELINE_LEFT));
renderer.setItemLabelAnchorOffset(10D);
//设置每个地区所包含的平行柱的之间距离
//renderer.setItemMargin(0.3);
plot.setRenderer(renderer);
//设置地区、销量的显示位置
//将下方的“肉类”放到上方
plot.setDomainAxisLocation(AxisLocation.TOP_OR_RIGHT);
//将默认放在左边的“销量”放到右方
plot.setRangeAxisLocation(AxisLocation.BOTTOM_OR_RIGHT);
String filename = ServletUtilities.saveChartAsPNG(chart, 700, 400, null, session);
String graphURL = request.getContextPath() + "/DisplayChart?filename=" + filename;

%>

　　<img src="<%= graphURL %>" width=700 height=400 border=0 usemap="#<%= filename %>">

	 
