package automationPractice;

import io.cucumber.java.After;
import io.cucumber.java.Before;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import io.github.bonigarcia.wdm.WebDriverManager;
import org.junit.Assert;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;

import java.util.concurrent.TimeUnit;

public class StepDefinitions {
    String baseUrl = "http://automationpractice.com/index.php";
    public WebDriver driver;

    @Before
    public void startUp() {
        WebDriverManager.chromedriver().setup();
        driver = new ChromeDriver();
        driver.get(baseUrl);
    }

    @After
    public void TearDwon() {
        driver.quit();
    }

    @Given("^I am on the home page$")
    public void isUserOnHomePage() {
        Assert.assertTrue(driver.findElement(By.cssSelector("#home-page-tabs")).isDisplayed());
    }
    @When("^I select signIn link$")
    public void selectSignInLink() {
        driver.manage().timeouts().implicitlyWait(30, TimeUnit.SECONDS);
        driver.findElement(By.cssSelector(".login")).click();

    }
    @Then("^I should be on Authentication page$")
    public void isUserOnAuthenticationPage() {
        Assert.assertTrue(driver.findElement(By.cssSelector("#create-account_form")).isDisplayed());

    }
    @When("^I provide username as (.*) and password as (.*)$")
    public void enterCredentials(String uname, String pwd) {
        driver.findElement(By.cssSelector("#email")).sendKeys(uname);
        driver.findElement(By.cssSelector("#passwd")).sendKeys(pwd);
    }

    @And("^I select SignIn button$")
    public void selectSignInButton() {
        driver.findElement(By.cssSelector("#SubmitLogin")).click();
    }

    @Then("^I should be loggedIn successfully$")
    public void verifyLogin() {
        driver.getTitle().contains("My account");
    }

    @And("^I should be on My account page$")
    public void isUserOnMyAccountPage() {
        Assert.assertTrue(driver.findElement(By.cssSelector(".myaccount-link-lists")).isDisplayed());
    }

    @And("I should see validation message as (.*)")
    public void verifyMessage(String expectedMessage) {
        String actualMessage = driver.findElement(By.cssSelector("")).getText();
        Assert.assertTrue(actualMessage.contains(expectedMessage));

    }
}
