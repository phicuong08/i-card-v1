package com.icard.data.excel;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Date;

import jxl.Cell;
import jxl.CellType;
import jxl.DateCell;
import jxl.LabelCell;
import jxl.NumberCell;
import jxl.Sheet;
import jxl.read.biff.BiffException;
import jxl.read.biff.WorkbookParser;

public class ExcelReader {
	public boolean openFile(String fileName){
		try{
			InputStream is = new FileInputStream(fileName);
			WorkbookParser rwb = (WorkbookParser) WorkbookParser.getWorkbook(is);
			Sheet[] sheets = rwb.getSheets();
		}
		catch( Exception e ){
			e.printStackTrace();
		}
		return false;
	}

	public static void getExcelData(String path) throws BiffException,
			IOException {
		InputStream is = new FileInputStream(path);
		// Workbook wb = null;
		WorkbookParser rwb = (WorkbookParser) WorkbookParser.getWorkbook(is);
		System.out.println("获得工作薄中工作表sheet的个数=" + rwb.getNumberOfSheets());
		@SuppressWarnings("unused")
		Sheet[] sheets = rwb.getSheets();// 返回工作薄（Workbook）中工作表（Sheet）对象数组
		Sheet rs = rwb.getSheet(0);
		System.out.println("获得sheet的名称=" + rs.getName());
		System.out.println("获得sheet中所包含的总列数=" + rs.getColumns());
		@SuppressWarnings("unused")
		Cell[] cells1 = rs.getColumn(0);// 获取某一列所有的单元格
		System.out.println("获得sheet中所包含的总行数=" + rs.getRows());
		@SuppressWarnings("unused")
		Cell[] cells2 = rs.getRow(0);// 获取某一行的所有单元格

		Cell c00 = rs.getCell(0, 0);// 第一个是列数，第二个是行数
		String t = c00.getContents();// getContents()将任何类型的Cell值都作为一个字符串返回
		System.out.println(t);
		if (c00.getType() == CellType.LABEL) {
			LabelCell labelc00 = (LabelCell) c00;
			String strc00 = labelc00.getString();
			System.out.println(strc00);
		}
		if (c00.getType() == CellType.NUMBER) {
			NumberCell number00 = (NumberCell) c00;
			double strc00 = number00.getValue();
			System.out.println(strc00);
		}
//		if (c00.getType() == CellType.DATE) {
//			DateCell datec00 = (DateCell) c00;
//			Date strc00 = datec00.getDate();
//			System.out.println(strc00);
//		}
		rwb.close();
		is.close();
	}
}
