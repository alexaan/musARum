﻿using UnityEngine;
using System.Collections;
/// <summary>
/// This class contains functions for getting and setting values
/// related to user group session info. Functions are called from several 
/// other scripts.
/// </summary>
public class KeepAliveScript : MonoBehaviour {
	
	public bool post = false; 
	public bool waitforGroupSetSessionInfo = false;
	
	public static string current_phase;
	public static string current_image_id;
	
	string getGroupSessionInfoUrl = "http://129.241.103.145/getGroupSessionInfo.php";
	string setGroupSessionInfoUrl = "http://129.241.103.145/setGroupSessionInfo.php";
	
	
	void Awake() 
	{
        DontDestroyOnLoad(transform.gameObject);
    }
	
	public IEnumerator getGroupSessionInfo ()
	{
		string group = PlayerPrefs.GetString("group");
        string code = PlayerPrefs.GetString("code");
        WWWForm form = new WWWForm();
        form.AddField("code", code);
        form.AddField("grp_name", group);
		WWW download = new WWW(getGroupSessionInfoUrl, form);
		yield return download;
        Debug.Log(download.text);
        if ((!string.IsNullOrEmpty(download.error)))
        {
            Debug.Log(download.text);
            print("Error downloading: " + download.error);
        }
		else
		{
			if(download.text == "error: data missing") { }
			if(download.text == "error: no such session"){}
			if(download.text == "error: failed to find group info"){}
			else
			{
				var returnedString = download.data;
			 	string[] values =returnedString.Split('|');	
				current_phase = values[0];
				current_image_id = values[1];
			}
		}
		post = true;
		download.Dispose();
	}
	
	public IEnumerator setGroupSessionInfo	(string setPhaseString, string setCurrImgString)	
	{
		string group = PlayerPrefs.GetString("group");
        string code = PlayerPrefs.GetString("code");
        WWWForm form = new WWWForm();
        form.AddField("code", code);
        form.AddField("grp_name", group);
		form.AddField("current_phase", setPhaseString);
		form.AddField("current_image_id", setCurrImgString);
        WWW download = new WWW(setGroupSessionInfoUrl, form);
        yield return download;
		Debug.Log(download.text);
        if ((!string.IsNullOrEmpty(download.error)))
        {
            Debug.Log(download.text);
            print("Error downloading: " + download.error);
        }
        else
		{

			if(download.text == "error: no such session"){}
			if(download.text == "error: failed to find group info"){}
			else{} 
		}
		download.Dispose();	
		waitforGroupSetSessionInfo = true;
	}
}
