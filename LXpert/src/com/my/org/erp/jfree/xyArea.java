package com.my.org.erp.jfree;

import org.jfree.chart.*;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.data.category.DefaultCategoryDataset;
import org.jfree.data.general.DefaultPieDataset;
import org.jfree.data.xy.*;
import org.jfree.data.*;

public class xyArea{
public static void main(String arg[]){
  XYSeries series = new XYSeries("Average Weight");
  series.add(20.0, 20.0);
  series.add(40.0, 25.0);
  series.add(55.0, 50.0);
  series.add(70.0, 65.0);
  XYDataset xyDataset = new XYSeriesCollection(series);
  JFreeChart chart = ChartFactory.createXYAreaChart
  ("XY Chart using JFreeChart", "Age", "Weight",
   xyDataset, PlotOrientation.VERTICAL, true, 
  true, false);
  ChartFrame frame1=new ChartFrame("XYArea Chart",chart);
  frame1.setVisible(true);
  frame1.setSize(300,300);
  }
}