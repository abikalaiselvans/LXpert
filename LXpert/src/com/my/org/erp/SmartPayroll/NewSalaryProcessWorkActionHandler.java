 	package com.my.org.erp.SmartPayroll;


import java.io.IOException;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.my.org.erp.common.CommonFunctions;
import com.my.org.erp.SmartAttendance.AttendanceFunctions;
import com.my.org.erp.ServiceLogin.AbstractActionHandler;
import com.my.org.erp.ServiceLogin.DateUtil;

public class NewSalaryProcessWorkActionHandler  extends AbstractActionHandler 
{ 

	Statement st, pfesist, messst, advst,allnost;
	ResultSet rs, allrs, recrs, pfesirs, messrs, advrs,allnors;
	public synchronized void handle(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException 
	{
		try 
		{
			String action = request.getParameter("actionS");
			HttpSession session = request.getSession();
			String userid = (String) session.getAttribute("USRID");
			String loginempid = (String) session.getAttribute("EMPID");
 			String bsql="SELECT INT_PFAMT,INT_ESIAMT,INT_CPY_PFAMT,INT_CPY_PENSIONAMT,INT_CPY_ESIAMT,CHR_SALARY,CHR_PAYTAXDEDUCTION,CHR_PAYTAXVALUE,INT_PFLIMIT,INT_ESILIMIT,CHR_TAXDEDUCTIONEMP,INT_PFLIMITMINIMUM FROM m_institution WHERE INT_ID=1";
			String basicdata[][] =  CommonFunctions.RecordSetArray(con, bsql);
			double pf=Double.parseDouble(basicdata[0][0]);//Staff PF percentage
			double cpypf=Double.parseDouble(basicdata[0][2]);// company PF percentage
			double cpypension=Double.parseDouble(basicdata[0][3]);// company Pension percentage
			double cpyesi=Double.parseDouble(basicdata[0][4]);// company ESI percentage
			//String compaytaxdeduction=basicdata[0][6];
			String compaytaxvalue=basicdata[0][7];
			//String taxdeductionempid=basicdata[0][10];
			 
			String taxsql="SELECT INT_GTEQL,INT_LSEQL,DOU_PERCENTAGE,DOU_AMOUNT FROM pay_m_taxvalue ORDER BY INT_ID ";
			String taxdata[][] =  CommonFunctions.RecordSetArray(con, taxsql);
			String sql="";
			String sallowansql="";
			String srecoverysql="";
			String sdf="";
			double noofdaysinamonth=0;
			int noofsundaysinamonth = 0;
			double noofworkingdaysinamonth = 0;
			String staffprofessionaltax="";
			String attendanceTable="";
 			if ("PAYSalary".equals(action)) 
			{
	 				
 				System.out.println("==========================");
 				System.out.println("SALARY PROCESSING START");
 				String month=request.getParameter("Month");
 				String mon= DateUtil.getMonth(Integer.parseInt(month));
 				String year=request.getParameter("Year");
 				String Office=request.getParameter("Office");
 				String dept=request.getParameter("dept");
 				String Category=request.getParameter("Category");
 				String attendancecheck=request.getParameter("attendancecheck");
 				if(!"Y".equals(attendancecheck))
 					attendancecheck ="N";
 				String attendancecycle=request.getParameter("attendancecycle");
 				
 				
 				
 				if("1".equals(attendancecycle))
 					attendanceTable = " att_t_register ";
 				else
 					attendanceTable=" att_t_register_cycle2 ";
 						
 				
 				sql=" SELECT COUNT(*) ";
				sql=sql+" FROM "+attendanceTable+" a ,com_m_staff b , pay_t_salarybasic c";
				sql = sql+" WHERE a.DOU_TOTALDAYS >0 AND a.CHR_MONTH='"+mon+"' ";
				sql = sql+" AND a.INT_YEAR= "+year;
				sql = sql+" AND a.CHR_EMPID=b.CHR_EMPID AND a.CHR_EMPID=c.CHR_EMPID  ";
				sql = sql+" AND c.CHR_MONTH='"+mon+"' "; 
				sql = sql+" AND c.INT_YEAR=  "+year;
				if("1".equals(attendancecycle))
					sql = sql+" AND b.INT_ATTENDANCECYCLE =1 ";
				else
					sql = sql+" AND b.INT_ATTENDANCECYCLE =2 ";
				sql = sql+" AND b.DT_DOJCOLLEGE<='"+year+"-"+month+"-31"+"'";
				if(!"0".equals(dept))
					sql = sql+" AND b.INT_DEPARTID="+dept +" ";
 				if(!"0".equals(Office))
					sql = sql+" AND b.INT_OFFICEID="+Office +" ";  
				if(!"0".equals(Category))
					sql = sql+" AND b.CHR_CATEGORY='"+Category +"' "; 
				sql = sql+" ORDER BY b.CHR_STAFFNAME " ;
				System.out.println(sql+"\n");
				boolean flag = CommonFunctions.RecordExist(con, sql);
				
			 	
				boolean  attflag  = false;
				if("Y".equals(attendancecheck))
				{	
					sql = " SELECT a.CHR_EMPID  ";
					sql = sql+" FROM "+attendanceTable+" a ,com_m_staff b , pay_t_salarybasic c";
					sql = sql+" WHERE a.DOU_TOTALDAYS >0 AND a.CHR_MONTH='"+mon+"' ";
					sql = sql+" AND a.INT_YEAR= "+year;
					sql = sql+" AND a.CHR_EMPID=b.CHR_EMPID AND a.CHR_EMPID=c.CHR_EMPID  ";
					sql = sql+" AND c.CHR_MONTH='"+mon+"' "; 
					sql = sql+" AND c.INT_YEAR=  "+year;
					if("1".equals(attendancecycle))
						sql = sql+" AND b.INT_ATTENDANCECYCLE =1 ";
					else
						sql = sql+" AND b.INT_ATTENDANCECYCLE =2 ";
					
					sql = sql+" AND b.DT_DOJCOLLEGE<='"+year+"-"+month+"-31"+"'";
					if(!"0".equals(dept))
						sql = sql+" AND b.INT_DEPARTID="+dept +" ";
	 				if(!"0".equals(Office))
						sql = sql+" AND b.INT_OFFICEID="+Office +" ";  
					if(!"0".equals(Category))
						sql = sql+" AND b.CHR_CATEGORY='"+Category +"' "; 
					sql = sql+" ORDER BY b.CHR_STAFFNAME " ;
					String attendanceData[][] = CommonFunctions.QueryExecute(sql);
					attflag = AttendanceFunctions.attendanceRegisterCheck(con, Integer.parseInt(month), year, attendanceData);
				}
				else
				{
					attflag =true;
				}
				
 				
				
				if(attflag)
				{
					if(flag)
	 				{
						 
							//Allowance 
							sql = "SELECT CHR_ANAME,CHR_FLAG FROM pay_m_allowance ORDER BY INT_ALLOWANCEID ";
							String aname[][] =  CommonFunctions.RecordSetArray(con,sql);
							for(int a=0;a<aname.length;a++)
								sallowansql =sallowansql+aname[a][0]+" , ";
							
							//Recovery
							sql = "SELECT CHR_RNAME FROM pay_m_recovery ORDER BY INT_RECOVERYID";
							String rname[][] =  CommonFunctions.RecordSetArray(con,sql);
							for(int a=0;a<rname.length;a++)
								srecoverysql =srecoverysql+rname[a][0]+" , ";
							
							//Allowance column
							String allowancecolumn="";
							for(int u=0;u<aname.length;u++)
								allowancecolumn=allowancecolumn+aname[u][0]+"^";
							//Recovery column
							String recoverycolumn="";
							for(int u=0;u<rname.length;u++)
								recoverycolumn=recoverycolumn+rname[u][0]+"^";
							
							
							  
							sql=" SELECT a.CHR_EMPID,b.CHR_STAFFNAME,a.DOU_TOTALDAYS ,c.INT_SALARY,c.CHR_ESI ,c.CHR_PF ,a.DOU_ABSENT, ";
							sql= sql + " b.INT_COMPANYID,b.INT_BRANCHID, b.INT_DEPARTID,b.INT_DESIGID,b.INT_OFFICEID,c.CHR_PF,c.CHR_ESI, ";
							sql= sql + " b.CHR_BANK,b.CHR_ACCNO ,  ";
							sql = sql +  " FUN_PAY_GET_PF_CALCULATION(b.CHR_EMPID,c.INT_SALARY,c.CHR_PFCALCULATIONTYPE  )   staffpf, ";
							sql = sql +  "  FUN_GET_ESIAMOUNT('STAFF',b.CHR_ESI,FUN_PAY_GET_ORIGINAL_GROSS(b.CHR_EMPID) )   staffesi ,  ";
							sql = sql +  " ( FUN_PAY_GET_PF_CALCULATION(b.CHR_EMPID,c.INT_SALARY,c.CHR_PFCALCULATIONTYPE  )/"+pf+" * "+cpypf+" ) cpypf,   ";
							sql = sql +  " (FUN_PAY_GET_PF_CALCULATION(b.CHR_EMPID,c.INT_SALARY,c.CHR_PFCALCULATIONTYPE  )/"+pf+"* "+cpypension+" ) cpypf,   ";
							sql = sql +  "  FUN_GET_ESIAMOUNT('COMPANY',b.CHR_ESI,FUN_PAY_GET_ORIGINAL_GROSS(b.CHR_EMPID) )    cpyesi ,c.CHR_PFCALCULATIONTYPE,  ";
							sql = sql +  "  FUN_PAY_GET_PF_SLAB_PENBASIC(c.CHR_PFCALCULATIONTYPE ,c.INT_SALARY  ) penbasic , ";
							sql = sql +  "  b. CHR_PROFESSIONALTAX ,";
							sql = sql +  "  FIND_A_CURRENTMONTH_JOINNER(b.CHR_EMPID,'"+year+"','"+mon+"') ,a.DOU_EXTRADAYS ";
							sql=sql+" FROM  "+attendanceTable+"  a ,com_m_staff b , pay_t_salarybasic c";
							sql = sql+" WHERE a.DOU_TOTALDAYS >0 AND a.CHR_MONTH='"+mon+"' ";
							sql = sql+" AND a.INT_YEAR= "+year;
							sql = sql+" AND a.CHR_EMPID=b.CHR_EMPID";
							sql = sql+" AND c.CHR_MONTH='"+mon+"' "; 
							sql = sql+" AND c.INT_YEAR=  "+year;
							if("1".equals(attendancecycle))
								sql = sql+" AND b.INT_ATTENDANCECYCLE =1 ";
							else
								sql = sql+" AND b.INT_ATTENDANCECYCLE =2 ";
							sql = sql+" AND a.CHR_EMPID=c.CHR_EMPID  ";
							sql = sql+" AND b.DT_DOJCOLLEGE<='"+year+"-"+month+"-31"+"'";
							if(!"0".equals(dept))
								sql = sql+" AND b.INT_DEPARTID="+dept +" ";
							if(!"0".equals(Office))
								sql = sql+" AND b.INT_OFFICEID="+Office +" ";  
							if(!"0".equals(Category))
								sql = sql+" AND b.CHR_CATEGORY='"+Category +"' "; 
							sql = sql+" ORDER BY b.CHR_STAFFNAME " ;
							System.out.println(sql+"\n");
							String attdata[][]= CommonFunctions.RecordSetArray(con, sql);
							
							if(attdata.length<1)
								response.sendRedirect("Smart Payroll/Salary Process.jsp?er=Kindly migrate the Allowance and Recovery");
							
							String id="";
							for(int v=0;v<attdata.length;v++)
								id =id+"'"+attdata[v][0].trim()+"' , ";
							asql = " DELETE FROM pay_t_salary WHERE CHR_MONTH='"+mon+"' AND INT_YEAR="+year;
							asql = asql +" AND CHR_EMPID IN ("+id+" '0' )";
							System.out.println(asql+"\n");
							apstm = con.prepareStatement(asql);
							apstm.execute();
							
						 	if("1".equals(attendancecycle))
								noofdaysinamonth=Double.parseDouble( CommonFunctions.QueryExecute(" SELECT day(last_day('"+year+"-"+month+"-12' )) ")[0][0]);
							else
								noofdaysinamonth=Double.parseDouble( CommonFunctions.QueryExecute("SELECT FUN_PAY_SALARY_NOOFDAYSINAMONTH('"+year+"','"+month+"') ")[0][0]);
							 
							
						 	for (int u = 1; u <= noofdaysinamonth; u++)
								if ("Sunday".equals(CommonFunctions.QueryExecute("SELECT   DAYNAME('" + year + "-"+ month + "-" + u + "')")[0][0]))
									noofsundaysinamonth = noofsundaysinamonth + 1;
		
							noofworkingdaysinamonth = noofdaysinamonth- noofsundaysinamonth;
		
						 	
							String actualcompany="";
							String actualbranch="";
							String actualdepart="";
							String actualdesign="";
							String actualoffice="";
							String actualpftype="";
							String actualesitype="";
							String actualbank="";
							String actualaccountno="";
							String empid="";
							String empname="";
							String pftype="";
							String esitype="";
							double totaldays=0.0;
							double basic=0.0;
							double grosspay=0.0;
							double addedallowance=0.0;
							double extraallowance=0.0;
							double recvalue=0.0;
							double pfValue=0.0, esiValue=0.0;
							double mess=0.0,advance=0.0;
							 
							double CompanyPF1=0.0;
							double CompanyPF2=0.0;
							double CompanyESI=0.0;
							double totalsal=0.0;
							double monthsal=0.0;
							double ctcsal=0.0;
							double totalrecovery=0.0;
							
							double absent=0.0;
							double extradays=0.0;
							double addedallowancesal=0.0;
							double originalbasic=0;
							double originalallowance=0;
							double originalgross=0;
							double originalpf=0;
							double originalpension=0;
							double originalesi=0;
							double originalctc=0;
							double lop=0.0;
							double penbasic=0;
							double admincharge=0;
							double edli=0;
							double admincharge1=0;
							
							double pension=0;
							double taxvalue=0;
							pension=0;
							
							
							double dbminimumpflimit=0;
							double dbpflimit=0;
							double dbesilimit=0;
							
							DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
							Date date = new Date();
							System.out.println("Starting Time :"+dateFormat.format(date));
							System.out.println("Total Employees :"+attdata.length);
							String attempids="";
							 
							acs = con.prepareCall("{call  COM_PRO_BULK_QUERY_EXECUTE(?)}");
							for(int v=0;v<attdata.length;v++)
							{
								try 
								{
									empid="";
									empname="";
									actualcompany=attdata[v][7];
									actualbranch=attdata[v][8];
									actualdepart=attdata[v][9];
									actualdesign=attdata[v][10];
									actualoffice=attdata[v][11];
									actualpftype=attdata[v][12];
									actualesitype=attdata[v][13];
									actualbank=attdata[v][14];
									actualaccountno=attdata[v][15];
									staffprofessionaltax=attdata[v][23];
							
									totaldays=0.0;
									basic=0.0;
									grosspay=0.0;
									addedallowance=0.0;
									extraallowance=0.0;
									recvalue=0.0;
									mess=0.0;
									advance=0.0;
									totalrecovery=0.0;
									pfValue=0.0;
									esiValue=0.0;
									CompanyPF1=0.0;
									CompanyPF2=0.0;
									CompanyESI=0.0;
									totalsal=0.0;
									monthsal=0.0;
									ctcsal=0.0;
									absent=0.0;
									addedallowancesal=0.0;
									originalbasic=0;
									originalallowance=0;
									originalgross=0;
									originalpf=0;
									originalpension=0;
									originalesi=0;
									originalctc=0;
									lop=0.0;
									penbasic=0;admincharge=0;edli=0;admincharge1=0;
									pension=0;
									taxvalue=0;
									 
									empid=attdata[v][0].trim();
									empname= attdata[v][1];
									totaldays=Double.parseDouble(attdata[v][2]);
									basic=Double.parseDouble(attdata[v][3]);
									extradays=Double.parseDouble(attdata[v][25]);
									absent=Double.parseDouble(attdata[v][6]);
									
									noofworkingdaysinamonth = noofworkingdaysinamonth + extradays;
									
									 
									//ADVANCE 
									if(CommonFunctions.RecordExist(con, "SELECT Count(*)  FROM pay_t_advance WHERE CHR_EMPID='"+empid+"' AND CHR_TYPE='Y' AND CHR_MONTH='"+mon+"' AND INT_YEAR="+year))
									{	
										String advsql="SELECT  INT_DUEAMT  FROM pay_t_advance WHERE CHR_EMPID='"+empid+"' AND CHR_TYPE='Y'  AND CHR_MONTH='"+mon+"' AND INT_YEAR="+year;
										advance = Double.parseDouble(CommonFunctions.RecordSetArray(con,advsql)[0][0]);
									}
									
									
									
									//loss of pay calculations 
									originalbasic = basic;
									//basic= basic-((basic/noofdaysinamonth)*absent); 
									basic = (basic/noofworkingdaysinamonth *totaldays);
									
									
									//ALLOWANCE CALCULATION
									String sqlAllTran = "SELECT * FROM pay_t_salaryallowance ";
									sqlAllTran = sqlAllTran + " WHERE CHR_EMPID='" + empid + "' AND CHR_MONTH='"+mon+"' AND INT_YEAR="+year;
									
									//pay_t_allowance 
									String ssql = "SELECT count(*) FROM pay_t_salaryallowance";
									ssql = ssql + " WHERE CHR_EMPID='" + empid + "' AND CHR_MONTH='"+mon+"' AND INT_YEAR="+year;
									
									String avalue[][] =  CommonFunctions.RecordSetArray(con,sqlAllTran);
									String sqlavalues="";
									
									if( CommonFunctions.RecordExist(con, ssql))
									{	
										for(int f=0;f<aname.length;f++)
										{
											if("Y".equals(aname[f][1]))
											{	
												addedallowancesal=0.0;
												addedallowancesal = Double.parseDouble(avalue[0][(f+1)]);
												originalallowance = originalallowance+Double.parseDouble(avalue[0][(f+1)]);
												//addedallowancesal=addedallowancesal-((addedallowancesal/noofdaysinamonth)*absent);
												addedallowancesal = (addedallowancesal/noofworkingdaysinamonth *totaldays);
												addedallowance = addedallowance+addedallowancesal;
												sdf=""+(addedallowancesal)+",";//Math.round
											}	
											else
											{
												extraallowance = extraallowance+Double.parseDouble(avalue[0][(f+1)]);
												sdf=""+(Double.parseDouble(avalue[0][(f+1)]))+",";//Math.round(
											}
											sqlavalues = sqlavalues+sdf ;
										}
									}
									else
									{
										for(int f=0;f<aname.length;f++)
										{	
											sqlavalues = sqlavalues+"0"+" , ";
										}	
									}
									
									
									//RECOVERY CALCULATION
									//pay_t_recovery 
									String sqlRecTran = "SELECT * FROM pay_t_salaryrecovery";
									sqlRecTran = sqlRecTran + " WHERE CHR_EMPID='" + empid + "' AND CHR_MONTH='"+mon+"' AND INT_YEAR="+year;
									ssql = "SELECT count(*) FROM pay_t_salaryrecovery ";
									ssql = ssql + " WHERE CHR_EMPID='" + empid + "' AND CHR_MONTH='"+mon+"' AND INT_YEAR="+year;
									String sqlrvalues="";
									String rvalue[][] =  CommonFunctions.RecordSetArray(con,sqlRecTran);
									
									if( CommonFunctions.RecordExist(con, ssql))
									{	
										for(int u=0;u<rname.length;u++)
										{	
											recvalue = recvalue+(Double.parseDouble(rvalue[0][(u+1)]));//Math.round
											sqlrvalues = sqlrvalues+rvalue[0][(u+1)]+" ,";
										}	
									}
									else
									{
										for(int u=0;u<rname.length;u++)
										{	sqlrvalues = sqlrvalues+"0"+" , ";
										}	
									}
									 
									
									grosspay=(basic+addedallowance);
									
									 
									
									
									
									//PF
									pftype = attdata[v][5];
									esitype = attdata[v][4];
									asql = "SELECT INT_ROWID,INT_PFMINIMUM_LIMIT,INT_PFMAXIMUM_LIMIT,INT_ESILIMIT FROM m_pf_setting WHERE INT_ROWID ="+attdata[v][21];
									String pfData[][] = CommonFunctions.QueryExecute(asql);
									if(pfData.length>0)
									{
										dbminimumpflimit= Double.parseDouble(pfData[0][1]);
										dbpflimit=Double.parseDouble(pfData[0][2]);
										dbesilimit=Double.parseDouble(pfData[0][3]);
									}
									else
									{
										dbminimumpflimit=0;dbpflimit=0;dbesilimit=0;
									}
									
									 
									if (pftype.equals("P"))
									{	
										//Orginal basic less than 3200 then pf calculated by 3200
										if(originalbasic<dbminimumpflimit)
										{
											pfValue = (dbminimumpflimit/noofworkingdaysinamonth*totaldays)* (pfValue / 100);
											CompanyPF1 = (dbminimumpflimit/noofworkingdaysinamonth*totaldays)* (cpypension / 100);
											CompanyPF2 = (dbminimumpflimit/noofworkingdaysinamonth*totaldays)* (cpypf / 100);
											 
										}
										else
										{
											if(basic<dbpflimit)
											{
												pfValue = basic * pfValue / 100;
												CompanyPF1=(double)(basic)*(cpypension/100);
												CompanyPF2=(double)(basic)*(cpypf/100);
											}
											else
											{
												pfValue = dbpflimit * pfValue / 100;
												CompanyPF1=(double)(dbpflimit)*(cpypension/100);
												CompanyPF2=(double)(dbpflimit)*(cpypf/100);
											}
										}
										 originalpf=((double)(originalbasic)*(cpypf/100));//math.round
										 originalpension=((double)(originalbasic)*(cpypension/100));//Math.round
									}
									else
									{
										pfValue=0;
										CompanyPF1=0;
										CompanyPF2=0;
										originalpf=0;
										originalpension=0;
									}
									
									//ESI
									if (esitype.equals("P"))
									{	
										if(originalgross>dbesilimit) 
										{	
											esiValue = 0;
											CompanyESI=0;
											originalesi=0;
										}	
										else
										{	
											esiValue =  grosspay  * esiValue / 100;
											CompanyESI=(double)(grosspay)*(cpyesi/100);
											originalesi = ((double)(originalbasic+originalallowance)*(cpyesi/100));
										}	
									}
									else
									{
										esiValue=0;
										CompanyESI=0;
										originalesi=0;
									}
									 
									penbasic=0;admincharge=0;edli=0;admincharge1=0;pension=0;
									if(!pftype.equals("N"))
									{
										if(originalbasic<dbminimumpflimit)
										{
											penbasic = dbminimumpflimit;//3200 changed to month basic
											penbasic = (dbminimumpflimit/noofworkingdaysinamonth*totaldays);
											pension = (dbminimumpflimit/noofworkingdaysinamonth*totaldays)*( cpypension/100);
										}
										else
										{
											if(basic>dbpflimit)
											{
												penbasic = dbpflimit; 
												pension = (dbpflimit*cpypension/100); 
											}
											else
											{
											
												penbasic = (basic); 
												pension =(basic*cpypension/100);
											}
										}
										if(pfValue>=0)
										{
											admincharge =penbasic*(1.1/100);
											edli =penbasic*(0.5/100);
											admincharge1 =(penbasic*(0.01/100));
										}
									}
									else
									{
										penbasic=0;admincharge=0;edli=0;admincharge1=0;pension=0;
									}
									
									
									
									
									
									
									
									pfValue= CommonFunctions.keep2Digit(pfValue);
									originalgross=(originalbasic+originalallowance); 
									originalctc=(originalbasic+originalallowance+originalpf+originalpension+originalesi); 
									ctcsal=(grosspay+CompanyPF1+CompanyPF2+CompanyESI);
									lop=0.0;
									
									
									 
									
									//Pay Tax Calculation
									if("Y".equals(staffprofessionaltax))
									{
										for(int t=0;t<taxdata.length;t++)
											if((originalgross >= Integer.parseInt(taxdata[t][0])) && (originalgross <= Integer.parseInt(taxdata[t][1])))
												if("P".equals(compaytaxvalue))
													taxvalue = taxvalue+((originalgross)*(Double.parseDouble(taxdata[t][2])/100));
												else
													taxvalue= taxvalue+Double.parseDouble(taxdata[t][3]);
									}
									else
										taxvalue=0;
									
									
									 
									lop=0;
									if("0".equals(attdata[v][24]))
										lop = (originalctc-ctcsal);//Math.round
									
									 
									sql="";
									sql = "INSERT INTO pay_t_salary VALUES";
									sql = sql + "(";
									sql = sql + "'"+empid+"' , ";
									sql = sql + "'"+empname+"' , ";
									sql = sql + "'"+mon+"' , ";
									sql = sql + year+" , ";
									sql = sql + attendancecycle+" , ";
									sql = sql + "  "+actualcompany+"  , ";
									sql = sql + "  "+actualbranch+"  , ";
									sql = sql + "  "+actualdepart+"  , ";
									sql = sql + "  "+actualdesign+"  , ";
									sql = sql + "  "+actualoffice+"  , ";
									sql = sql + "  '"+actualbank+"'  , ";
									sql = sql + "  '"+actualaccountno+"'  , ";
									sql = sql + "'"+actualpftype+"' , ";
									sql = sql + "'"+actualesitype+"' , ";
									sql = sql + (noofdaysinamonth-extradays)+" , ";
									sql = sql + totaldays+" , ";
									sql = sql + basic+" , ";
									sql = sql + sqlavalues;
									sql = sql + addedallowance+" , ";
									sql = sql + extraallowance+" , ";
									//sql=sql+actualgpay+" , ";
									sql = sql + grosspay+" , ";
									sql = sql + sqlrvalues;
									sql = sql + recvalue+",";
									sql = sql + (pfValue)+",";//Math.round
									sql = sql + (esiValue)+",";//Math.round
									sql = sql + mess+",";
									sql = sql + advance+",";
									totalrecovery=recvalue+pfValue+esiValue+taxvalue;
									
									
									sql=sql+totalrecovery+",";
									totalsal=(grosspay-(recvalue+pfValue+esiValue+mess+advance+taxvalue));
									monthsal=((grosspay-(recvalue+pfValue+esiValue+mess+advance+taxvalue))+extraallowance);
									ctcsal=(grosspay+CompanyPF1+CompanyPF2+CompanyESI);
									sql = sql+totalsal+",";
									sql = sql+monthsal+",";
									sql = sql+CompanyPF1+",";
									sql = sql+CompanyPF2+",";
									sql = sql+CompanyESI+",";
									sql = sql+(CompanyPF1+CompanyPF2+CompanyESI)+",";
									sql = sql+ctcsal+",";
									sql = sql+originalctc+"," ;
									sql = sql+absent+"," ;
									sql = sql+lop+"," ;
									sql = sql+penbasic+"," ;
									sql = sql+(pfValue-Math.round(pension))+"," ;//3.67=12%-8.33%
									sql = sql+Math.round(pension)+"," ;
									sql = sql+admincharge+"," ;
									sql = sql+edli+"," ;
									sql = sql+admincharge1+"," ;
									sql = sql+taxvalue+"," ;
									sql = sql+" null,'0',null,null,'"+loginempid+"' ,'"+userid+"' , DATE(NOW()),'Y' ";
									sql = sql+")";
									
									acs.setString(1, sql);
									acs.addBatch();
									attempids = attempids +"'"+empid +"' ,";
									System.out.println("Salary Emp id : " +empid +" / "+ v+" @ "+ attdata.length );
								
								} 
								catch (Exception e) 
								{
									System.out.println("error :"+empid);
								} 
							}
							
							acs.executeBatch();
							acs.close();
							
							asql = " UPDATE "+attendanceTable+" SET CHR_SALARYFLAG='Y' WHERE CHR_MONTH=? AND INT_YEAR=? AND CHR_EMPID IN(?)";
							apstm = con.prepareStatement(asql);
							apstm.setString(1,mon);
							apstm.setString(2,year);
							apstm.setString(3,attempids+"'0'");
							apstm.execute();
							apstm.close();
							
							date = new Date();
							System.out.println("Ending Time :"+dateFormat.format(date));
							
							
							con.close(); 
							response.sendRedirect("Smart Payroll/Salary Report.jsp?er=Salary processed for "+attdata.length+" employees ...");
						 
					}
					else
					{
						con.close(); 
						response.sendRedirect("Smart Payroll/Salary Process.jsp?er=Salary process not possible. Need Allovance and recovery migration...");
					}
				}
				else
				{
					con.close(); 
					response.sendRedirect("Smart Payroll/Salary Process.jsp?er=Salary process not done due to incompletion of attendance...");
				}
		 }
 			
		} 
		catch (Exception e) 
		{
			System.out.println(e.getMessage());
			request.setAttribute("error", e.getMessage() );
			RequestDispatcher dispatchers = request.getRequestDispatcher("/error/index.jsp");
    		dispatchers.forward(request, response);
		}
	}
	
}
