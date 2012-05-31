package sfs2x.extensions.icard.utils;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;

import jxl.Cell;
import jxl.CellType;
import jxl.DateCell;
import jxl.LabelCell;
import jxl.NumberCell;
import jxl.Sheet;
import jxl.read.biff.BiffException;
import jxl.read.biff.WorkbookParser;

public class ExcelReader {
	static public HashMap<String,ArrayList<HashMap<String,String>>> loadFile(String fileName){
		HashMap<String,ArrayList<HashMap<String,String>>> ret = new HashMap<String,ArrayList<HashMap<String,String>>>();
		try{
			InputStream is = new FileInputStream(fileName);
			WorkbookParser rwb = (WorkbookParser) WorkbookParser.getWorkbook(is);
			Sheet[] sheets = rwb.getSheets();
			
			//遍历每个sheet
			for(Sheet sheet : sheets){
				String sheetName = sheet.getName();
				int RowsNumber	 = sheet.getRows();
				ArrayList<HashMap<String,String>> sheetData = new ArrayList<HashMap<String,String>>();
				if(RowsNumber>1){
					Cell[] titles = sheet.getRow(0);
					//得到每一行的数据
					for(int rowCount =1;rowCount<RowsNumber;rowCount++){
						HashMap<String,String> rowData = new HashMap<String,String>();
						Cell[] data = sheet.getRow(rowCount);
						for(int columnCount =0;columnCount<titles.length;columnCount++){
							try{
								rowData.put(titles[columnCount].getContents(), data[columnCount].getContents());
							}
							catch (Exception e){
								rowData.put(titles[columnCount].getContents(),"");
								System.out.println("ERROR::	ExcelReader.loadFile :sheetName="+sheetName+",rowCount="+rowCount+",columnCount="+columnCount);
							}
						}
						sheetData.add(rowData);
					}
					ret.put(sheetName, sheetData);
				}
				
			}
			is.close();
			rwb.close();
		}
		catch( Exception e ){
			e.printStackTrace();
		}
		return ret;
	}
}
