package com.disposable.utils;

import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

public class JsonChanger {
	public static JSONArray jsonarray(List<Map<String,Object>> List) {
		JSONArray jsonArray = new JSONArray();

		
		 JSONArray json_arr=new JSONArray();
		    for (Map<String, Object> map : List) {
		        JSONObject json_obj=new JSONObject();
		        for (Map.Entry<String, Object> entry : map.entrySet()) {
		            String key = entry.getKey();
		            Object value = entry.getValue();
		            try {
		                json_obj.put(key,value);
		            } catch (Exception e) {
		                // TODO Auto-generated catch block
		                e.printStackTrace();
		            }                           
		        }
		        json_arr.add(json_obj);
		    }
	 return json_arr;
	}
}
