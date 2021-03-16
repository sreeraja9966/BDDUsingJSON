package com.sysnik.selenium.workspace;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.HashMap;
import java.util.Properties;
import java.util.Set;

import org.testng.annotations.Test;

public class PropertySplitter {
	@Test
	public void test() throws IOException {
		Properties MyPropertyFile = new Properties();
		FileInputStream ip = new FileInputStream(
				"D:\\springautooooo\\Sys-Automation\\src\\main\\resources\\XpathProperties\\data0.properties");
		MyPropertyFile.load(ip);
		HashMap<String, String> map = new HashMap<String, String>();
		Set<Object> keys = MyPropertyFile.keySet();
		for (Object k : keys) {
			String key = (String) k;
			String value = MyPropertyFile.getProperty(key);
			map.put(key, value);
			System.out.println(map.get(key));
		}

	}
}
