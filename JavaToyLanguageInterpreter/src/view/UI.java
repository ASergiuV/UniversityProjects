package view;

import controller.ExampleManager;
import javafx.application.Application;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.geometry.Insets;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.ComboBox;
import javafx.scene.layout.HBox;
import javafx.stage.Stage;

public class UI extends Application{

	ExampleManager em;
	
	public UI(){
		em = new ExampleManager();
	}
	
	
	private HBox getMainLayout(){
		ComboBox<String> options = new ComboBox<String>();
		options.setPrefSize(1000, 30);
		options.getItems().addAll(em.getAllPrgAsStr());
		
		Button runButton = new Button("Run");
		runButton.setPrefSize(50, 30);
		
		runButton.setOnAction(new EventHandler<ActionEvent>() {
		    @Override public void handle(ActionEvent e) {
		    	if(options.getValue() != null)
		    		em.RunGivenProgram(options.getValue());
		    }
		});
		
		HBox layout = new HBox();
		layout.getChildren().add(options);
		layout.getChildren().add(runButton);
		
		layout.setPadding(new Insets(15, 12, 15, 12));
	    layout.setSpacing(5);
		layout.setStyle("-fx-background-color: #336699;");
		
		return layout;
	}
	
	
	@Override
	public void start(Stage primaryStage) throws Exception {
		
		Scene mainScene = new Scene(getMainLayout());
		
		primaryStage.setScene(mainScene);
		primaryStage.setTitle("Program Select");
		
		primaryStage.show();
	}
	
	public void startApp(){
		launch();
	}
	
}
