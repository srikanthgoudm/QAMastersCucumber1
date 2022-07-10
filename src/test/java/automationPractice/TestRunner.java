package automationPractice;

import io.cucumber.junit.Cucumber;
import io.cucumber.junit.CucumberOptions;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)
@CucumberOptions(features = "src/test/features/",
tags = "@login2",
plugin = {"html:target/TestReports"})
public class TestRunner {

}
