package com.sysnik.selenium.fw.helper;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

import org.openqa.selenium.By;

import com.sysnik.selenium.fw.testBase.TestBase;

public class ConvertPropertyFileToMap extends TestBase {

	public void convertToMap(Map<String, String> xpathLocatorMap ) {
		Properties MyPropertyFile = new Properties();
		List<String> name=new ArrayList<String>();
		File folder = new File(relativePath()+"\\src\\main\\resources\\XpathProperties");
		File[] listOfFiles = folder.listFiles();

		for (File file : listOfFiles) {
		    if (file.isFile()) {
		        name.add(file+"");
		    }
		}
for(String a:name) {
		try {
			FileInputStream ip = new FileInputStream(a);
			MyPropertyFile.load(ip);
		} catch (IOException e) {

			e.printStackTrace();
		}
		
		Set<Object> keys = MyPropertyFile.keySet();
		String key = null;
		String value = null;
		By convertedValue=null;
		
		for (Object k : keys) {
			key = (String) k;
			value = MyPropertyFile.getProperty(key);
			
			 
			xpathLocatorMap.put(key, value);

		}
		
	}
	}

	public String getPropertyFromMap(String keyTogetProperty,Map<String,String> map) {
		
		if(keyTogetProperty.contains("//")) {
			return keyTogetProperty;
		}
		else {
			
			return map.get(keyTogetProperty);
		}
		

	}
}
