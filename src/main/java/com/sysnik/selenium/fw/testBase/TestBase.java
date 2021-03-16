package com.sysnik.selenium.fw.testBase;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.net.InetSocketAddress;
import java.net.Socket;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.ie.InternetExplorerDriver;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.sysnik.selenium.service.AadharMapperService;
import com.sysnik.selenium.service.AccountContactService;
import com.sysnik.selenium.service.AccountService;
import com.sysnik.selenium.service.AddressService;
import com.sysnik.selenium.service.AllLimitMasterService;
import com.sysnik.selenium.service.AuthTempService;
import com.sysnik.selenium.service.BeneficiaryDetailsService;
import com.sysnik.selenium.service.BlackListMasterService;
import com.sysnik.selenium.service.BranchParametersService;
import com.sysnik.selenium.service.CategoryInterestService;
import com.sysnik.selenium.service.ChargesTypeDetailsService;
import com.sysnik.selenium.service.ChargesTypeMasterService;
import com.sysnik.selenium.service.ChequeBookInventoryService;
import com.sysnik.selenium.service.ChequeBookService;
import com.sysnik.selenium.service.ClosedAccountService;
import com.sysnik.selenium.service.CustomerAccountService;
import com.sysnik.selenium.service.CustomerContactService;
import com.sysnik.selenium.service.CustomerDeleteService;
import com.sysnik.selenium.service.CustomerMasterService;
import com.sysnik.selenium.service.DeathMarkingService;
import com.sysnik.selenium.service.DenomMasterService;
import com.sysnik.selenium.service.DepIntRateService;
import com.sysnik.selenium.service.DepositInterestHistoryService;
import com.sysnik.selenium.service.DepositMasterService;
import com.sysnik.selenium.service.DepositRenewalHistoryService;
import com.sysnik.selenium.service.DisbursementScheduleService;
import com.sysnik.selenium.service.DocumentDetailsService;
import com.sysnik.selenium.service.FixedDepositIntDetailsService;
import com.sysnik.selenium.service.FlexiUnitParameterService;
import com.sysnik.selenium.service.FreezeDetailsService;
import com.sysnik.selenium.service.GroupMasterService;
import com.sysnik.selenium.service.INVENTORYBOOKWISELogService;
import com.sysnik.selenium.service.INVENTORYBOOKWISEService;
import com.sysnik.selenium.service.InstrumentTypesService;
import com.sysnik.selenium.service.LOANSETTLEMENTLOGService;
import com.sysnik.selenium.service.LienMarkService;
import com.sysnik.selenium.service.LoanDisbursementService;
import com.sysnik.selenium.service.LoanMasterService;
import com.sysnik.selenium.service.LookupService;
import com.sysnik.selenium.service.ModificationAuditLogService;
import com.sysnik.selenium.service.NomineeMasterService;
import com.sysnik.selenium.service.OTSINTWAIVERLOGService;
import com.sysnik.selenium.service.OrganizationOperatorDetailsService;
import com.sysnik.selenium.service.ProductService;
import com.sysnik.selenium.service.ReconTransactionService;
import com.sysnik.selenium.service.RemitInstrumentService;
import com.sysnik.selenium.service.RemitParameterService;
import com.sysnik.selenium.service.RemitValidationService;
import com.sysnik.selenium.service.RepaymentScheduleService;
import com.sysnik.selenium.service.RepaymentScheduleTempService;
import com.sysnik.selenium.service.RtgsNeftOutwardService;
import com.sysnik.selenium.service.SIMasterService;
import com.sysnik.selenium.service.SpInstructionDetailsService;
import com.sysnik.selenium.service.TdsDeductedDetailsService;
import com.sysnik.selenium.service.TokenMasterService;
import com.sysnik.selenium.service.TransDocumentService;
import com.sysnik.selenium.service.TransactionDenominationService;
import com.sysnik.selenium.service.TransactionHeaderService;
import com.sysnik.selenium.service.TransactionService;
import com.sysnik.selenium.service.TransactionsDetailService;
import com.sysnik.selenium.service.UserWiseDenomService;

public class TestBase {
    public static WebDriver d;
    public String localDir;
    public static Logger log = Logger.getLogger(TestBase.class);
    public static AnnotationConfigApplicationContext appContext = new AnnotationConfigApplicationContext();
    public static Map<String, String> xpathLocatorMap = new HashMap<>();
    public static DateTimeFormatter dateformatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
    public static Map<String, String> excelData = new HashMap<String, String>();
    public static Map<String, String> cacheData = new HashMap<String, String>();
    public static Properties property = new Properties();
    static {
        appContext.scan("com.sysnik.selenium");
        appContext.refresh();
    }
    public static AccountService accountService = (AccountService) appContext.getBean("accountService");
    public static ProductService productService = (ProductService) appContext.getBean("ProductService");
    public static CustomerMasterService customerMasterService = (CustomerMasterService) appContext
            .getBean("customerService");
    public static LookupService lookupService = (LookupService) appContext.getBean("LookupService");
    public static BranchParametersService branchParametersService = (BranchParametersService) appContext
            .getBean("BranchParametersService");
    public static ChequeBookService chequeBookService = (ChequeBookService) appContext.getBean("ChequeBookService");
    public static SIMasterService sIMasterService = (SIMasterService) appContext.getBean("SIMasterService");
    public static NomineeMasterService nomineeMasterService = (NomineeMasterService) appContext
            .getBean("NomineeMasterService");
    public static FreezeDetailsService freezeDetailsService = (FreezeDetailsService) appContext
            .getBean("FreezeDetailsService");
    public static DepositMasterService depositMasterService = (DepositMasterService) appContext
            .getBean("depositMasterService");
    public static CustomerAccountService customerAccountService = (CustomerAccountService) appContext
            .getBean("customerAccountService");
    
    public static CategoryInterestService categoryInterestService = (CategoryInterestService) appContext
            .getBean("CategoryInterestService");
    public static DepIntRateService depIntRateService = (DepIntRateService) appContext.getBean("DepIntRateService");
    public static FixedDepositIntDetailsService fixedDepositIntDetailsService = (FixedDepositIntDetailsService) appContext
            .getBean("FixedDepositIntDetailsService");
    public static DenomMasterService denomMasterService = (DenomMasterService) appContext.getBean("DenomMasterService");
    public static UserWiseDenomService userWiseDenomService = (UserWiseDenomService) appContext
            .getBean("UserWiseDenomService");
    public static TransactionHeaderService transactionHeaderService = (TransactionHeaderService) appContext
            .getBean("TransactionHeaderService");
    public static TransactionsDetailService transactionsDetailService = (TransactionsDetailService) appContext
            .getBean("TransactionsDetailService");
    public static TransactionService transactionService = (TransactionService) appContext.getBean("TransactionService");
    public static TransactionDenominationService transactionDenominationService = (TransactionDenominationService) appContext
            .getBean("TransactionDenominationService");
    public static AllLimitMasterService allLimitMasterService = (AllLimitMasterService) appContext
            .getBean("AllLimitMasterService");
    public static TokenMasterService tokenMasterService = (TokenMasterService) appContext.getBean("TokenMasterService");
    
    public static CustomerDeleteService customerDeleteService = (CustomerDeleteService) appContext
            .getBean("CustomerDeleteService");
    
    public static BlackListMasterService blackListMasterService = (BlackListMasterService) appContext
            .getBean("BlackListMasterService");
    
    public static SpInstructionDetailsService spInstructionDetailsService = (SpInstructionDetailsService) appContext
            .getBean("SpInstructionDetailsService");
    public static LoanMasterService loanMasterService = (LoanMasterService) appContext.getBean("LoanMasterService");
    
    public static ModificationAuditLogService modificationAuditLogService = (ModificationAuditLogService) appContext
            .getBean("ModificationAuditLogService");
    
    public static AuthTempService authTempService = (AuthTempService) appContext.getBean("AuthTempService");
    
    public static AddressService addressService = (AddressService) appContext.getBean("AddressService");
    
    public static CustomerContactService customerContactService = (CustomerContactService) appContext
            .getBean("CustomerContactService");
    
    public static OrganizationOperatorDetailsService organizationOperatorDetailsService = (OrganizationOperatorDetailsService) appContext
            .getBean("OrganizationOperatorDetailsService");
    
    public static DocumentDetailsService documentDetailsService = (DocumentDetailsService) appContext
            .getBean("DocumentDetailsService");
    
    public static DeathMarkingService deathMarkingService = (DeathMarkingService) appContext
            .getBean("DeathMarkingService");
    
    public static DisbursementScheduleService disbursementScheduleService = (DisbursementScheduleService) appContext
            .getBean("DisbursementScheduleService");
    
    public static LoanDisbursementService loanDisbursementService = (LoanDisbursementService) appContext
            .getBean("LoanDisbursementService");
    
    public static RepaymentScheduleService repaymentScheduleService = (RepaymentScheduleService) appContext
            .getBean("RepaymentScheduleService");
    
    public static RepaymentScheduleTempService repaymentScheduleTempService = (RepaymentScheduleTempService) appContext
            .getBean("RepaymentScheduleTempService");
    public static INVENTORYBOOKWISEService iNVENTORYBOOKWISEService = (INVENTORYBOOKWISEService) appContext
            .getBean("INVENTORYBOOKWISEService");
    public static INVENTORYBOOKWISELogService iNVENTORYBOOKWISELogService = (INVENTORYBOOKWISELogService) appContext
            .getBean("INVENTORYBOOKWISELogService");
    public static LOANSETTLEMENTLOGService lOANSETTLEMENTLOGService = (LOANSETTLEMENTLOGService) appContext
            .getBean("LOANSETTLEMENTLOGService");
    public static OTSINTWAIVERLOGService oTSINTWAIVERLOGService = (OTSINTWAIVERLOGService) appContext
            .getBean("OTSINTWAIVERLOGService");
    
    public static TransDocumentService transDocumentService = (TransDocumentService) appContext
            .getBean("TransDocumentService");
    public static ReconTransactionService reconTransactionService = (ReconTransactionService) appContext
            .getBean("ReconTransactionService");
    public static GroupMasterService groupMasterService = (GroupMasterService) appContext.getBean("GroupMasterService");
    
    public static RemitInstrumentService remitInstrumentService = (RemitInstrumentService) appContext
            .getBean("RemitInstrumentService");
    
    public static RemitParameterService remitParameterService = (RemitParameterService) appContext
            .getBean("RemitParameterService");
    
    public static InstrumentTypesService instrumentTypesService = (InstrumentTypesService) appContext
            .getBean("InstrumentTypesService");
    
    public static RemitValidationService remitValidationService = (RemitValidationService) appContext
            .getBean("RemitValidationService");
    
    public static ChargesTypeDetailsService chargesTypeDetailsService = (ChargesTypeDetailsService) appContext
            .getBean("ChargesTypeDetailsService");
    
    public static ChargesTypeMasterService chargesTypeMasterService = (ChargesTypeMasterService) appContext
            .getBean("ChargesTypeMasterService");
    
    public static FlexiUnitParameterService flexiUnitParameterService = (FlexiUnitParameterService) appContext
            .getBean("FlexiUnitParameterService");
    
    public static AccountContactService accountContactService = (AccountContactService) appContext
            .getBean("AccountContactService");
    
    public static AadharMapperService aadharMapperService = (AadharMapperService) appContext
            .getBean("AadharMapperService");
    
    public static DepositInterestHistoryService depositInterestHistoryService = (DepositInterestHistoryService) appContext
            .getBean("DepositInterestHistoryService");
    public static ClosedAccountService closedAccountService = (ClosedAccountService) appContext
            .getBean("ClosedAccountService");
    public static LienMarkService lienMarkService = (LienMarkService) appContext.getBean("LienMarkService");
    public static TdsDeductedDetailsService tdsDeductedDetailsService = (TdsDeductedDetailsService) appContext
            .getBean("TdsDeductedDetailsService");
    
    public static ChequeBookInventoryService chequeBookInventoryService = (ChequeBookInventoryService) appContext
            .getBean("ChequeBookInventoryService");
    
    public static RtgsNeftOutwardService rtgsNeftOutwardService = (RtgsNeftOutwardService) appContext
            .getBean("RtgsNeftOutwardService");
    public static BeneficiaryDetailsService beneficiaryDetailsService = (BeneficiaryDetailsService) appContext
            .getBean("BeneficiaryDetailsService");
    public static DepositRenewalHistoryService depositRenewalHistoryService = (DepositRenewalHistoryService) appContext
            .getBean("DepositRenewalHistoryService");
    
    public WebDriver strartBrowser(String browser) {
        readPropertyFile();
        PropertyConfigurator.configure(relativePath() + "\\src\\main\\resources\\Log4j.properties");
        log.info("-------> browser called");
        if (browser.equals("firefox")) {
            System.setProperty("webdriver.gecko.driver",
                    relativePath() + "\\src\\main\\resources\\Drivers\\geckodriver.exe");
            // - Chrome.lnk
            d = new FirefoxDriver();
            log.info(browser + "---->Browser started");
            return d;
        } else if (browser.equalsIgnoreCase("chrome")) {
            System.setProperty("webdriver.chrome.driver",
                    relativePath() + "\\src\\main\\resources\\Drivers\\chromedriver.exe");
            ChromeOptions options = new ChromeOptions();
            /*
             * String userProfile="C:\\Users\\sriraja.garlapati\\AppData\\Local\\Google\\Chrome\\User Data";
             * options.addArguments("port=8080"); options.addArguments("user-data-dir="+userProfile);
             * options.addArguments("profile-directory=Profile 2");
             */
            // add parameter which will disable the extension
            options.addArguments("--disable-extensions");
            
            // Start the chrome session
            d = new ChromeDriver(options);
           ChromeDriver di = new ChromeDriver(options);
            d.manage().window().maximize();
            log.info(browser + "---->Browser started");
            return d;
        } else if (browser.equalsIgnoreCase("ie")) {
            try {
                System.setProperty("webdriver.ie.driver",
                        relativePath() + "\\src\\main\\resources\\Drivers\\IEDriverServer.exe");
                d = new InternetExplorerDriver();
                log.info(browser + "---->Browser started");
                return d;
            } catch (Exception e) {
                log.error(e);
            }
            
        } else {
            
            log.info("browser not matched");
        }
        return null;
    }
    
    public String relativePath() {
        localDir = System.getProperty("user.dir");
        return localDir;
    }
    
    public String getSystemIP() {
        /*
         * String IP = null; try { IP =Inet4Address.getLocalHost().getHostAddress();
         * log.info("IP as per getSystem Method is "+IP); return IP; } catch (UnknownHostException e) { // TODO
         * Auto-generated catch block e.printStackTrace(); } return IP;
         */
        Socket socket = new Socket();
        try {
            socket.connect(new InetSocketAddress("google.com", 80));
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        log.info("SYSTEM IP returned by getIP method is " + socket.getLocalAddress() + "");
        String IP = socket.getLocalAddress() + "";
        if (IP.contains("/")) {
            IP = IP.replace("/", "");
            
        }
        return (IP);
        
    }
    
    public void readPropertyFile() {
        FileReader reader = null;
        try {
            reader = new FileReader(relativePath() + "\\src\\main\\resources\\CommonApplicationValues.properties");
        } catch (FileNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        
        try {
            property.load(reader);
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
}
