package com.sysnik.selenium.fw.helper;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.sysnik.selenium.fw.testBase.TestBase;

public class JSonHelper extends TestBase {
    JSONParser parser = new JSONParser();
    
    public JSONArray getDataFileAsArray(String dataFileName, String name) {
        
        JSONArray companyList = null;
        Object obj = null;
        try {
            obj = loadJson(dataFileName);
            
            // A JSON object. Key value pairs are unordered. JSONObject supports java.util.Map interface.
            JSONObject jsonObject = (JSONObject) obj;
            
            // A JSON array. JSONObject supports java.util.List interface.
            companyList = (JSONArray) jsonObject.get(name);
            
            // An iterator over a collection. Iterator takes the place of Enumeration in the Java Collections Framework.
            // Iterators differ from enumerations in two ways:
            // 1. Iterators allow the caller to remove elements from the underlying collection during the iteration with well-defined semantics.
            // 2. Method names have been improved.
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return companyList;
    }
    
    public Object loadJson(String jsonName) {
        JSONObject obj = null;
        try {
            obj = (JSONObject) parser.parse(new FileReader("src/main/resources/JSON/" + jsonName + ".json"));
        } catch (FileNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (ParseException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return obj;
    }
}