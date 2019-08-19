# require 'rubygems'
# require 'watir-webdriver'
# require 'selenium-webdriver'
# require 'active_support/secure_random'
# require 'watir-webdriver/extensions/alerts'
# require "helpers/readExcel.rb"
# require "helpers/setup.rb"
# require "helpers/helperMethods.rb"
# require "templates/blueGreen/template.rb"
# 
    # # sleep 2
    # # if $browser.html.include? "Drag a column header and drop it here to group by that column"
      # # puts "I see the text"
    # # end
# 
# 
# def xt_login()
  # begin
    # $browser.text_field(:id => 'inputUsername').when_present.clear
    # $browser.text_field(:id => 'inputUsername').when_present.set($userName)
    # $browser.text_field(:id => 'inputPassword').when_present.clear
    # $browser.text_field(:id => 'inputPassword').when_present.set($password)
    # $browser.button(:text => 'LOGIN').when_present.click
    # xt_assertion('INTEGRITY CHECK SUMMARY', 'xt_Login', 'div', 'class', 'summary-label')
    # xt_ScreenCapture("xt_Login Test")
  # rescue 
    # xt_increment_failed("xt_login")
    # xt_ScreenCapture("xt_Login_failedMethodBlock")
  # end
# end
# 
# def xt_failedLogin()
  # begin
    # $browser.text_field(:id => 'inputUsername').when_present.clear
    # $browser.text_field(:id => 'inputUsername').when_present.set($userName)
    # $browser.text_field(:id => 'inputPassword').when_present.clear
    # $browser.text_field(:id => 'inputPassword').when_present.set("$password")
    # $browser.button(:text => 'LOGIN').when_present.click
    # $browser.wait()
    # xt_assertion_text('xt_failedLogin',"Invalid username or password")
    # xt_ScreenCapture("xt_failedLogin Test")
  # rescue 
    # xt_increment_failed("xt_failedLogin")
    # xt_ScreenCapture("xt_failedLogin_failedMethodBlock")
  # end
# end
# 
# def xt_loginRememberMe()
  # begin
    # if $browser.checkbox(:xpath, "//input[@type='checkbox']").exists?
      # $browser.checkbox(:xpath, "//input[@type='checkbox']").when_present.set
    # else
      # puts "can't find it"
    # end
    # xt_assertion_text('xt_loginRememberMe',"Remember Me")
    # xt_ScreenCapture("xt_loginRememberMe Test")
  # rescue 
    # xt_increment_failed("xt_loginRememberMe")
    # xt_ScreenCapture("xt_loginRememberMe_failedMethodBlock")
  # end
# end
# 
# def xt_logout()
  # begin
    # $browser.link(:xpath => "//a[@class='dropdown-toggle ng-binding']").when_present.click
    # $browser.link(:xpath => "//a[@ng-click='logout()']").when_present.click
    # $browser.wait()
    # xt_assertion_text('Logout',"Login")
    # xt_ScreenCapture("LogoutText")
  # rescue 
    # xt_increment_failed("xt_Logout")
    # xt_ScreenCapture("xt_Logout_failedMethodBlock")
  # end
# end
# 
# 
