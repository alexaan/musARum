using System;
using UnityEngine;
using System.Collections;

/// <summary>
/// This class is used to draw the GUI in the augmented reality scene, 
/// when phase 1 is active. Also handles events and interactions peculiar
/// that phase. 
/// </summary>
public class Phase1GUI : MonoBehaviour {
	
	#region VARIABLES
	float w = 0.3f; // proportional width (0..1)
    float h = 0.05f; // proportional height (0..1)
	
	Rect TextRect = new Rect();
	Rect Text2Rect = new Rect();
	Rect Button1Rect = new Rect();
	public static Rect QuestionButtonRect = new Rect();
	Rect ContinueButtonRect = new Rect();
	Rect TestToMainMenuButtonRect = new Rect(); 
	Rect QuestionLabel1Rect = new Rect(); //Question label/textfield position
	Rect QuestionInputRect = new Rect();
	Rect CorrectAnswerLabelRect = new Rect(); //Correct answer label/textfield position
	Rect CorrectAnswerInputRect = new Rect();
	Rect Alternative1Answer1LabelRect = new Rect();
	Rect AlternativeAnswer1InputRect = new Rect();
	Rect AlternativeAnswer2InputRect = new Rect();
	Rect AlternativeAnswer3InputRect = new Rect();
	Rect SubmitQuestionButtonRect = new Rect();
	public GUISkin customskin;
	private static string toastMessage = "";
	private bool validInput = true;
	
	GameObject keepAlive;
	KeepAliveScript keepAliveScript;
	string continueLabel = "Continue";
	
	
	#endregion //VARIABLES
	
	#region UNITY_MONOBEHAVIOUR_METHODS
	//Define screen areas for different GUI elements
	void Start () {
		
		keepAlive = GameObject.Find("KeepAlive");
		keepAliveScript = (KeepAliveScript) keepAlive.GetComponent(typeof(KeepAliveScript));
		
		TextRect.x = (Screen.width*(1-w))/2;
  		TextRect.y = (Screen.height*(1-h))/2;
  		TextRect.width = Screen.width*w;
  		TextRect.height = Screen.height*(h/2);
		
  		Text2Rect.x = (Screen.width*(1-w))/2;
  		Text2Rect.y = TextRect.y + 100;
  		Text2Rect.width = Screen.width*w;
  		Text2Rect.height = Screen.height*(h/2);
		
  		Button1Rect.x = (Screen.width*(1-w))/2;
  		Button1Rect.y = TextRect.y + 200;
  		Button1Rect.width = Screen.width*w;
  		Button1Rect.height = Screen.height*h;
		
		QuestionButtonRect.width = Screen.width/2;
  		QuestionButtonRect.height = Screen.height*h;
		QuestionButtonRect.x = Screen.width/2 - QuestionButtonRect.width/2;
		QuestionButtonRect.y = Screen.height - Screen.height*(1f/8f);
		
		ContinueButtonRect.width = Screen.width/2;
		ContinueButtonRect.height = Screen.height*h;
		ContinueButtonRect.x = Screen.width/2;
		ContinueButtonRect.y = Screen.height - Screen.height*(1f/8f);
		
  		QuestionLabel1Rect.x = (Screen.width*(1-w))/2;
  		QuestionLabel1Rect.y = Screen.height*h; //(Screen.height*(1-h))/2;
  		QuestionLabel1Rect.width = Screen.width*w;
  		QuestionLabel1Rect.height = Screen.height*(h/2);
		
		QuestionInputRect.x = (Screen.width*(1-w))/2;
  		QuestionInputRect.y = QuestionLabel1Rect.y + 50; //(Screen.height*(1-h))/2;
  		QuestionInputRect.width = Screen.width*w;
  		QuestionInputRect.height = Screen.height*(h/2);
		
  		CorrectAnswerLabelRect.x = (Screen.width*(1-w))/2;
  		CorrectAnswerLabelRect.y = QuestionInputRect.y + 50;
  		CorrectAnswerLabelRect.width = Screen.width*w;
  		CorrectAnswerLabelRect.height = Screen.height*(h/2);
		
		CorrectAnswerInputRect.x = (Screen.width*(1-w))/2;
  		CorrectAnswerInputRect.y = CorrectAnswerLabelRect.y + 50;
  		CorrectAnswerInputRect.width = Screen.width*w;
  		CorrectAnswerInputRect.height = Screen.height*(h/2);
		
		Alternative1Answer1LabelRect.x = (Screen.width*(1-w))/2;
  		Alternative1Answer1LabelRect.y = CorrectAnswerInputRect.y + 50;
  		Alternative1Answer1LabelRect.width = Screen.width*w;
  		Alternative1Answer1LabelRect.height = Screen.height*(h/2);
		
		AlternativeAnswer1InputRect.x = (Screen.width*(1-w))/2;
  		AlternativeAnswer1InputRect.y = Alternative1Answer1LabelRect.y + 50;
  		AlternativeAnswer1InputRect.width = Screen.width*w;
  		AlternativeAnswer1InputRect.height = Screen.height*(h/2);
		
		AlternativeAnswer2InputRect.x = (Screen.width*(1-w))/2;
  		AlternativeAnswer2InputRect.y = AlternativeAnswer1InputRect.y + 50;
  		AlternativeAnswer2InputRect.width = Screen.width*w;
  		AlternativeAnswer2InputRect.height = Screen.height*(h/2);
		
		AlternativeAnswer3InputRect.x = (Screen.width*(1-w))/2;
  		AlternativeAnswer3InputRect.y = AlternativeAnswer2InputRect.y + 50;
  		AlternativeAnswer3InputRect.width = Screen.width*w;
  		AlternativeAnswer3InputRect.height = Screen.height*(h/2);
		
		SubmitQuestionButtonRect.x = (Screen.width*(1-w))/2;
  		SubmitQuestionButtonRect.y = AlternativeAnswer3InputRect.y + 100;
  		SubmitQuestionButtonRect.width = Screen.width*w;
  		SubmitQuestionButtonRect.height = Screen.height*h;
	}
	
	void OnGUI() {
		
		GUI.skin = customskin;
		GUI.skin.button.fontSize = Screen.height / 30;
		GUI.skin.label.fontSize = Screen.height / 40;
		GUI.skin.textField.fontSize = Screen.height / 40;
		
		if(CloudRecoEventHandler.dataLoaded) //if dataLoaded (true when an image has been scanned)
		{
			if(GUI.Button(QuestionButtonRect, CloudRecoEventHandler.dialogButton))
			{
				if(CloudRecoEventHandler.questionTrigger==false)
				{
					CloudRecoEventHandler.questionTrigger = true;
				}
				else 
				{
					CloudRecoEventHandler.questionTrigger = false;
				}
				
				if(CloudRecoEventHandler.wrongImageScanned)
				{
					//mCloudRecoBehaviour.CloudRecoEnabled = true;
					Application.LoadLevel(2);
				}
	
			}
		}//END if dataLoaded
		
		if(CloudRecoEventHandler.questionAdded)//if questionAdded(make it possible to continue)
		{
			QuestionButtonRect.width = Screen.width/2;
			QuestionButtonRect.x = 0;
			
			if(GUI.Button(ContinueButtonRect, continueLabel))
			{
				StartCoroutine(continueFunction());
			}
		}//END if questionAdded
		
		if(CloudRecoEventHandler.questionTrigger)//question popup-GUI
		{
			
			//To stop questions showing if wrong image is scanned
			if(!CloudRecoEventHandler.wrongImageScanned)
			{
				GUILayout.BeginArea(new Rect( (Screen.width/6f), (Screen.height*(1f/12f)), Screen.width*(4f/6f), Screen.height*(5f/6f) ));
				GUILayout.Label("Enter question");
				CloudRecoEventHandler.inputQuestion = GUILayout.TextField(CloudRecoEventHandler.inputQuestion, GUILayout.MaxWidth(Screen.width*(4f/6f)), GUILayout.MaxHeight(Screen.height/16f));
				GUILayout.Label("Enter solution");
				CloudRecoEventHandler.inputSolution = GUILayout.TextField(CloudRecoEventHandler.inputSolution, GUILayout.MaxWidth(Screen.width*(4f/6f)), GUILayout.MaxHeight(Screen.height/16f));
				GUILayout.Label ("Alternative Answers:");
				CloudRecoEventHandler.alternativeAnswer1 = GUILayout.TextField (CloudRecoEventHandler.alternativeAnswer1, GUILayout.MaxWidth(Screen.width*(4f/6f)), GUILayout.MaxHeight(Screen.height/16f));
				CloudRecoEventHandler.alternativeAnswer2 = GUILayout.TextField (CloudRecoEventHandler.alternativeAnswer2, GUILayout.MaxWidth(Screen.width*(4f/6f)), GUILayout.MaxHeight(Screen.height/16f));
				CloudRecoEventHandler.alternativeAnswer3 = GUILayout.TextField (CloudRecoEventHandler.alternativeAnswer3, GUILayout.MaxWidth(Screen.width*(4f/6f)), GUILayout.MaxHeight(Screen.height/16f));
				

			if(GUILayout.Button("Submit", GUILayout.MaxWidth(Screen.width*(4f/6f)), GUILayout.MaxHeight(Screen.height/16f)))
			{ 
				if(0 >= CloudRecoEventHandler.inputQuestion.Length)	         {toastMessage = "Please enter a question text"; 				 validInput = false; CloudRecoEventHandler.toastTimestamp = Environment.TickCount;}
				else if(CloudRecoEventHandler.inputQuestion.Length > 60)	 {toastMessage = "Question text can be max 60 tokens"; 	  		 validInput = false; CloudRecoEventHandler.toastTimestamp = Environment.TickCount;}
				else if(0 >= CloudRecoEventHandler.inputSolution.Length)	 {toastMessage = "Please enter a solution to your question"; 	 validInput = false; CloudRecoEventHandler.toastTimestamp = Environment.TickCount;}
				else if(CloudRecoEventHandler.inputSolution.Length > 60)	 {toastMessage = "Solution text can be max 60 tokens"; 	 	     validInput = false; CloudRecoEventHandler.toastTimestamp = Environment.TickCount;}
				else if(0 >= CloudRecoEventHandler.alternativeAnswer1.Length){toastMessage ="Please enter an alternative solution (1)"; 	 validInput = false; CloudRecoEventHandler.toastTimestamp = Environment.TickCount;}
				else if(0 >= CloudRecoEventHandler.alternativeAnswer2.Length){toastMessage ="Please enter an alternative solution (2)"; 	 validInput = false; CloudRecoEventHandler.toastTimestamp = Environment.TickCount;}
				else if(0 >= CloudRecoEventHandler.alternativeAnswer3.Length){toastMessage ="Please enter an alternative solution (3)"; 	 validInput = false; CloudRecoEventHandler.toastTimestamp = Environment.TickCount;}
				else if(CloudRecoEventHandler.alternativeAnswer1.Length > 60){toastMessage ="Alternative solution (1) can be max 60 tokens"; validInput = false; CloudRecoEventHandler.toastTimestamp = Environment.TickCount;}
				else if(CloudRecoEventHandler.alternativeAnswer2.Length > 60){toastMessage ="Alternative solution (2) can be max 60 tokens"; validInput = false; CloudRecoEventHandler.toastTimestamp = Environment.TickCount;}
				else if(CloudRecoEventHandler.alternativeAnswer3.Length > 60){toastMessage ="Alternative solution (3) can be max 60 tokens"; validInput = false; CloudRecoEventHandler.toastTimestamp = Environment.TickCount;}
				else{validInput = true;}
				
				if(validInput == true)
				{
					StartCoroutine(CloudRecoEventHandler.postQuestion());
					CloudRecoEventHandler.questionTrigger = false;
					CloudRecoEventHandler.toastTimestamp = Environment.TickCount;
					toastMessage = "Question successfully added!";
					CloudRecoEventHandler.questionAdded = true;
				}
			}
			if(validInput == false)
			{
				GUI.skin.box.fontSize = Screen.height / 60;
				GUI.skin.textArea.fontSize = Screen.height / 60;
				GUILayout.TextArea(toastMessage, GUILayout.MaxWidth(Screen.width*(4f/6f)), GUILayout.MaxHeight(Screen.height/8f));
			}//END TOAST-MESSAGE
			
			
				GUILayout.EndArea();
				
			}
		}
	}
	
	//Runs when the continue button is pressed. 
	//Sets variables and loads scene2
	IEnumerator continueFunction()
	{
		StartCoroutine(keepAliveScript.getGroupSessionInfo());
		while(!keepAliveScript.post)
		{
			yield return new WaitForSeconds(0.1f);
		}
		int current_image_toInt;
		int.TryParse(KeepAliveScript.current_image_id, out current_image_toInt);
		current_image_toInt= current_image_toInt+1;
		string image_id_toPost = current_image_toInt.ToString();
		StartCoroutine(keepAliveScript.setGroupSessionInfo("empty", image_id_toPost));
		
		while(!keepAliveScript.waitforGroupSetSessionInfo)
		{
			yield return new WaitForSeconds(0.1f);
		}
		
		Application.LoadLevel(1);
	}
	
	#endregion//UNITY_MONOBEHAVIOUR_METHODS
		
}