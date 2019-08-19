
def writeTestResultHtmlHeader()
   File.open( "output/#{$htmlFile}", "a" ) do | testResultHtml |
   testResultHtml.puts <<EOF
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
    <html>
    <head>
    <META http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Tesla UI QA Automation Test Results</title>
    <style type="text/css">
      body { font-family: Lato,arial; color:#191919; font-size: 12px; }
      table tr td, table tr th { font-family: verdana,arial,helvetica; font-size: 12px; }
      table { table-layout: fixed; }
      td { width: 20%; }
      table.details tr th{ font-family: verdana,arial,helvetica; font-weight: bold; text-align:left; background:#a6caf0; }
      table.details tr td{ background:#eeeee0; }
      p { line-height:1.5em; margin-top:0.5em; margin-bottom:1.0em; font-size: 12px; }
      h1 { margin: 0px 0px 5px; font-family: verdana,arial,helvetica; }
      h3 { margin-top: 1em; margin-bottom: 0.5em; font-family: verdana,arial,helvetica; }
      h3 { margin-bottom: 0.5em; font-family: verdana,arial,helvetica; }
      h4 { margin-bottom: 0.5em; font-family: verdana,arial,helvetica; }
      h5 { margin-bottom: 0.5em; font-family: verdana,arial,helvetica; }
      h6 { margin-bottom: 0.5em; font-family: verdana,arial,helvetica; }
      .Error { font-weight:bold; color:red; }
      .Failure { font-weight:bold; color:purple; }
      .small { font-size: 9px; }
      a { color: #003399; }
      a:hover { color: #888888; }
    </style>
    </head>
    <body>
    <a name="top"></a>
  <table border="1" cellpadding="5" cellspacing="3" bordercolor="#34495e" width=" 100%">
  <tr valign="middle" align="middle" bgcolor="#34495e">  
  <th  valign="middle" align="middle"><img src="logo.png" alt="header-logo" align="left" /><h2><font color="#ecf0f1">Tesla UI Automation Framework</font></h2></th>
  </tr>
  </table>
    <table border="0" cellpadding="5" cellspacing="2" width=" 100%">
  <tr valign="middle" align="middle" bgcolor="#34495e">
  <td><font color="#ecf0f1">Report generated at #{Time.new.inspect}</font></td><td><font color="#ecf0f1">Contact Tesla Automation Team: <a href="mailto:mohamed.elzein@xypro.com?Subject=Automation questions" target="_top"><font color="#ecf0f1">eMail Us</font></a></td>
  </tr>
  </table>
  
EOF
  end
end

def writeTestResults(testName, assertion)
  testName = testName
  assertion = assertion
  testStatus = $testStatus
  attribute_value = $attribute_value
  statusColor = (testStatus == 'Passed') ? '#2ecc71' : '#e74c3c'
  File.open( "output/#{$htmlFile}", "a" ) do | testResultHtml |
    testResultHtml.puts <<EOF
    <tr><p></p></tr>
    <table border="0" cellpadding="5" cellspacing="2" width=" 100%">  
    <tr valign="middle" align="middle" bgcolor="#bdc3c7">
    <th>Test Name</th>
    <th>Assertion</th>
    <th>Attribute Details</th
    ><th>Browser</th
    ><th>Screen Capture</th>
    <th>Status</th>
    </tr>
    <tr valign="middle" class="" bgcolor="#ecf0f1">
    <td align="middle">#{testName}</td>
    <td align="middle">#{assertion}</td>
    <td align="middle">#{attribute_value}</td>
    <td align="middle">#{$browserName}. Version: #{$browserVersion}</td>
    <td align="middle"><a href="screenshots/#{$screenCaptureImageFileName}"><img src="screenshots/#{$screenCaptureImageFileName}" width="200" height="115" target="_blank"></a></td>
    <td align="middle" style="background: #{statusColor}">#{testStatus}</td>
    </tr>
    </table> 
EOF
  end
end
 

def writeSummaryAndOverview()
  $totalTests = ($totalTests == 0) ? 1 : $totalTests 
  successRate =  "%5.2f" % [ (1.0 * $totalPassed) / (1.0 * $totalTests) * 100 ]
  File.open("output/#{$htmlFile}", "a") do | testResult |
  testResult.puts <<EOF
  <hr size="1">
  <tr><p></p></tr>
  <table border="0" cellpadding="5" cellspacing="2" width=" 100%">
    <tr align="middle">
    <td bgcolor="#e74c3c"><h3><font color="#ecf0f1">Failed Tests Report</font></h3></td>
    </tr>
    <tr valign="middle" align="middle" bgcolor="#bdc3c7">
    <th>Failed Test Cases</th><th>Time</th>
    </tr>
    
    <tr valign="middle" class="" align="middle" bgcolor="#ecf0f1">
    <td align="middle">#{$failureName}</td>
    <td align="middle">#{Time.now}</td>
    </tr>
    </table>
  
 <tr><p></p></tr>
  <table border="0" cellpadding="5" cellspacing="2" width=" 100%">
    <tr align="middle">
    <td bgcolor="#e74c3c"><h3><font color="#ecf0f1">Test Report Summary</font></h3></td>
    </tr>
  <tr valign="middle" bgcolor="#bdc3c7" align="middle">
  <th>Tests</th><th>Pass</th><th>Failures</th><th>Success rate</th><th>Time</th>
  </tr>
  <tr valign="middle" class="" align="middle" bgcolor="#ecf0f1">
  <td>#{$totalTests}</td><td>#{$totalPassed}</td><td>#{$totalFailed}</td><td>#{successRate}%</td><td>#{Time.now}</td>
  </tr>
  </table>
EOF
  end
end

def writeTestResultHtmlFooter()
 File.open("output/#{$htmlFile}", "a") do | testResultHtml |
 testResultHtml.puts <<EOF
  <tr><p></p></tr>
  <table border="0" cellpadding="5" cellspacing="2" width=" 100%">
  <tr><p></p></tr>
  <tr valign="middle" align="middle" bgcolor="#34495e">
  <th><h3><font color="#ecf0f1">End of the UI test suite</h3></th>
  </tr>
  </table>
  <a href="#top">Back to top</a>
  <table width="100%">
  <tr>
  <td>
  <hr noshade="yes" size="1">
  </td>
  </tr>
  </table>
  </body>
  </html>
EOF
  end
end

def emailTestResults()
  require 'net/smtp'
  eval File.read("smtp_tls.rb")
  Net::SMTP.enable_tls() 
  #FROM_EMAIL = "REMOVED"
  #PASSWORD = "REMOVED"
  #TO_EMAIL = "REMOVED" 
  message = <<MESSAGE_END
  Yayy Tests all passed Go QA Team!!!
MESSAGE_END
  Net::SMTP.start('smtp.gmail.com', 587, 'gmail.com', 'grqateam@gmail.com', 'wergrllc', :plain) do |smtp|
    smtp.send_message message, 'caoxu2000@gmail.com',
                                ['xucaotest1@gmail.com','xucaotest2@gmail.com']
  end
end