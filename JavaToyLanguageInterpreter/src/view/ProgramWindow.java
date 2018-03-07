package view;

import statements.*;

import java.io.BufferedReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;

import controller.Controller;
import controller.IController;
import exceptions.ExceptionEndOfExecution;
import exceptions.ExceptionExpression;
import exceptions.ExceptionFile;
import exceptions.ExceptionHeap;
import javafx.beans.value.ChangeListener;
import javafx.beans.value.ObservableValue;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.geometry.Insets;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.ListView;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.TextField;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.layout.BorderPane;
import javafx.scene.layout.HBox;
import javafx.scene.text.Text;
import javafx.stage.Stage;
import model.*;
import repository.IRepository;
import repository.Repository;

public class ProgramWindow{
	private IStatement myStatement;
	private ProgramState selectedProgramState;
	private IController ctrl;
	
	private Button runButton;
	private TextField nrPrgStatTextField;
	
	private ListView<String> stack;
	private TableView<TableViewNanny> symTable;
	private ListView<String> prgStates;
	private TableView<TableViewNanny> fileTable;
	private ListView<String> outList;
	private TableView<TableViewNanny> heapTable;
	private TableView<TableViewNanny> BarrierTable;
	
	public ProgramWindow(IStatement st){
		myStatement = st;

		selectedProgramState = new ProgramState();
		
		selectedProgramState.get_Stack().push(myStatement);

		IRepository repo=new Repository("Log.txt");

		repo.add_prgState(selectedProgramState);
		
		ctrl=new Controller(repo);
	}
	
	private void ShowError(String errMsg){
		BorderPane bp = new BorderPane();
		
		Text t = new Text();
		t.setText(errMsg);
		
		bp.setCenter(t);
		
		Scene s = new Scene(bp,200,75);
		Stage ps = new Stage();
		ps.setScene(s);
		ps.show();
	}

	private HBox getTopLayout(){
		HBox layout = new HBox();
		
		runButton = new Button("One Step");
		
		runButton.setOnAction(new EventHandler<ActionEvent>() {
		    @Override public void handle(ActionEvent e) {
		    	try {
					ctrl.OneStep();
				} catch (ExceptionFile e1) {
					ShowError("Error with Files: " + e1.toString());
					runButton.setDisable(true);
				} catch (ExceptionHeap e1) {
					ShowError("Error with Heap: " + e1.toString());
					runButton.setDisable(true);
				} catch (ExceptionExpression e1) {
					ShowError("Error with Expressions: " + e1.toString());
					runButton.setDisable(true);
				} catch (IOException e1) {
					ShowError("Error with I/O: " + e1.toString());
					runButton.setDisable(true);
				} catch (InterruptedException e1) {
					ShowError("End of execution, unknown why : "+e1.toString());
					runButton.setDisable(true);
				} catch (ExceptionEndOfExecution e1){
					ShowError("End of execution.");
					runButton.setDisable(true);
				}
		    	
		    	UpdateAll();
		    }
		});
		
		nrPrgStatTextField = new TextField("5");
		
		layout.getChildren().add(runButton);
		layout.getChildren().add(nrPrgStatTextField);
		
		layout.setPadding(new Insets(15, 12, 15, 12));
	    layout.setSpacing(10);
		layout.setStyle("-fx-background-color: #335577;");
		
		return layout;
	}
	
	@SuppressWarnings("unchecked")
	private HBox getCenterLayout(){
		HBox layout = new HBox();
		
		stack = new ListView<String>();
		symTable = new TableView<TableViewNanny>();
		prgStates = new ListView<String>();
		fileTable = new TableView<TableViewNanny>();
		outList = new ListView<String>();
		heapTable = new TableView<TableViewNanny>();
		BarrierTable = new TableView<TableViewNanny>();
		
		prgStates.getSelectionModel().selectedItemProperty()
        .addListener(new ChangeListener<String>() {
          public void changed(ObservableValue<? extends String> observable,
              String oldValue, String newValue) {
        	  if(newValue!=null)
        		  if(ctrl.getPrgStateByStr(newValue) != null)
        			  {selectedProgramState = ctrl.getPrgStateByStr(newValue);
        			  UpdateAll();}
          }
        });
		
		//symStable
	     TableColumn<TableViewNanny,String> varName = new TableColumn<>("Name");
	     TableColumn<TableViewNanny,String> varVal = new TableColumn<>("Value");
		
	     varName.setMinWidth(125);
	     varVal.setMinWidth(125);
			
	     varName.setCellValueFactory(new PropertyValueFactory<>("val_one"));
	     varVal.setCellValueFactory(new PropertyValueFactory<>("val_two"));
	     
	     symTable.getColumns().addAll(varName,varVal);
	     
	     
	     //fileTable
	     TableColumn<TableViewNanny,String> varNameF = new TableColumn<>("ID");
	     TableColumn<TableViewNanny,String> varValF = new TableColumn<>("File");
		
	     varNameF.setMinWidth(125);
	     varValF.setMinWidth(125);
			
	     varNameF.setCellValueFactory(new PropertyValueFactory<>("val_one"));
	     varValF.setCellValueFactory(new PropertyValueFactory<>("val_two"));
	     
	     fileTable.getColumns().addAll(varNameF,varValF);
	     
	     
	     //heapTable
	     TableColumn<TableViewNanny,String> varNameH = new TableColumn<>("Address");
	     TableColumn<TableViewNanny,String> varValH = new TableColumn<>("Value");
		
	     varNameH.setMinWidth(125);
	     varValH.setMinWidth(125);
			
	     varNameH.setCellValueFactory(new PropertyValueFactory<>("val_one"));
	     varValH.setCellValueFactory(new PropertyValueFactory<>("val_two"));
	     
	     heapTable.getColumns().addAll(varNameH,varValH);
	     
	     
	     //Barrier table
	     TableColumn<TableViewNanny,String> BarIndex = new TableColumn<>("Index");
	     TableColumn<TableViewNanny,String> BarTupleValue = new TableColumn<>("Value");
	     TableColumn<TableViewNanny,String> BarTupleList = new TableColumn<>("List of Values");
	     BarIndex.setMinWidth(125);
	     BarTupleList.setMinWidth(125);
	     BarTupleValue.setMinWidth(125);
	     
	     BarIndex.setCellValueFactory(new PropertyValueFactory<>("val_one"));
	     BarTupleList.setCellValueFactory(new PropertyValueFactory<>("val_three"));
         BarTupleValue.setCellValueFactory(new PropertyValueFactory<>("val_two"));
//
	     BarrierTable.getColumns().addAll(BarIndex,BarTupleValue,BarTupleList);
//	     
		 layout.getChildren().add(stack);
		 layout.getChildren().add(symTable);
		 layout.getChildren().add(prgStates);
		 layout.getChildren().add(fileTable);
		 layout.getChildren().add(outList);
		 layout.getChildren().add(heapTable);
		 layout.getChildren().add(BarrierTable);
		
		
		return layout;
	}
	
	public void start(Stage programStage) throws Exception {
		
		BorderPane	mainLayout = new BorderPane();
		mainLayout.setTop(getTopLayout());
		mainLayout.setCenter(getCenterLayout());
		
		Scene prgScene = new Scene(mainLayout);
		
		programStage.setScene(prgScene);
		
		UpdateAll();
		programStage.show();
	}
	
	public void RunProgram() throws Exception{
		start(new Stage());
	}
	
	private void update_top_part(IController c){
		Integer x = c.getAllPrgStates().size();
		nrPrgStatTextField.setText(x.toString());
	}
	
	private void update_tables(ProgramState prg){
		
		//Stack
		Object[] s = prg.get_Stack().toArray();
		ObservableList<String> aux1 = FXCollections.observableArrayList();
		for(int i=s.length-1;i>=0;i--){
			String str = s[i].toString();
			aux1.add(str);
		}
		stack.setItems(aux1);
		
		
		
		//SymTable
	    ArrayList<Tuple<String,Integer>> s2 = prg.get_Dictionary().toArrayTuple();
		ObservableList<TableViewNanny> aux2 = FXCollections.observableArrayList();
		for(int i=0;i<s2.size();i++){
			String vName = s2.get(i).x.toString();
			String vVal = s2.get(i).y.toString();
			aux2.add(new TableViewNanny(vName,vVal));
		}
		symTable.setItems(aux2);
		
		
		
		
		//prgStates
		ArrayList<String> s3 = ctrl.getAllPrgStates();
		ObservableList<String> aux3 = FXCollections.observableArrayList();
		for(int i=0;i<s3.size();i++){
			String str = s3.get(i);
			aux3.add(str);
		}
		prgStates.setItems(aux3);
		
		
		
		
		//fileTable
		ArrayList<Tuple<Integer,Tuple<String,BufferedReader>>> s4 = prg.get_FileTable().toArrayTuple(); 
		ObservableList<TableViewNanny> aux4 = FXCollections.observableArrayList();
		for(int i=0;i<s4.size();i++){
			String vName = s4.get(i).x.toString();
			String vVal = s4.get(i).y.x.toString();
			aux4.add(new TableViewNanny(vName,vVal));
		}
		fileTable.setItems(aux4);
		
		
		
		//outList
		Object[] s5 = prg.get_List().toArray();
		ObservableList<String> aux5 = FXCollections.observableArrayList();
		for(int i=0;i<s5.length;i++){
			String str = s5[i].toString();
			aux5.add(str);
		}
		outList.setItems(aux5);
		
		
		//heapTable
		ArrayList<Tuple<Integer,Integer>> s6 = prg.get_heap().toArrayTuple(); 
		ObservableList<TableViewNanny> aux6 = FXCollections.observableArrayList();
		for(int i=0;i<s6.size();i++){
			String vName = s6.get(i).x.toString();
			String vVal = s6.get(i).y.toString();
			aux6.add(new TableViewNanny(vName,vVal));
		}
		heapTable.setItems(aux6);
		
		//BUG 
		//BarrierTable
				 
				ObservableList<TableViewNanny> aux8 = FXCollections.observableArrayList();
				//Iterator it = selectedProgramState.getBarrier().getContent().entrySet().iterator();
			   // while (it.hasNext()) {
			      //  Map.Entry pair = (Map.Entry)it.next();
			        //Tuple<MyIList<Integer>,Integer> pair2=(Tuple<MyIList<Integer>,Integer>) pair.getValue();
			        //Integer pairIndex=(Integer)pair.getKey();
			        //String BarList = pair2.getFirst().toString();
					//String BarAmount = Integer.toString( pair2.getSecond());
			        //System.out.println(pair.getKey() + " = " + pair.getValue());
			      //  it.remove(); // avoids a ConcurrentModificationException
			       // aux8.add(new TableViewNanny(Integer.toString(1),BarAmount,BarList));
			       aux8.add(new TableViewNanny("12","12","321"));
//			       
//			       ArrayList<Tuple<MyIList<Integer>,Integer>> l=new ArrayList<Tuple<MyIList<Integer>,Integer>>();
//					
//					Iterator<Entry<Integer,Tuple<MyIList<Integer>, Integer>>> it=selectedProgramState.getBarrier().getContent().entrySet().iterator();
//					while(it.hasNext()){
//						@SuppressWarnings("rawtypes")
//						Map.Entry pair=(Map.Entry)it.next();
//						Tuple<MyIList<Integer>,Integer> tup=(Tuple<MyIList<Integer>,Integer>) pair.getValue();
//						@SuppressWarnings("unchecked")
//						Tuple<MyIList<Integer>,Integer> t=new Tuple<MyIList<Integer>,Integer>((MyIList<Integer>)tup.getFirst(),(Integer)tup.getSecond());
//						l.add(t);
//					}
			       
				
				BarrierTable.setItems(aux8);
	}
    
   
	
	
	private void UpdateAll(){
		update_tables(selectedProgramState);
		update_top_part(ctrl);
	}
}
