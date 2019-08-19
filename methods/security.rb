require 'rubygems'
require 'watir-webdriver'
require 'selenium-webdriver'
require 'active_support/secure_random'
require 'watir-webdriver/extensions/alerts'
require "helpers/readExcel.rb"
require "helpers/setup.rb"
require "helpers/helperMethods.rb"
require "templates/blueGreen/template.rb"

    
<<<<<<< HEAD
def xt_security_sqlInjection_() 
Scenario #1: The application uses untrusted data in the construction of the following vulnerable SQL call: 
String query = "SELECT * FROM LOGIN_USERS WHERE UserId='" + request.getParameter("id") + "'";
=======
# Scenario #1: The application uses untrusted data in the construction of the following vulnerable SQL call: 
#String query = "SELECT * FROM LOGIN_USERS WHERE UserId='" + request.getParameter("id") + "'";
>>>>>>> 18e83161608795a5c60fc38a188e38a511a8f403

# Scenario #2: Similarly, an application’s blind trust in frameworks may result in queries that are still vulnerable, (e.g., Hibernate Query Language (HQL)): 
#Query HQLQuery = session.createQuery(“FROM accounts WHERE custID='“ + request.getParameter("id") + "'");   

def xt_security_sqlInjectionOneEqualsOne()  
  begin
    #SELECT * FROM LOGIN_USERS WHERE UserId = 1 or 1=1
    #xt_assertion()
    #xt_ScreenCapture()
  rescue 
    #xt_increment_failed()
    #xt_ScreenCapture()
  end   
end

def xt_security_sqlInjectionIsAlwaysTrue()  
  begin
    #SELECT * FROM LOGIN_USERS WHERE UserName ="" or ""="" AND PasswordHash ="" or ""=""
    #xt_assertion()
    #xt_ScreenCapture()
  rescue 
    #xt_increment_failed()
    #xt_ScreenCapture()
  end   
end

def xt_security_hqlSQLInjection()
  begin
    xt_assertion()
    xt_ScreenCapture()
  rescue 
    xt_increment_failed()
    xt_ScreenCapture()
  end   
end

def xt_security_css() 
  begin
    xt_assertion()
    xt_ScreenCapture()
  rescue 
    xt_increment_failed()
    xt_ScreenCapture()
  end   
end

def xt_security_xss()
  begin
    #<script>alert("Test")</script>
    #xt_assertion()
    #xt_ScreenCapture()
  rescue 
    #xt_increment_failed()
    #xt_ScreenCapture()
  end   
end

def xt_security_insecureDirectObjectReference()
  begin
    xt_assertion()
    xt_ScreenCapture()
  rescue 
    xt_increment_failed()
    xt_ScreenCapture()
  end   
end

def xt_security_sensitiveDataExposure()
  begin
    xt_assertion()
    xt_ScreenCapture()
  rescue 
    xt_increment_failed()
    xt_ScreenCapture()
  end   
end

def xt_security_csrf()
  begin
    xt_assertion()
    xt_ScreenCapture()
  rescue 
    xt_increment_failed()
    xt_ScreenCapture()
  end   
end
