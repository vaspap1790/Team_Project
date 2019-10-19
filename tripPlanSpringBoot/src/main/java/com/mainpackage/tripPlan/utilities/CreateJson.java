
package com.mainpackage.tripPlan.utilities;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Component;

@Component
public class CreateJson {
    
    
    public JSONObject createJson(String jsonString) throws ParseException{
        
        JSONParser jsonParser = new JSONParser();
        JSONObject json = (JSONObject) jsonParser.parse(jsonString);
        return json;
    }
    
    public JSONArray createJsonArray(String jsonString) throws ParseException{
        
        JSONParser jsonParser = new JSONParser();
        JSONArray json = (JSONArray) jsonParser.parse(jsonString);

        return json;
    }
}
