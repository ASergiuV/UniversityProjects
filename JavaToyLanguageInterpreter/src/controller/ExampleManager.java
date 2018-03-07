package controller;

import statements.*;
import view.ProgramWindow;

import java.util.ArrayList;

import expressions.*;

public class ExampleManager {
	
	public int nr_of_programs;
	
	
	public ExampleManager(){
		nr_of_programs = 4;
	}
	
	public IStatement example1(){
	/*	IStatement ass = new AssignStatement("v", new ConstantExpression(20));
		IStatement fork = new ForkStatement(new CompStatement(new PrintStatement(new VarExpression("v")), new AssignStatement("v",
				new ArithmExpression(new VarExpression("v"), new ConstantExpression(1), 1))));

		IStatement print = new PrintStatement(new ArithmExpression(new VarExpression("v"),
				new ConstantExpression(10), 3));

		IStatement fors = new forStmt(new ConstantExpression(0), new ConstantExpression(3), new ArithmExpression(new VarExpression("v"),
																							new ConstantExpression(1),1),
				fork);

		IStatement stm1 = new CompStatement(ass, new CompStatement(fors, print));
//asta e cu for*/
		
		/*a=1;b=2;c=5;
			switch(a*10)
			 (case (b*c) print(a);print(b))
			 (case (10) print(100);print(200))
			 (default print(300));
			print(300)
			 The final Out should be {2,5,300}
 */
		IStatement ass1 = new AssignStatement("a", new ConstantExpression(1));
		IStatement ass2 = new AssignStatement("b", new ConstantExpression(2));
		IStatement ass3 = new AssignStatement("c", new ConstantExpression(5));
		
		IStatement sw=new switchStatement(new ArithmExpression(new VarExpression("a"),new ConstantExpression(10),3),
				new ArithmExpression(new VarExpression("b"),new VarExpression("c"),3),
				new CompStatement(new PrintStatement(new VarExpression("a")),new PrintStatement(new VarExpression("b"))),
				new ConstantExpression(10),
				new CompStatement(new PrintStatement(new ConstantExpression(100)),new PrintStatement(new ConstantExpression(200))),
				new PrintStatement(new ConstantExpression(300)));
		IStatement print2 =new PrintStatement(new ConstantExpression(300));
		IStatement stm1=new CompStatement(ass1,new CompStatement(ass2,new CompStatement(ass3,new CompStatement(sw,print2))));
		
		
		return stm1;
	}
	
	public IStatement example2(){
		/*
		* new(v1,2);new(v2,3);new(v3,4);newBarrier(cnt,rH(v2));
		  fork(await(cnt);wh(v1,rh(v1)*10));print(rh(v1)));
          fork(await(cnt);wh(v2,rh(v2)*10));wh(v2,rh(v2)*10));print(rh(v2)));
          await(cnt);
          print(rh(v3));
          The final Out should be {4,20,300}.
		* */

		IStatement new_1 = new newStatement("v1", new ConstantExpression(2));
		IStatement new_2 = new newStatement("v2", new ConstantExpression(3));
		IStatement new_3 = new newStatement("v3", new ConstantExpression(4));
		
		IStatement barrier_1 = new newBarrierStmt("cnt", new readHeapExpression("v2"));
		
		IStatement await_1 = new awaitStmt("cnt");
		IStatement write_1 = new writeHeapStatement("v1", new ArithmExpression(new readHeapExpression("v1"), new ConstantExpression(10), 3));
		IStatement print_1 = new PrintStatement(new readHeapExpression("v1"));

		IStatement await_2 = new awaitStmt("cnt");
		IStatement write1_2 = new writeHeapStatement("v2", new ArithmExpression(new readHeapExpression("v2"), new ConstantExpression(10), 3));
		IStatement write2_2 = new writeHeapStatement("v2", new ArithmExpression(new readHeapExpression("v2"), new ConstantExpression(10), 3));
		IStatement print_2 = new PrintStatement(new readHeapExpression("v2"));

		IStatement await_4 = new awaitStmt("cnt");
		IStatement print_4 = new PrintStatement(new readHeapExpression("v3"));

		IStatement firstLine = new CompStatement(new_1, new CompStatement(new_2, new CompStatement(new_3, barrier_1)));
		IStatement secondLine = new ForkStatement(new CompStatement(await_1,new CompStatement(write_1, new CompStatement(print_1, await_1))));
		IStatement thirdLine = new ForkStatement(new CompStatement(await_2, new CompStatement(write1_2, new CompStatement(write2_2, print_2))));

		IStatement stm = new CompStatement(firstLine, new CompStatement(secondLine, 
				new CompStatement(thirdLine, new CompStatement(await_4, print_4))));

		return stm;
	}
	
	public IStatement example3(){
		/*IStatement stm1=new CompStatement(
				new AssignStatement("a",new ConstantExpression(15)),
				new CompStatement(
						new AssignStatement("b",new ConstantExpression(20)),
						new CompStatement(
								new WhileStatement(
										new neExpression(new VarExpression("a"),new VarExpression("b")),
										new IfStatement(
												new ltExpression(
														new VarExpression("a"),
														new VarExpression("b")
														),
												new AssignStatement("b",new ArithmExpression(new VarExpression("b"),new VarExpression("a"),2)),
												new AssignStatement("a",new ArithmExpression(new VarExpression("a"),new VarExpression("b"),2))
												)
										),
								new PrintStatement(new VarExpression("a"))
								)
						)
				);
		*/
		IStatement stm1 = new CompStatement(
				new newStatement("v1",new ConstantExpression(20)),
				new CompStatement(
						new newStatement("v2",new ConstantExpression(30)),
						new CompStatement(
								new newLockStmt("x"),
								new CompStatement(
										new ForkStatement(
												new CompStatement(
														new ForkStatement(new CompStatement(new lockStmt("x"),
																new CompStatement(new writeHeapStatement("v1",new ArithmExpression(new readHeapExpression("v1"),new ConstantExpression(1),2)),
																		new unlockStmt("x"))
																)
																),
														new CompStatement(
																new lockStmt("x"),
																new CompStatement(
																		new writeHeapStatement("v1",new ArithmExpression(new readHeapExpression("v1"),new ConstantExpression(1),1)),
																		new unlockStmt("x")
																					)
																			)
																		)
														),new CompStatement(
																new newLockStmt("q"),
																new CompStatement(
																		new ForkStatement(new CompStatement(
																				new ForkStatement(
																						new CompStatement(
																								new lockStmt("q"),
																								new CompStatement(
																										new writeHeapStatement("v2",new ArithmExpression(new readHeapExpression("v2"),new ConstantExpression(5),1))
																										,new unlockStmt("q")
																														)
																											)
																								),new CompStatement(
																										new AssignStatement("m",new ConstantExpression(100)),new CompStatement(
																												new lockStmt("q"),
																												new CompStatement(new writeHeapStatement("v2",new ArithmExpression(new readHeapExpression("v2"),new ConstantExpression(1),1)),new unlockStmt("q")))))),new CompStatement(new AssignStatement("z",new ConstantExpression(200)),new CompStatement(new AssignStatement("z",new ConstantExpression(300)),new CompStatement(new AssignStatement("z",new ConstantExpression(400)),new CompStatement(new lockStmt("x"),new CompStatement(new PrintStatement(new readHeapExpression("v1")),new CompStatement(new unlockStmt("x"),new CompStatement(new lockStmt("q"),new CompStatement(new PrintStatement(new readHeapExpression("v2")),new unlockStmt("q")))))))))))))));
		return stm1;
	}
	
	public IStatement example4(){
		IStatement stm=new CompStatement(
				new AssignStatement("v",new ConstantExpression(10)),
				new CompStatement(
						new newStatement("a",new ConstantExpression(22)),
						new CompStatement(
								new ForkStatement(
										new CompStatement(
												new writeHeapStatement("a",new ConstantExpression(30)),
												new CompStatement(
														new AssignStatement("v",new ConstantExpression(32)),
														new CompStatement(
																new PrintStatement(new VarExpression("v")),
																new PrintStatement(new readHeapExpression("a"))
																)
														)
												)
										),
								new CompStatement(
										new PrintStatement(new VarExpression("v")),
										new PrintStatement(new readHeapExpression("a"))
										)
								)
						)
				);
		
		return stm;
	}
	
	public IStatement getPrgStatement(int index){
		if(index == 1){
			return example1();
		}
		if(index == 2){
			return example2();
		}
		if(index == 3){
			return example3();
		}
		if(index == 4){
			return example4();
		}
		
		
		return null;
	}
	
	public IStatement getStatementByStr(String str){
		for(int i=1;i<=nr_of_programs;i++){
			if(getPrgStatement(i).toString().equals(str) == true){
				return getPrgStatement(i);
			}
		}
		
		return null;
	}
	
	public void RunGivenProgram(String str){
		IStatement stm = getStatementByStr(str);
		
		if(stm != null){
			ProgramWindow pw = new ProgramWindow(stm);
			try{
				
				pw.RunProgram();
			
			}
			catch(Exception e){
			
				System.out.println("Something don' gufed with ProgramWindow");
				
			}
		}
	}
	
	public ArrayList<String> getAllPrgAsStr(){
		ArrayList<String> list = new ArrayList<String>();
		
		for (int i = 1; i<=nr_of_programs;i++){
			list.add(getPrgStatement(i).toString());
		}
		
		return list;
	}
}
