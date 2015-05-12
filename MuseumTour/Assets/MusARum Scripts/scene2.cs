﻿using UnityEngine;
using System.Collections;
using System.Collections.Generic;

/// <summary>
/// This class is used to draw the GUI in the "Find the picture!" scene, 
///  Also handles events and interactions of that scene. 
/// </summary>
public class scene2 : MonoBehaviour {

    string getTargetsUrl = "http://129.241.103.145/getTargets.php";
	string getQuestionsUrl = "http://129.241.103.145/getQuestions.php";
	static ArrayList imgTargetArray = new ArrayList();
	public static ArrayList questionsArray = new ArrayList();
	static string printList = "";
	string buttontext = "Scan picture";
	string instructions = "";
	bool showInstructions = false;
	int getQuestions_tp_id; // ID of the targetPicture to get questions for.. 
	string instructionsLabel = "Instructions";
	bool builtGUIList = false; 
	
	
	Texture2D cur_image_loaded = null;
	public string imgHostName = "http://129.241.103.145/hintImg/";
	public string imgName = "";
	
	GameObject keepAlive;
	KeepAliveScript keepAliveScript;
	
	public GUISkin customskin;
	
    void OnGUI()
    {
        string group = PlayerPrefs.GetString("group");
		GUI.skin = customskin;
		GUI.skin.button.fontSize = Screen.height / 40;
		GUI.skin.label.fontSize = Screen.height / 40;
		GUI.skin.textField.fontSize = Screen.height / 40;

        float w = 0.3f; // proportional width (0..1)
        float h = 0.05f; // proportional height (0..1)
		
        var TextRect = new Rect();
  		TextRect.x = (Screen.width*(1-w))/2;
  		TextRect.y = (Screen.height*(1-h))/2;
  		TextRect.width = Screen.width*w;
  		TextRect.height = Screen.height*(h/2);
		
		var Label1Rect = new Rect();
        Label1Rect.width = Screen.width * w * 2;
        Label1Rect.height = Screen.height * (h / 2)*100;
		Label1Rect.x = (Screen.width/2) - Label1Rect.width /2;
        Label1Rect.y = (Screen.height * (1 - h)) / 2;

        var Label2Rect = new Rect();
		Label2Rect.width = Screen.width * w;
        Label2Rect.height = Screen.height * (h / 2);
        Label2Rect.x = (Screen.width/2) - Label2Rect.width/2;
        Label2Rect.y = Label1Rect.y - 100;
        	
		var Button1Rect = new Rect();
		Button1Rect.width = Screen.width*w *2;
  		Button1Rect.height = Screen.height*h;
  		Button1Rect.x = (Screen.width / 2) - Button1Rect.width/2;
  		Button1Rect.y = TextRect.y + 200;
  		
		var InstructionsButtonrect = new Rect();
  		InstructionsButtonrect.x = 10;
  		InstructionsButtonrect.y = Screen.height - (Screen.height*h) - 10;
  		InstructionsButtonrect.width = Screen.width*w;
  		InstructionsButtonrect.height = Screen.height*h;
		
		var TextboxRect = new Rect();
  		TextboxRect.x = 10;
  		TextboxRect.y = (Screen.height - (Screen.height*h) - 10) + Screen.height*h;
  		TextboxRect.width = Screen.width;
  		TextboxRect.height = Screen.height/4;
		
		var ImageRect = new Rect();
        ImageRect.width = Screen.width/2;
        ImageRect.height = 256f;
		ImageRect.x = (Screen.width/2) - ImageRect.width/2;
        ImageRect.y = TextRect.y - 30 - ImageRect.height;

        // Make a background box
		GUI.Box(new Rect(10,10,Screen.width-20, Screen.height-20), "Find the picture!");
		
		GUI.Label(Label1Rect, printList);
		
		if(GUI.Button(Button1Rect, buttontext))
		{
			var yolo = PlayerPrefs.GetString("phase");
			printList = "";
			buttontext = "Loading....";
			//Application.LoadLevel(3); //<--for testing in Unity
			Application.LoadLevel(2);
			
		}
		if(keepAliveScript.post)
		{
			if(KeepAliveScript.current_phase == "Phase 1")
			{
				instructions = "This is phase one. Here you will have to find and scan the image that is displayed. When you have found the picture you have to create atleast one question related to that picture.";
			}
			if(KeepAliveScript.current_phase == "Phase 2")
			{
				instructions = "Find the picture, scan it and:\n Answer dem questioooonz.";
				
			}		
		}
		
	
		
		if(cur_image_loaded != null)
		{//draw a "hint image" if one is loaded
		GUI.DrawTexture(ImageRect, cur_image_loaded, ScaleMode.ScaleToFit, true);
		}
		if(showInstructions)
		{
			Color col = new Color(1,1,1,1.0f);
			var background = new GUIStyle(GUI.skin.box);
			background.normal.background = MakeTex(2, 2, new Color( 0f, 0f, 0f, 0.7f ));
			background.normal.textColor = col;
			GUI.Box(new Rect(10,Screen.height/2,Screen.width-20, Screen.height/4), "", background);
			GUI.enabled = false;
			GUI.TextArea(new Rect(10,Screen.height/2,Screen.width-20, Screen.height/4), instructions);
			GUI.enabled = true;
			
		}
		if(GUI.Button(InstructionsButtonrect, instructionsLabel))
		{
			if(!showInstructions){ showInstructions = true; }
			else if(showInstructions){ showInstructions = false; }
		}
    }
	
	//Make 2D textures
	private Texture2D MakeTex( int width, int height, Color col )
	{
		Color[] pix = new Color[width * height];
		for( int i = 0; i < pix.Length; ++i )
		{
			pix[ i ] = col;
		}
		Texture2D result = new Texture2D( width, height );
		result.SetPixels( pix );
		result.Apply();
		return result;
	}

	//Initialize variables on load
    IEnumerator Start()
    {
		keepAlive = GameObject.Find("KeepAlive");
		keepAliveScript = (KeepAliveScript) keepAlive.GetComponent(typeof(KeepAliveScript));
		
		keepAliveScript.post = false;
		StartCoroutine(keepAliveScript.getGroupSessionInfo());
		while(!keepAliveScript.post)
		{
			yield return new WaitForSeconds(0.1f);
		}
		StartCoroutine(setUp());
	}
	
	//initialize variables that require db communication
	private IEnumerator setUp()
	{
		WWWForm form = new WWWForm();
		string code = PlayerPrefs.GetString("code");
		form.AddField("code", code);
		WWW getTargets = new WWW(getTargetsUrl, form);
		yield return getTargets;
		if ((!string.IsNullOrEmpty(getTargets.error)))
        {
            Debug.Log(getTargets.text);
            print("Error downloading targets list: " + getTargets.error);
        }
		else{
		var returnedString = getTargets.data;
		string[] values =returnedString.Split('&');
			for(int i=0;i<values.Length-1;i++)
			{
				ArrayList imgTargetInnerArray = new ArrayList();
				var value = values[i];
				string[] innerValues = value.Split('|');
					string tp_id = innerValues[0];
					string tp_name = innerValues[1];
					string tp_info = innerValues[2];
					string tp_hintImg = innerValues[3];
					string route_number = innerValues[4];
					imgTargetInnerArray.Add(tp_id); imgTargetInnerArray.Add(tp_name); imgTargetInnerArray.Add(tp_info); imgTargetInnerArray.Add (tp_hintImg); imgTargetInnerArray.Add(route_number);
					imgTargetArray.Add(imgTargetInnerArray);
					Debug.Log(imgTargetArray.Count);
			}
			getTargets.Dispose();
			StartCoroutine(buildGUIList());
        }
		Debug.Log ("ready to enter..");
		
		while(!builtGUIList){
		yield return new WaitForSeconds(0.1f);
		}
		
		StartCoroutine(getQuestionsForTargetPicture(getQuestions_tp_id));
	}
	
	//Function for testing, returns all imageTargets linked to the session.
	void buildList()	
	{
		printList+="Registered targets: \n";
		for(int i=0;i<imgTargetArray.Count; i++)
		{
			ArrayList tempImgTargetInnerArray = (ArrayList)imgTargetArray[i];
			foreach(string imgTargetField in tempImgTargetInnerArray)
			{
				printList+=imgTargetField;
			}
			printList+="\n";
			 
		}
	}
	
	//Get name and hintImg for a Target Image
	IEnumerator buildGUIList()	
	{
		builtGUIList = false;
		printList="Find a picture called ";
		bool route_hasNext = false;
		for(int j = 0;j<imgTargetArray.Count; j++)
		{
			ArrayList tempImgTargetInnerArray = (ArrayList)imgTargetArray[j];
			string temp_route_number = (string)tempImgTargetInnerArray[4];
			string current_img_toString;
			while(!keepAliveScript.post)
			{
				yield return new WaitForSeconds(0.1f);
			}
			current_img_toString = KeepAliveScript.current_image_id;
			if(temp_route_number == current_img_toString)
			{
				string picTitle = (string)tempImgTargetInnerArray[1];
				printList+=picTitle;
				imgName = (string)tempImgTargetInnerArray[3];
				PlayerPrefs.SetString("current_image_name", imgName);
				StartCoroutine(load_image_preview(imgHostName+imgName));
				route_hasNext = true;
				
				string temp = (string)tempImgTargetInnerArray[0];
				int.TryParse(temp,out getQuestions_tp_id);
				break;
			}
		}
			if(route_hasNext == false)
		{
			
			StartCoroutine(keepAliveScript.getGroupSessionInfo());
			
			while(!keepAliveScript.post)
			{
				yield return new WaitForSeconds(0.1f);
			}
			
			if(KeepAliveScript.current_phase == "Phase 1"){

				StartCoroutine(keepAliveScript.setGroupSessionInfo("Phase 2", "1"));
				keepAliveScript.waitforGroupSetSessionInfo = false;
				while(!keepAliveScript.waitforGroupSetSessionInfo)
				{
					yield return new WaitForSeconds(0.1f);
				}
				Application.LoadLevel(0);
			}
			
			else if(KeepAliveScript.current_phase  == "Phase 2"){
				StartCoroutine(keepAliveScript.setGroupSessionInfo("Completed", "1"));
				keepAliveScript.waitforGroupSetSessionInfo = false;
				while(!keepAliveScript.waitforGroupSetSessionInfo)
				{
					yield return new WaitForSeconds(9.1f);
				}
				Application.LoadLevel(0);
			
			}	
		}
		builtGUIList = true;
	}
	
	private IEnumerator load_image_preview(string _path)
	{
	    WWW www = new WWW(_path);
	    yield return www;
	    Texture2D texTmp = new Texture2D(5, 5, TextureFormat.RGB24, false);
	 
	    www.LoadImageIntoTexture(texTmp);
	    cur_image_loaded = new Texture2D(5, 5, TextureFormat.RGB24, false);
	    cur_image_loaded = texTmp;
	}
	
	/**
	 * Get all questions related to a given Target Picture
	 * @param tp_id - identifier of the Target Picture
	**/
	IEnumerator getQuestionsForTargetPicture(int tp_id){
		questionsArray.Clear ();
		string code = PlayerPrefs.GetString("code");
		Debug.Log ("entered getQuestionsForTargetPicture");
		WWWForm form = new WWWForm();
		form.AddField("tp_id", tp_id);
        form.AddField("code", code);
		//form.AddField("tp_id", "1"); <-- hardcoding for running in Unity..
		WWW getQuestions = new WWW(getQuestionsUrl, form);
		yield return getQuestions;
		if ((!string.IsNullOrEmpty(getQuestions.error)))
        {
            print("Error downloading questions list: " + getQuestions.error);
        }
		else{
			var returnedString = getQuestions.data;
			Debug.Log ("returned: "+returnedString);
			string[] values =returnedString.Split('&');
			for(int i=0;i<values.Length-1;i++)
			{
				ArrayList questionsInnerArray = new ArrayList();
				var value = values[i];
				string[] innerValues = value.Split('|');
					if(innerValues.Length == 10){
					string q_id = innerValues[0];
					string question = innerValues[1];
					string solution = innerValues[2];
					string sessions_session_id= innerValues[3];
					string groups_grp_id = innerValues[4];
					string target_pictures_tp_id = innerValues[5];
					string grp_name = innerValues[6];
									
					string alternative1 = innerValues[7];
					string alternative2 = innerValues[8];
					string alternative3 = innerValues[9];
					questionsInnerArray.Add(q_id); questionsInnerArray.Add(question);questionsInnerArray.Add(solution);
					questionsInnerArray.Add(sessions_session_id); questionsInnerArray.Add(groups_grp_id); questionsInnerArray.Add(target_pictures_tp_id); questionsInnerArray.Add (grp_name);
					questionsInnerArray.Add (alternative1);questionsInnerArray.Add(alternative2); questionsInnerArray.Add(alternative3);
					string localGroup = PlayerPrefs.GetString("group");//Skip questions that the local group created
					if(!grp_name.Equals(localGroup)){
						questionsArray.Add(questionsInnerArray);
					}		
				}
			}
			Debug.Log("list size: "+questionsArray.Count);
		}
	}
	
	// Update is called once per frame
	void Update () 
	{
		
		if (Application.platform == RuntimePlatform.Android)

        {
            if (Input.GetKey(KeyCode.Escape))

            {
				printList = "";
				Application.LoadLevel(0);
            }
		}
	
	}
}