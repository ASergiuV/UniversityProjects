using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using InterpreterC.model.expression;
using InterpreterC.model.myDictionary;
using InterpreterC.model.statement;
using InterpreterC.model.statement.basicStatement;
using InterpreterC.repository;
using InterpreterC.controller;
using InterpreterC.view;
using InterpreterC.model.statement.fileStatement;

namespace InterpreterC
{
    class Interpreter
    {
        static void Main(string[] args)
        {
            string logFile = @"logFile.txt";//Hardcoded logFile
            string testFile = @"test.txt";//Hardcoded testFile

            //EXAMPLE 1
            IStmt ex1 = new CompStmt(new AssignStmt("v", new ConstExp(2)), new PrintStmt(new
                    VarExp("v")));
            PrgState prg1 = new PrgState(ex1);
            IRepository repo1 = new Repository(logFile);
            Controller ctrl1 = new Controller(repo1);
            ctrl1.addPrgCtrl(prg1);

            //EXAMPLE 2
            IStmt ex2 = new CompStmt(new AssignStmt("a", new ArithExp('+', new ConstExp(2), new
                    ArithExp('/', new ConstExp(3), new ConstExp(0)))),
                    new CompStmt(new AssignStmt("b", new ArithExp('+', new VarExp("a"), new
                            ConstExp(1))), new PrintStmt(new VarExp("b"))));
            PrgState prg2 = new PrgState(ex2);
            IRepository repo2 = new Repository(logFile);
            Controller ctrl2 = new Controller(repo2);
            ctrl2.addPrgCtrl(prg2);

            //EXAMPLE 3
            IStmt ex3 = new CompStmt(new AssignStmt("a", new ArithExp('-', new ConstExp(2), new
                    ConstExp(2))),
                    new CompStmt(new IfStmt(new VarExp("a"), new AssignStmt("v", new ConstExp(2)), new
                            AssignStmt("v", new ConstExp(3))), new PrintStmt(new VarExp("v"))));
            PrgState prg3 = new PrgState(ex3);
            IRepository repo3 = new Repository(logFile);
            Controller ctrl3 = new Controller(repo3);
            ctrl3.addPrgCtrl(prg3);
            //EXAMPLE 4
            IStmt ex4 = new CompStmt(new openRFile("var", testFile),
                    new CompStmt(new readFile(new VarExp("var"), "c"),
                            new CompStmt(new PrintStmt(new VarExp("c")),
                                    new CompStmt(new IfStmt(new VarExp("c"),
                                            new CompStmt(new readFile(new VarExp("var"), "c"), new PrintStmt(new VarExp("c"))),
                                            new PrintStmt(new ConstExp(0))), new closeRFile(new VarExp("var"))))));
            PrgState prg4 = new PrgState(ex4);
            IRepository repo4 = new Repository(logFile);
            Controller ctrl4 = new Controller(repo4);
            ctrl4.addPrgCtrl(prg4);

            //EXAMPLE 5
            IStmt ex5 = new CompStmt(new openRFile("var", testFile),
                    new CompStmt(new readFile(new ArithExp('+', new VarExp("var"), new ConstExp(2)), "c"),
                            new CompStmt(new PrintStmt(new VarExp("c")),
                                    new CompStmt(new IfStmt(new VarExp("c"),
                                            new CompStmt(new readFile(new VarExp("var"), "c"), new PrintStmt(new VarExp("c"))),
                                            new PrintStmt(new ConstExp(0))), new closeRFile(new VarExp("var"))))));
            PrgState prg5 = new PrgState(ex5);
            IRepository repo5 = new Repository(logFile);
            Controller ctrl5 = new Controller(repo5);
            ctrl5.addPrgCtrl(prg5);


            TextMenu menu = new TextMenu();
            menu.addCommand(new ExitCommand("0", "Exit"));
            menu.addCommand(new RunExample("1", ex1.ToString(), ctrl1));
            menu.addCommand(new RunExample("2", ex2.ToString(), ctrl2));
            menu.addCommand(new RunExample("3", ex3.ToString(), ctrl3));
            menu.addCommand(new RunExample("4", ex4.ToString(), ctrl4));
            menu.addCommand(new RunExample("5", ex5.ToString(), ctrl5));
            menu.show();


            Console.ReadKey();
        }
    }
}
