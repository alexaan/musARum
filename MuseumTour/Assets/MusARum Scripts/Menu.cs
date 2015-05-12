﻿using UnityEngine;
using System.Collections;
using System;

/// <summary>
/// This class is used to draw the applications main menu, 
/// and to handle events triggered when interacting with 
/// its elements. 
/// </summary>
public class Menu : MonoBehaviour 
{
	
	string sessioncode = "";
	string groupname = "";
    string url = "http://129.241.103.145/sendMessage.php";
	private static long toastTimestamp = 0;
	private static string toastMessage = "";
	private bool showToast = false;
	public bool session1Enabled;
	public bool session2Enabled;
	public GUISkin customskin;
	public Texture logoTexture;
	
	string phase2ButtonLabel = "Phase 2";
	bool transitionHandlerIsDone = false;
	
	GameObject keepAlive;
	KeepAliveScript keepAliveScript;
	
	
	
	void OnGUI () {
		
		float w = 0.3f; // proportional width (0..1)
  		float h = 0.05f; // proportional height (0..1)
		GUI.skin = customskin;
		var border = new RectOffset(0, 0, 0, 0);
		
		GUI.skin.button.fontSize = Screen.height / 30;
		GUI.skin.label.fontSize = Screen.height / 40;
		GUI.skin.textField.fontSize = Screen.height / 40;
		GUI.skin.textArea.fontSize = Screen.height / 40;
		
		var LogoRect = new Rect();
  		LogoRect.x = (Screen.width*(1-w))/2;
  		LogoRect.y = (Screen.height / 8);
  		LogoRect.width = Screen.width*w;
  		LogoRect.height = Screen.height*(h);
		
		var Label1Rect = new Rect();
  		Label1Rect.x = (Screen.width*(1-w))/2;
  		Label1Rect.y = (Screen.height / 3);
  		Label1Rect.width = Screen.width*w;
  		Label1Rect.height = Screen.height*(h);
		
  		var TextRect = new Rect();
  		TextRect.width = Screen.width*w;
  		TextRect.height = Screen.height*(h);
		TextRect.x = (Screen.width*(1-w))/2;
  		TextRect.y = Label1Rect.y + 30 + TextRect.height;
		
		var Label2Rect = new Rect();
  		Label2Rect.width = Screen.width*w*2;
  		Label2Rect.height = Screen.height*(h);
		Label2Rect.x = (Screen.width/2) -Label2Rect.width/2;
  		Label2Rect.y = TextRect.y + 30 + Label2Rect.height;
		
		var Text2Rect = new Rect();
  		Text2Rect.width = Screen.width*w;
  		Text2Rect.height = Screen.height*(h);
  		Text2Rect.x = (Screen.width*(1-w))/2;
  		Text2Rect.y = Label2Rect.y + 30 + Text2Rect.height;
		
		var Button1Rect = new Rect();
  		Button1Rect.width = Screen.width*w;
  		Button1Rect.height = Screen.height*h;
  		Button1Rect.x = (Screen.width*(1-w))/2;
  		Button1Rect.y = Text2Rect.y + 50 + Button1Rect.height;
		
		var Button2Rect = new Rect();
  		Button2Rect.width = Screen.width*w;
  		Button2Rect.height = Screen.height*h;
  		Button2Rect.x = (Screen.width*(1-w))/2;
  		Button2Rect.y = Button1Rect.y + 30 + Button2Rect.height;
		
		var PhaseInfoRect = new Rect();
  		PhaseInfoRect.x = (Screen.width*(1-w))/2;
  		PhaseInfoRect.y = TextRect.y - 150;
  		PhaseInfoRect.width = Screen.width*w;
  		PhaseInfoRect.height = Screen.height*(h);
		
		GUI.Box(new Rect(10,10,Screen.width-20, Screen.height-20), "");
		GUI.skin.box.fontSize = Screen.height / 30;
		
		GUI.Label(Label1Rect, "Enter code");
		GUI.Label(Label2Rect, "Enter group name");
		
		sessioncode = GUI.TextField(TextRect, sessioncode);
		groupname = GUI.TextField(Text2Rect, groupname);
		GUI.skin.textField.fontSize = Screen.height / 60;
	
		//if the button to enter phase 1 is pressed: 
		if(GUI.Button(Button1Rect, "Phase 1"))
		{			
			if((0 < groupname.Length) && (groupname.Length < 60) && (0 < sessioncode.Length) && (sessioncode.Length < 30))
			{
				PlayerPrefs.SetString("group", groupname);
	            PlayerPrefs.SetString("code", sessioncode);
				transitionHandlerIsDone = false;
				StartCoroutine(handlePhaseTransition(1));
			}
			else
			{
				if(groupname.Length == 0) toastMessage = "Please enter a name for your group!";
				if(groupname.Length > 60) toastMessage = "Please enter a shorter groupname!";
				if(sessioncode.Length == 0) toastMessage = "Please enter the session code!";
				if(sessioncode.Length > 30) toastMessage = "Wrong session code!";
				showToast = true;
				
				toastTimestamp = Environment.TickCount;
			}
		}
        
		//if the button to enter phase 2 is pressed: 
		if (GUI.Button(Button2Rect, phase2ButtonLabel)){
			if(session2Enabled){
					if((0 < groupname.Length) && (groupname.Length < 60) && (0 < sessioncode.Length) && (sessioncode.Length < 30))
					{
						PlayerPrefs.SetString("group", groupname);
	            		PlayerPrefs.SetString("code", sessioncode);
						StartCoroutine(handlePhaseTransition(2));

					}
					else
					{
					if(groupname.Length == 0) toastMessage = "Please enter a name for your group!";
					if(groupname.Length > 60) toastMessage = "Please enter a shorter groupname!";
					if(sessioncode.Length == 0) toastMessage = "Please enter the session code!";
					if(sessioncode.Length > 30) toastMessage = "Wrong session code!";
					showToast = true;
					
					toastTimestamp = Environment.TickCount;
				}
			}
			else{
				toastMessage = "Session 2 is disabled";
				showToast = true;
				toastTimestamp = Environment.TickCount;
			}
		}
		
		GUI.DrawTexture(LogoRect, logoTexture, ScaleMode.ScaleToFit, true);
		
		//Show error messages: 
		if(showToast == true)
		{
			Color col = new Color(1,1,1,1.0f);
			var background = new GUIStyle(GUI.skin.box);
			background.normal.background = MakeTex(2, 2, new Color( 0f, 0f, 0f, 0.7f ));
			background.normal.textColor = col;
			background.fontSize = Screen.height / 40;
			GUI.Box(new Rect((Screen.width/3)-(Screen.width/6), Screen.height/8, Screen.width/1.5f, Screen.height/4), "", background);
			GUI.enabled = false;
			GUI.TextArea(new Rect((Screen.width/3)-(Screen.width/6), Screen.height/8, Screen.width/1.5f, Screen.height/4), "Error: "+toastMessage);
			GUI.enabled = true;
		}	
	}
	
	//Handles transitions between phases (phase 1 and phase 2)
	IEnumerator handlePhaseTransition(int phase)
	{
		keepAliveScript.post = false;
		if(phase == 1)
		{
			StartCoroutine(Post()); //runs Db posting.... next scene loaded in update after bool post equals true
			while(!keepAliveScript.post)
			{
				yield return new WaitForSeconds(0.1f);
			}
			StartCoroutine(keepAliveScript.setGroupSessionInfo("Phase 1", "empty"));
		}
		else if(phase == 2)
		{
			StartCoroutine(Post()); //runs Db posting.... next scene loaded in update after bool post equals true
			while(!keepAliveScript.post)
			{
				yield return new WaitForSeconds(0.1f);
			}
			StartCoroutine(keepAliveScript.setGroupSessionInfo("Phase 2", "empty"));
		}
	}
	
	//Used to make 2d textures
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

	// Use this for initialization
	void Start () 
	{
		keepAlive = GameObject.Find("KeepAlive");
		keepAliveScript = (KeepAliveScript) keepAlive.GetComponent(typeof(KeepAliveScript));
		
		session1Enabled = true;
		session2Enabled = true;
		
		
		keepAliveScript.waitforGroupSetSessionInfo = false;
		
		var test = PlayerPrefs.HasKey("phase");
		var enda = PlayerPrefs.GetString("phase");
		
		if(!PlayerPrefs.HasKey("phase"))
		{
			PlayerPrefs.SetString("phase", "Phase 1");
		}
	}
	
	//Sets temp variables when the main menu scene is loaded
	void OnLevelWasLoaded(int level) {
        if (level == 0){
							var storedGroupName = PlayerPrefs.GetString("group");
							var storedSessionCode = PlayerPrefs.GetString("code");
							if(!storedGroupName.Equals(null) && !storedGroupName.Equals(""))
							{
								groupname = storedGroupName;
							}
							if(!storedSessionCode.Equals(null) && !storedSessionCode.Equals(""))
							{
								sessioncode = storedSessionCode;
							}
		}
        
    }
	
	// Update is called once per frame
	void Update () 
	{
        if (keepAliveScript.post && keepAliveScript.waitforGroupSetSessionInfo)
        {  
			Application.LoadLevel(1);
        }
	
	}
	
	//Post group information to the database. 
	//Used to create new groups, or log in as an exisiting group
    IEnumerator Post()
    {
        string group = PlayerPrefs.GetString("group");
        string code = PlayerPrefs.GetString("code");
        WWWForm form = new WWWForm();
        form.AddField("code", code);
        form.AddField("grp_name", group);
        WWW download = new WWW(url, form);
        yield return download;
        Debug.Log(download.text);
        if ((!string.IsNullOrEmpty(download.error)))
        {
            Debug.Log(download.text);
            print("Error downloading: " + download.error);
        }
        else
        {
			//check results for errors: 
			if(download.text == "error: no such session"){toastMessage = "Invalid session code!";}
			else if(download.text == "error: data missing"){Debug.Log ("Data missing: "+download.text); toastMessage = "Connection Issues";}
			if(download.text == "error: duplicated group")
			{
				Debug.Log ("Duplicated group: "+download.text);
				keepAliveScript.post = true;
			}
			//no errors found: 
			else if(download.text == "success")
			{
				Debug.Log("Posted successfully to database");
			}
            download.Dispose();
        }
        
		//get updated group session info after having attempted a post
		StartCoroutine(keepAliveScript.getGroupSessionInfo());
    }	
}