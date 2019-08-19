require "templates/blueGreen/template.rb"
require "templates/blueGreen/apiTemplate.rb"
require "helpers/readExcel.rb"
require "suites/suites.rb"
require "methods/apis.rb"
require 'mail'

def setup_ui_skeleton()
  cleanUpLastRunFilesAndFolders()
  writeTestResultHtmlHeader()
  loginReadExcel()
  envReadExcel()
  readBrowserAndLaunch()
  xt_uiTearDown() 
  xt_emailResults()  
end

def setup_api_skeleton()
  cleanUpLastApiRunFilesAndFolders()
  writeApiTestResultHtmlHeader()
  apiEnvReadExcel()  
  apiIterator()
  xt_apiTearDown()
  api_emailResults()
end 

def xt_uiTearDown() 
  writeSummaryAndOverview()
  writeTestResultHtmlFooter()  
end

def xt_apiTearDown() 
  writeApiSummaryAndOverview()
  writeApiTestResultHtmlFooter() 
end

def xt_apiAssertion()
  $totalTests += 1   
  if ($apiResponse.code == 200) && ($apiResponseObject == 0)
     puts "#{$apiName} - passed. Response code:#{$apiResponse.code} ResponseObjectNum:#{$apiResponseObject}"
     $testStatus = 'Passed'
     $totalPassed += 1  
  else  
    puts "#{$apiName} - failed. Response code:#{$apiResponse.code} ResponseObjectNum:#{$apiResponseObject}"
     $totalFailed += 1  
     $failureName = $failureName + $apiName
     $testStatus = 'Failed'
  end
  writeApiTestResults()
end


def xt_assertion(assertions, testsName, elements, attributes, attributesValues)
  $totalTests += 1   
  assertion = assertions
  testName = testsName
  element = elements
  attribute = attributes
  $attribute_value = attributesValues
  if Watir::Wait.until { $browser.element(:"#{attribute}", $attribute_value).text.include? assertion }
  #if $browser.element(:"#{attribute}", $attribute_value).when_present.text.include? assertion
     $testStatus = 'Passed'
     $totalPassed += 1  
     puts testName + ' - Passed' 
  else  
     $totalFailed += 1  
     $failureName = $failureName + testName
     $testStatus = 'Failed'
     puts testName + ' - Failed'
  end
  writeTestResults(testName, assertion)
end

def xt_assertElementExists(testName,assertion)
   testName = testName
   assertion = assertion
   $totalTests += 1   
   if Watir::Wait.until { $browser.html.include? assertion }
     $testStatus = 'Passed'
     $totalPassed += 1  
     puts testName + ' - Passed'
     writeTestResults(testName, assertion)
  else  
     $totalFailed += 1 
     $failureName = $failureName + testName
     $testStatus = 'Failed'
     puts testName + ' - Failed'
     writeTestResults(testName, assertion)
  end
end

def xt_assertElementDoesntExists(testName,assertion)
   testName = testName
   assertion = assertion
   sleep 2
   $totalTests += 1   
   if !$browser.html.include? assertion
     $testStatus = 'Passed'
     $totalPassed += 1  
     puts testName + ' - Passed'
     writeTestResults(testName, assertion)
  else  
     $totalFailed += 1  
     $failureName = $failureName + testName
     $testStatus = 'Failed'
     puts testName + ' - Failed'
     writeTestResults(testName, assertion)
  end
end

def xt_assertion_DB(a, n, q)
  $totalTests += 1   
  assertion = a
  testName = n
  query = q
  sql = "#{query}"
  client = TinyTds::Client.new(:username => 'Tesla_User', :password => 'T3$1@_U$3r', :dataserver => "Tesladb.xypro.com", :database => "XYGATE_Dev", :port => 1433)
  result = client.execute(sql)
  result.each do |row|
  puts result.fields
end
  if result == assertion
     $testStatus = 'Passed'
     $totalPassed += 1  
     puts testName + ' - Passed' 
  else  
     $totalFailed += 1  
     $failureName = $failureName + testName
     $testStatus = 'Failed'
     puts testName + ' - Failed'
  end
  writeTestResults(testName, assertion)
end

def xt_assertPassed(testName, assertion)
   testName = testName
   assertion = assertion
   sleep 2
   $totalTests += 1   
   $testStatus = 'Passed'
   $totalPassed += 1  
   puts testName + ' - Passed'
   writeTestResults(testName, assertion)
end

def xt_assertFailed(testName, assertion)
   testName = testName
   assertion = assertion
   sleep 2
   $totalTests += 1    
   $totalFailed += 1  
   $failureName = $failureName + testName
   $testStatus = 'Failed'
   puts testName + ' - Failed'
   writeTestResults(testName, assertion)
end

def xt_assertion_text_secondBrowser(testName,assertion)
   testName = testName
   assertion = assertion
   $totalTests += 1   
   if $browser2.html.include? assertion
     $testStatus = 'Passed'
     $totalPassed += 1  
     puts testName + ' - Passed'
     writeTestResults(testName, assertion)
  else  
     $totalFailed += 1  
     $testStatus = 'Failed'
     puts testName + ' - Failed'
     writeTestResults(testName, assertion)
  end
end

def xt_increment_failed(testName)
  testName = testName
  $totalTests += 1
  $failureName = $failureName + testName
  $totalFailed += 1  
  $testStatus = 'Failed'
  puts testName + ' - Failed block'
  writeTestResults(testName, $testStatus)
end

def api_increment_failed()
  puts "#{$apiName} failed with a response code:#{$apiResponse.code}"  
  $totalTests += 1
  $failureName = $failureName + $apiName
  $totalFailed += 1  
  $testStatus = 'Failed'
  writeApiTestResults()
end

def xt_logout_secondBrowser()
  $browser2.span(:id, 'userAccountName').when_present.click
  $browser2.link(:text, 'Sign Out').when_present.click
  $browser2.wait()
  xt_text_assertion_second_browser('Logout from Second Browser',"Login")
end

def set_browser_os()
    browsers = Array['chrome']
    $os = 'Mac'
    if (RUBY_PLATFORM =~ /w32/) # windows
     $os = 'Windows'
     browsers = Array['chrome']
    elsif (RUBY_PLATFORM =~ /darwin/) # mac
     $os = 'Mac'
     browsers = Array['chrome','safari']
    end
end

def cleanUpLastRunFilesAndFolders()
  $htmlFile = "Results: #{Time.now}.htm"
  # .......................................................Reset test totals   
  $totalTests = 0
  $totalPassed = 0
  $totalFailed = 0
  $failureName = ''
  $screenCaptureImageFileName = ''
  # #Delete last run test results files
  # File.delete("output/TestResults.htm") if File::exists?("output/testResults.htm")
  # #Delete last run screenshots folder
  # if File::exists?("output/screenshots")
    # if Dir["output/screenshots/*"] != nil
      # FileUtils.rm_rf Dir.glob("output/screenshots/*")
    # end
  # end
  # Dir.delete("output/screenshots") if File::exists?("output/screenshots")
  #Re-create the screenshots folder
  Dir.mkdir("output/#{Time.now}") if !File::exists?("output/#{Time.now}")
end

def cleanUpLastApiRunFilesAndFolders()
  # .......................................................Reset test totals   
  $totalTests = 0
  $totalPassed = 0
  $totalFailed = 0
  $failureName = ''
  $screenCaptureImageFileName = ''
  # #Delete last run test results files
  # File.delete("output/api_TestResults.htm") if File::exists?("output/api_TestResults.htm")
end

def xt_ScreenCapture(assertionName)
  if ($app == 'Tesla' || ($app == 'Tesla' && $browserName == 'chrome'))
    $screenCaptureImageFileName = ($os || "") + '-' + ($app || "") + '-' + ($browserName || "") + '-' + assertionName + '-' + Time.new.strftime("%Y-%m-%d_%H%M%S") + '.png'
    $browser.screenshot.save Dir.pwd + '/output/screenshots/' + $screenCaptureImageFileName  
  end 
end

def xt_emailResults()
  begin
    mail = Mail.new do
      from     'dean.elzein@xypro.com'
      to       'dean.elzein@xypro.com'# , benjamin.selski@xypro.com'#, XYPRO-tesladev@xypro.com, ellen_g@xypro.com'
      subject  'Tesla UI QA Automation Results'
      body     'Please see the attached Document for results. Please note that I will not attach the screenshots to this email. You can access the actual file with the screenshots in the QA Automation VM server (Teslaqa1.xypro-23.local), here: C:\Users\dean.elzein\Documents\Aptana Studio 3 Workspace\RAUA-xypro\Framework\output\TestResults.htm'
      add_file :filename => 'output/TestResults.htm'
    end
      mail.delivery_method :sendmail
      mail.deliver
      puts "Results email sent"
  rescue 
      puts "Results email send failed"
  end
end

def api_emailResults()
  begin
    mail = Mail.new do
      from     'dean.elzein@xypro.com'
      to       'dean.elzein@xypro.com, ryan.gunapala@xypro.com, rayna_b@xypro.com, shannon.beagin@xypro.com'
      subject  'Tesla API QA Automation Results'
      body     'Please see the attached Document for results. You can access the actual file with the screenshots in the QA Automation VM server (Teslaqa1.xypro-23.local), here: C:\Users\dean.elzein\Documents\Aptana Studio 3 Workspace\RAUA-xypro\Framework\output\apiTestResults.htm'
      add_file :filename => 'output/api_TestResults.htm'
    end
      mail.delivery_method :sendmail
      mail.deliver
      puts "Results email sent"
  rescue 
      puts "Results email send failed"
  end
end

