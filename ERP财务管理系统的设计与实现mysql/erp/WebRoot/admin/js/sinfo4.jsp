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



 
JFreeChart chart = ChartFactory.createBarChart3D("������ͳ��ͼ","����","���",dataset,PlotOrientation.VERTICAL,false,false,false);

//����������ʽ         
StandardChartTheme standardChartTheme=new StandardChartTheme("CN");         
//���ñ�������         
standardChartTheme.setExtraLargeFont(new Font("����",Font.BOLD,20));        
 //����ͼ��������         
 standardChartTheme.setRegularFont(new Font("����",Font.PLAIN,15));         
 //�������������         
 standardChartTheme.setLargeFont(new Font("����",Font.PLAIN,15));         
 //Ӧ��������ʽ         
 ChartFactory.setChartTheme(standardChartTheme);  
CategoryPlot plot = chart.getCategoryPlot();
//�������񱳾���ɫ
plot.setBackgroundPaint(Color.white);
//��������������ɫ
plot.setDomainGridlinePaint(Color.pink);
//�������������ɫ
plot.setRangeGridlinePaint(Color.pink);
//��ʾÿ��������ֵ�����޸ĸ���ֵ����������
BarRenderer3D renderer = new BarRenderer3D();

renderer.setSeriesPaint(0, new Color(0, 255, 255));//����������ɫ

renderer.setBaseItemLabelGenerator(new StandardCategoryItemLabelGenerator());
renderer.setBaseItemLabelsVisible(true);
//Ĭ�ϵ�������ʾ�������У�ͨ����������ɵ������ֵ���ʾ
//ע�⣺�˾�ܹؼ������޴˾䣬�����ֵ���ʾ�ᱻ���ǣ���������û����ʾ����������
renderer.setBasePositiveItemLabelPosition(new ItemLabelPosition(ItemLabelAnchor.OUTSIDE12, TextAnchor.BASELINE_LEFT));
renderer.setItemLabelAnchorOffset(10D);
//����ÿ��������������ƽ������֮�����
//renderer.setItemMargin(0.3);
plot.setRenderer(renderer);
//���õ�������������ʾλ��
//���·��ġ����ࡱ�ŵ��Ϸ�
plot.setDomainAxisLocation(AxisLocation.TOP_OR_RIGHT);
//��Ĭ�Ϸ�����ߵġ��������ŵ��ҷ�
plot.setRangeAxisLocation(AxisLocation.BOTTOM_OR_RIGHT);
String filename = ServletUtilities.saveChartAsPNG(chart, 700, 400, null, session);
String graphURL = request.getContextPath() + "/DisplayChart?filename=" + filename;

%>

����<img src="<%= graphURL %>" width=700 height=400 border=0 usemap="#<%= filename %>">

	 
