package com.sysnik.selenium.fw.helper;

import java.awt.AWTException;
import java.awt.Robot;
import java.awt.Toolkit;
import java.awt.datatransfer.StringSelection;
import java.awt.event.KeyEvent;

import org.apache.log4j.Logger;

import com.sysnik.factory.AutomationObjectFactory;
import com.sysnik.selenium.fw.testBase.TestBase;

public class RobotHelper extends TestBase {
    Robot robot;
    private static final Logger log = Logger.getLogger(RobotHelper.class);
    BrowserHelper browserHelper = AutomationObjectFactory.getBrowserHelperInstance();
    ReportHelper reportHelper = AutomationObjectFactory.getReportHelperInstance();
    
    public void fileUploadUsingRobot(String filePath) {
        try {
            robot = new Robot();
            StringSelection ss = new StringSelection(filePath);
            Toolkit.getDefaultToolkit().getSystemClipboard().setContents(ss, null);
            robot.delay(3000);
            
            robot.keyPress(KeyEvent.VK_CONTROL);
            robot.keyPress(KeyEvent.VK_V);
            
            robot.keyRelease(KeyEvent.VK_V);
            robot.keyRelease(KeyEvent.VK_CONTROL);
            robot.delay(3000);
            robot.keyPress(KeyEvent.VK_ENTER);
            robot.keyRelease(KeyEvent.VK_ENTER);
            robot.delay(3000);
            browserHelper.switchToParentWindow();
            reportHelper.writeLogInfoInChildTest("File uploaded");
            
        } catch (Exception e) {
            log.error(e);
        }
    }
    
    public void pressTab() {
        try {
            robot = new Robot();
            robot.delay(10000);
            robot.keyPress(KeyEvent.VK_TAB);
            robot.delay(1000);
            robot.keyRelease(KeyEvent.VK_TAB);
        } catch (AWTException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        
    }
    
    public void pressDownArrow() {
        try {
            robot = new Robot();
            robot.keyPress(KeyEvent.VK_KP_DOWN);
            robot.delay(1000);
        } catch (AWTException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        
        //robot.keyRelease(KeyEvent.VK_KP_DOWN);
    }
    
    public void pressEnter() {
        try {
            robot = new Robot();
            robot.keyPress(KeyEvent.VK_ENTER);
            robot.keyRelease(KeyEvent.VK_ENTER);
        } catch (AWTException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        
        //robot.keyRelease(KeyEvent.VK_KP_DOWN);
    }
    
    public void pressUpArrow() {
        
        robot.keyPress(KeyEvent.VK_KP_UP);
        robot.delay(1000);
        //robot.keyRelease(KeyEvent.VK_KP_UP);
    }
    
    public void enterStringUsingKeyBoard(String keyBoard) {
        for (char c : keyBoard.toCharArray()) {
            int keyCode = KeyEvent.getExtendedKeyCodeForChar(c);
            if (KeyEvent.CHAR_UNDEFINED == keyCode) {
                throw new RuntimeException("Key code not found for character '" + c + "'");
            }
            robot.keyPress(keyCode);
            robot.delay(100);
            robot.keyRelease(keyCode);
            robot.delay(100);
            
        }
    }
    
    public void pressEsc() {
        try {
            robot = new Robot();
        } catch (AWTException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        robot.keyPress(KeyEvent.VK_ESCAPE);
    }
}
