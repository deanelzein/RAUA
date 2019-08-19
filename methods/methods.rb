require 'rubygems'
require 'watir'
require 'selenium-webdriver'
require 'active_support'
require 'watir-scroll'
require 'watir-webdriver/extensions/alerts'
require "helpers/readExcel.rb"
require "helpers/setup.rb"
require "helpers/helperMethods.rb"
require "templates/blueGreen/template.rb"

    # sleep 2
    # if $browser.html.include? "Drag a column header and drop it here to group by that column"
      # puts "I see the text"
    # end
# .............................................................................................................................Access Control .................................................................................................


def xt_login()
  begin 
    sleep 1
    $browser.text_field(:id => 'inputUsername').when_present.clear
    $browser.text_field(:id => 'inputUsername').when_present.set($userName)
    $browser.text_field(:id => 'inputPassword').when_present.clear
    $browser.text_field(:id => 'inputPassword').when_present.set($password)
    $browser.button(:text => 'LOGIN').when_present.click
    xt_assertion('INTEGRITY CHECK SUMMARY', 'xt_Login', 'div', 'class', 'summary-label')
    xt_ScreenCapture("xt_Login Test")
  rescue 
    xt_increment_failed("xt_login")
    xt_ScreenCapture("xt_Login_failedMethodBlock")
  end
end

def xt_failedLogin()
  begin
    sleep 1
    $browser.text_field(:id => 'inputUsername').when_present.clear
    $browser.text_field(:id => 'inputUsername').when_present.set($userName)
    $browser.text_field(:id => 'inputPassword').when_present.clear
    $browser.text_field(:id => 'inputPassword').when_present.set("$password")
    $browser.button(:text => 'LOGIN').when_present.click
    $browser.wait()
    xt_assertElementExists('xt_failedLogin',"Invalid username or password")
    xt_ScreenCapture("xt_failedLogin Test")
  rescue 
    xt_increment_failed("xt_failedLogin")
    xt_ScreenCapture("xt_failedLogin_failedMethodBlock")
  end
end

def xt_loginRememberMe()
  begin
    sleep 1
    c = $browser.checkbox(:xpath, "//input[@type='checkbox']")
    c.when_present.set
    if c.set?
      xt_assertPassed('xt_loginRememberMe', "#{c}")     
    else
       xt_assertFailed('xt_loginRememberMe', "#{c}") 
    end
    xt_ScreenCapture("xt_loginRememberMe Test")
  rescue 
    xt_increment_failed("xt_loginRememberMe")
    xt_ScreenCapture("xt_loginRememberMe_failedMethodBlock")
  end
end

def xt_logout()
  begin
    sleep 1
    $browser.link(:xpath => "//a[@class='dropdown-toggle ng-binding']").when_present.click
    $browser.link(:xpath => "//a[@ng-click='logout()']").when_present.click
    $browser.wait()
    xt_assertElementExists('Logout',"Login")
    xt_ScreenCapture("LogoutText")
  rescue 
    xt_increment_failed("xt_Logout")  
    xt_ScreenCapture("xt_Logout_failedMethodBlock")
  end
end


# .............................................................................................................................Header Bar....................................................................................................

def xt_headerLogo()
  begin
    sleep 1
    if $browser.a(:xpath, "//a[@class='navbar-brand header-logo']").exists?
      xt_ScreenCapture("xt_headerLogo")
      xt_assertPassed('xt_headerLogo', 'navbar-brand header-logo')
    end 
  rescue 
    xt_ScreenCapture("xt_headerLogo_failedMethodBlock")
    xt_increment_failed("xt_headerLogo")
  end
end 

def xt_goToDashboard()
  begin
    sleep 1
    $browser.scroll.to :top
    $browser.a(:xpath, "//a[contains(.,'DASHBOARD')]").when_present.click 
    #$browser.ul(:class => 'nav navbar-nav xy_nav-min-width').lis.first.select  
    xt_assertElementExists('xt_goToDashboard',"INTEGRITY CHECK SUMMARY")
    xt_ScreenCapture("xt_goToDashboard")   
  rescue 
    xt_increment_failed("xt_goToDashboard")
    xt_ScreenCapture("xt_goToDashboard_failedMethodBlock")
  end
end

def xt_goToMonitor()
  begin
    sleep 1
    $browser.a(:xpath, "//a[contains(.,'MONITORS')]").when_present.click 
    #$browser.ul(:class => 'nav navbar-nav xy_nav-min-width').li(:text => 'MONITORS').when_present.click  
    xt_assertElementExists('xt_goToMonitor',"NEW GROUP")
    xt_ScreenCapture("xt_goToMonitor")   
  rescue 
    xt_increment_failed("xt_goToMonitor")
    xt_ScreenCapture("xt_goToMonitor_failedMethodBlock")
  end
end  


# .............................................................................................................................Dashboard - Summary.................................................................................................

def xt_dashboard_graph()
  begin
    sleep 1
    if $browser.div(:class => "summary-line-chart k-chart").exists?
      xt_assertPassed('xt_dashboard_graph', 'summary-line-chart k-chart')
      xt_ScreenCapture("xt_dashboard_graph")
    end   
  rescue 
    xt_increment_failed("xt_dashboard_graph")
    xt_ScreenCapture("xt_dashboard_graph_failedMethodBlock")
  end
end

def xt_dashboard_totalActiveMonitors()
  begin
    sleep 1
    puts activeMonitors = $browser.div(:class => "col-xs-6 col-sm-2 active-monitors-container").div(:class => "total-amount-label ng-binding").text  
    query = ""
    xt_assertPassed('xt_dashboard_totalActiveMonitors', activeMonitors)
    #xt_assertion_DB(activeMonitors, "xt_dashboard_totalActiveMonitors", query)
    xt_ScreenCapture("xt_dashboard_totalActiveMonitors")
  rescue 
    xt_increment_failed("xt_dashboard_totalActiveMonitors")
    xt_ScreenCapture("xt_dashboard_totalActiveMonitors_failedMethodBlock")
  end
end

def xt_dashboard_totalAlerts()
  begin
    sleep 1
    puts totalAlerts = $browser.div(:class => "col-xs-6 col-sm-2 alerts-container").div(:class => "total-amount-label ng-binding").text  
    query = ""
    xt_assertPassed('xt_dashboard_totalAlerts', totalAlerts)
    #xt_assertion_DB(activeMonitors, "xt_dashboard_totalAlerts", query)
    xt_ScreenCapture("xt_dashboard_totalAlerts")
  rescue 
    xt_increment_failed("xt_dashboard_totalAlerts")
    xt_ScreenCapture("xt_dashboard_totalAlerts_failedMethodBlock")
  end
end

def xt_dashboard_totalAlertsChart()
  begin
    sleep 1
    puts totalAlerts = $browser.div(:class => "col-sm-12 col-md-4 summary-pie-chart-container ng-scope").div(:class => "alerts ng-binding").text  
    query = ""
    xt_assertPassed('xt_dashboard_totalAlerts', totalAlerts)
    #xt_assertion_DB(activeMonitors, "xt_dashboard_totalAlerts", query)
    xt_ScreenCapture("xt_dashboard_totalAlerts")
  rescue 
    xt_increment_failed("xt_dashboard_totalAlerts")
    xt_ScreenCapture("xt_dashboard_totalAlerts_failedMethodBlock")
  end
end

def xt_dashboard_totalChangedAlerts()
  begin
    sleep 1
    puts totalChangedAlerts = $browser.div(:class => "col-xs-2 ng-scope").div(:class => "changed ng-binding").text  
    query = ""
    xt_assertPassed('xt_dashboard_totalChangedAlerts', totalChangedAlerts)
    #xt_assertion_DB(activeMonitors, "xt_dashboard_totalChangedAlerts", query)
    xt_ScreenCapture("xt_dashboard_totalChangedAlerts")
  rescue 
    xt_increment_failed("xt_dashboard_totalChangedAlerts")
    xt_ScreenCapture("xt_dashboard_totalChangedAlerts_failedMethodBlock")
  end  
end

def xt_dashboard_totalNewAlerts()
  begin
    sleep 1
    puts totalNewAlerts = $browser.div(:class => "col-xs-2 ng-scope").div(:class => "new ng-binding").text  
    query = ""
    xt_assertPassed('xt_dashboard_totalNewAlerts', totalNewAlerts)
    #xt_assertion_DB(activeMonitors, "xt_dashboard_totalNewAlerts", query)
    xt_ScreenCapture("xt_dashboard_totalNewAlerts")
  rescue 
    xt_increment_failed("xt_dashboard_totalNewAlerts")
    xt_ScreenCapture("xt_dashboard_totalNewAlerts_failedMethodBlock")
  end
end

def xt_dashboard_totalMissingAlerts()
  begin
    sleep 1
    puts totalMissingAlerts = $browser.div(:class => "col-xs-2 ng-scope").div(:class => "missing ng-binding").text 
    query = ""
    xt_assertPassed('xt_dashboard_totalMissingAlerts', totalMissingAlerts)
    #xt_assertion_DB(activeMonitors, "xt_dashboard_totalMissingAlerts", query)
    xt_ScreenCapture("xt_dashboard_totalMissingAlerts")
  rescue 
    xt_increment_failed("xt_dashboard_totalMissingAlerts")
    xt_ScreenCapture("xt_dashboard_totalMissingAlerts_failedMethodBlock")
  end  
end

def xt_dashboard_noAlerts()
  begin
    sleep 1
    xt_assertion()
    xt_ScreenCapture()
  rescue 
    xt_increment_failed()
    xt_ScreenCapture()
  end   
end

def xt_dashboard_pieChart()
  begin
    sleep 1
    xt_assertion()
    xt_ScreenCapture()
  rescue 
    xt_increment_failed()
    xt_ScreenCapture()
  end   
end


def xt_dashboard_barChart()
  begin
    sleep 1
    xt_assertion()
    xt_ScreenCapture()
  rescue 
    xt_increment_failed()
    xt_ScreenCapture()
  end   
end

def xt_dashboard_causeErrorsFilter()
  begin
    sleep 1
    #$browser.ul(:class => 'dropdown-menu xy-trend-chart-menu').li(:text => 'Cause Errors').exists?
    puts $browser.ul(:class => 'dropdown-menu xy-trend-chart-menu').lis.first.select
    #xt_assertElementExists('xt_dashboard_causeErrorsFilter',"System Errors")
    xt_ScreenCapture("xt_dashboard_causeErrorsFilter")
  rescue 
    xt_increment_failed("xt_dashboard_causeErrorsFilter")
    xt_ScreenCapture("xt_dashboard_causeErrorsFilter_failedMethodBlock")
  end   
end

def xt_dashboard_cleanErrorsFilter()
  begin
    sleep 1
    testng = $browser.ul(:class => "btn btn-default dropdown pull-right xy-trend-chart-pulldown").div(:class => "total-amount-label ng-binding").when_present.select('Clear Errors')
    puts testng
    #xt_assertElementExists('xt_dashboard_cleanErrorsFilter',"System Errors")
    xt_ScreenCapture("xt_dashboard_cleanErrorsFilter")
  rescue 
    xt_increment_failed("xt_dashboard_cleanErrorsFilter")
    xt_ScreenCapture("xt_dashboard_cleanErrorsFilter_failedMethodBlock")
  end     
end

def xt_dashboard_toggleBarPerGroupFilter()
  begin
    sleep 1
    $browser.select_list(:class => "btn btn-default dropdown pull-right xy-trend-chart-pulldown").div(:class => "total-amount-label ng-binding").when_present.select('Toggle bar per group')
    xt_assertElementExists('xt_dashboard_toggleBarPerGroupFilter',"System Errors")
    xt_ScreenCapture("xt_dashboard_toggleBarPerGroupFilter")
  rescue 
    xt_increment_failed("xt_dashboard_toggleBarPerGroupFilter")
    xt_ScreenCapture("xt_dashboard_toggleBarPerGroupFilter_failedMethodBlock")
  end    
end

def xt_dashboard_specifyTopGroups()
  begin
    sleep 1
    xt_assertion()
    xt_ScreenCapture()
  rescue 
    xt_increment_failed()
    xt_ScreenCapture()
  end   
end

def xt_dashboard_progressBar()
  begin
    sleep 1
    xt_assertion()
    xt_ScreenCapture()
  rescue 
    xt_increment_failed()
    xt_ScreenCapture()
  end   
end

# .............................................................................................................................Dashboard - All Alert Grid.................................................................................................

def xt_dashboard_viewAllAlerts()
  begin
    sleep 1
    $browser.div(:class => "xy-show-all-alerts ng-binding").when_present.click
    xt_assertElementExists('xt_dashboard_viewAllAlerts',"Alert Status:")
    xt_ScreenCapture("xt_dashboard_viewAllAlerts")
  rescue 
    xt_increment_failed("xt_dashboard_viewAllAlerts")
    xt_ScreenCapture("xt_dashboard_viewAllAlerts_failedMethodBlock")
  end    
end

def xt_dashboard_viewAllAlerts_statusClearedEmpty()
  begin
    sleep 1
    $browser.div(:class => "col-xs-6 col-md-3 xy-alert-tab-container").span(:text => "CLEARED").when_present.click
    xt_assertElementExists('xt_dashboard_viewAllAlerts_statusClearedEmpty',"Grid of cleared alerts coming soon")
    xt_ScreenCapture("xt_dashboard_viewAllAlerts_statusClearedEmpty")
  rescue 
    xt_increment_failed("xt_dashboard_viewAllAlerts_statusClearedEmpty")
    xt_ScreenCapture("xt_dashboard_viewAllAlerts_statusClearedEmpty_failedMethodBlock")
  end     
end

def xt_dashboard_viewAllAlerts_statusUncleared()
  begin
    sleep 1
    $browser.div(:class => "col-xs-6 col-md-3 xy-alert-tab-container").span(:text => "UNCLEARED").when_present.click
    xt_assertElementExists('xt_dashboard_viewAllAlerts_statusUncleared',"Drag a column header and drop it here to group by that column")
    xt_ScreenCapture("xt_dashboard_viewAllAlerts_statusUncleared")
  rescue 
    xt_increment_failed("xt_dashboard_viewAllAlerts_statusUncleared")
    xt_ScreenCapture("xt_dashboard_viewAllAlerts_statusUncleared_failedMethodBlock")
  end    
end

def xt_dashboard_viewAllAlerts_statusCleared()
  begin
    sleep 1
    xt_assertion()
    xt_ScreenCapture()
  rescue 
    xt_increment_failed()
    xt_ScreenCapture()
  end   
end

def xt_dashboard_hideAllAlerts()
  begin
    sleep 1
    $browser.div(:class => "xy-show-all-alerts ng-binding").when_present.click  
    xt_assertElementExists('xt_dashboard_hideAllAlerts', 'VIEW ALL ALERTS')
    xt_ScreenCapture("xt_dashboard_hideAllAlerts")
  rescue 
    xt_increment_failed("xt_dashboard_hideAllAlerts")
    xt_ScreenCapture("xt_dashboard_hideAllAlerts_failedMethodBlock")
  end  
end

def xt_dashboard_viewAllAlerts_refresh() 
  begin
    sleep 1
    $browser.div(:class => "col-xs-1 col-md-1").span(:class => "xy-refresh-white glyphicon glyphicon-refresh ng-scope").when_present.click
    xt_assertPassed('xt_dashboard_viewAllAlerts_refresh', 'xy-refresh-white glyphicon glyphicon-refresh ng-scope')
    # This assertion will be valid when we are able to refresh the grid data
    xt_ScreenCapture("xt_dashboard_viewAllAlerts_refresh")
  rescue 
    xt_increment_failed("xt_dashboard_viewAllAlerts_refresh")
    xt_ScreenCapture("xt_dashboard_viewAllAlerts_refresh_failedMethodBlock")
  end  
end

def xt_dashboard_viewAllAlerts_groupColumns()
  begin
    sleep 1
    a = $browser.div(:class => "ng-scope ng-binding xy-monitor-list-item-name").div(:text => "Alaska")
    b = $browser.div(:class => "xy-monitor-list-item xy-monitor-item-border xy-monitor-selected").div(:text => "Lunch")
    a.drag_and_drop_on b
    xt_assertElementExists('xt_dashboard_viewAllAlerts_groupColumns', "#{$auditPoolMonitorName}")
    xt_ScreenCapture("xt_dashboard_viewAllAlerts_groupColumns")
  rescue 
    xt_increment_failed("xt_dashboard_viewAllAlerts_groupColumns")
    xt_ScreenCapture("xt_dashboard_viewAllAlerts_groupColumns_failedMethodBlock")
  end  
end

def xt_dashboard_viewAllAlerts_gridFooter_rowsTotal()
  begin
    sleep 1
    $numOfRows = $browser.div(:class => 'xy-kendo-grid-rows-of-label').text.split(" ").last # to get the numbers after the last space
    xt_assertPassed('xt_dashboard_viewAllAlerts_gridFooter_rowsTotal',"xy-kendo-grid-rows-of-label")
    xt_ScreenCapture("xt_dashboard_viewAllAlerts_gridFooter_rowsTotal")   
  rescue 
    xt_increment_failed("xt_dashboard_viewAllAlerts_gridFooter_rowsTotal")
    xt_ScreenCapture("xt_dashboard_viewAllAlerts_gridFooter_rowsTotal_failedMethodBlock")
  end   
end  

def xt_dashboard_viewAllAlerts_gridFooter_rowsPerPage25()
  begin
    sleep 1
    $browser.span(:xpath, "//span[@class='k-input ng-scope']").when_present.click
    $browser.li(:xpath, "//li[contains(.,'25')]").when_present.click
    xt_assertElementExists('xt_dashboard_viewAllAlerts_gridFooter_rowsPerPage25',"Rows 1-25 of #{$numOfRows}")
    xt_ScreenCapture("xt_dashboard_viewAllAlerts_gridFooter_rowsPerPage25")   
  rescue 
    xt_increment_failed("xt_dashboard_viewAllAlerts_gridFooter_rowsPerPage25")
    xt_ScreenCapture("xt_dashboard_viewAllAlerts_gridFooter_rowsPerPage25_failedMethodBlock")
  end
end

def xt_dashboard_viewAllAlerts_gridFooter_rowsPerPage50()
  begin
    sleep 1
    $browser.span(:class => 'k-select').span(:class => 'k-icon k-i-arrow-s').when_present.click
    $browser.ul(:class => 'k-list k-reset').li(:text => '50').when_present.click  
    xt_assertElementExists('xt_dashboard_viewAllAlerts_gridFooter_rowsPerPage50',"Rows 1-50 of #{$numOfRows}")
    xt_ScreenCapture("xt_dashboard_viewAllAlerts_gridFooter_rowsPerPage50")   
  rescue 
    xt_increment_failed("xt_dashboard_viewAllAlerts_gridFooter_rowsPerPage50")
    xt_ScreenCapture("xt_dashboard_viewAllAlerts_gridFooter_rowsPerPage50_failedMethodBlock")
  end
end


def xt_dashboard_viewAllAlerts_gridFooter_rowsPerPage75()
  begin
    sleep 1
    $browser.span(:class => 'k-select').span(:class => 'k-icon k-i-arrow-s').when_present.click
    $browser.ul(:class => 'k-list k-reset').li(:text => '75').when_present.click  
    xt_assertElementExists('xt_dashboard_viewAllAlerts_gridFooter_rowsPerPage75',"Rows 1-75 of #{$numOfRows}")
    xt_ScreenCapture("xt_dashboard_viewAllAlerts_gridFooter_rowsPerPage75")   
  rescue 
    xt_increment_failed("xt_dashboard_viewAllAlerts_gridFooter_rowsPerPage75")
    xt_ScreenCapture("xt_dashboard_viewAllAlerts_gridFooter_rowsPerPage75_failedMethodBlock")
  end
end


def xt_dashboard_viewAllAlerts_gridFooter_rowsPerPage100()
  begin
    sleep 1
    $browser.span(:class => 'k-select').span(:class => 'k-icon k-i-arrow-s').when_present.click
    $browser.ul(:class => 'k-list k-reset').li(:text => '100').when_present.click  
    xt_assertElementExists('xt_dashboard_viewAllAlerts_gridFooter_rowsPerPage100',"Rows 1-100 of #{$numOfRows}")
    xt_ScreenCapture("xt_dashboard_viewAllAlerts_gridFooter_rowsPerPage100")   
  rescue 
    xt_increment_failed("xt_dashboard_viewAllAlerts_gridFooter_rowsPerPage100")
    xt_ScreenCapture("xt_dashboard_viewAllAlerts_gridFooter_rowsPerPage100_failedMethodBlock")
  end 
end

def xt_dashboard_viewAllAlerts_gridFooter_25next()
  begin
    sleep 1
    beforeRowsText = $browser.div(:class => 'xy-kendo-grid-rows-of-label').when_present.text
    numOfRows = $browser.div(:class => 'xy-kendo-grid-rows-of-label').text.split(" ").last
    beforeRowsText.include? "1-" && "-25"
    $browser.span(:xpath, "//span[contains(.,'Go to the next page')]").when_present.click
    sleep 1
    afterRowsText = $browser.div(:class => 'xy-kendo-grid-rows-of-label').when_present.text
    afterRowsText.include? "26-" && "-50"
    assertRowsText = $browser.div(:class => 'xy-kendo-grid-rows-of-label').text.split(" ", 4).last
    xt_assertElementExists('xt_dashboard_viewAllAlerts_gridFooter_25next',"#{assertRowsText}")
    xt_ScreenCapture("xt_dashboard_viewAllAlerts_gridFooter_25next")   
  rescue 
    xt_increment_failed("xt_dashboard_viewAllAlerts_gridFooter_25next")
    xt_ScreenCapture("xt_dashboard_viewAllAlerts_gridFooter_25next_failedMethodBlock")
  end   
end

def xt_dashboard_viewAllAlerts_gridFooter_50next()
  begin
    sleep 1
    $browser.span(:xpath, "//span[@class='k-input ng-scope']").when_present.click
    $browser.li(:xpath, "//li[contains(.,'50')]").when_present.click
    sleep 1
    beforeRowsText = $browser.div(:class => 'xy-kendo-grid-rows-of-label').when_present.text
    numOfRows = $browser.div(:class => 'xy-kendo-grid-rows-of-label').text.split(" ").last
    beforeRowsText.include? "1-" && "-50"
    $browser.span(:xpath, "//span[contains(.,'Go to the next page')]").when_present.click
    sleep 1
    afterRowsText = $browser.div(:class => 'xy-kendo-grid-rows-of-label').when_present.text
    afterRowsText.include? "51-" && "-100"
    assertRowsText = $browser.div(:class => 'xy-kendo-grid-rows-of-label').text.split(" ", 4).last
    xt_assertElementExists('xt_dashboard_viewAllAlerts_gridFooter_50next',"#{assertRowsText}")
    xt_ScreenCapture("xt_dashboard_viewAllAlerts_gridFooter_50next")   
  rescue 
    xt_increment_failed("xt_dashboard_viewAllAlerts_gridFooter_50next")
    xt_ScreenCapture("xt_dashboard_viewAllAlerts_gridFooter_50next_failedMethodBlock")
  end    
end

def xt_dashboard_viewAllAlerts_gridFooter_75next()
  begin
    sleep 1
    $browser.span(:xpath, "//span[@class='k-input ng-scope']").when_present.click
    $browser.li(:xpath, "//li[contains(.,'75')]").when_present.click
    sleep 1
    beforeRowsText = $browser.div(:class => 'xy-kendo-grid-rows-of-label').when_present.text
    numOfRows = $browser.div(:class => 'xy-kendo-grid-rows-of-label').text.split(" ").last
    beforeRowsText.include? "1-" && "-75"
    $browser.span(:xpath, "//span[contains(.,'Go to the next page')]").when_present.click
    sleep 1
    afterRowsText = $browser.div(:class => 'xy-kendo-grid-rows-of-label').when_present.text
    afterRowsText.include? "76-" && "-150"
    assertRowsText = $browser.div(:class => 'xy-kendo-grid-rows-of-label').text.split(" ", 4).last
    xt_assertElementExists('xt_dashboard_viewAllAlerts_gridFooter_75next',"#{assertRowsText}")
    xt_ScreenCapture("xt_dashboard_viewAllAlerts_gridFooter_75next")   
  rescue 
    xt_increment_failed("xt_dashboard_viewAllAlerts_gridFooter_75next")
    xt_ScreenCapture("xt_dashboard_viewAllAlerts_gridFooter_75next_failedMethodBlock")
  end    
end

def xt_dashboard_viewAllAlerts_gridFooter_100next()
  begin
    sleep 1
    $browser.span(:xpath, "//span[@class='k-input ng-scope']").when_present.click
    $browser.li(:xpath, "//li[contains(.,'100')]").when_present.click
    sleep 1
    beforeRowsText = $browser.div(:class => 'xy-kendo-grid-rows-of-label').when_present.text
    numOfRows = $browser.div(:class => 'xy-kendo-grid-rows-of-label').text.split(" ").last
    beforeRowsText.include? "1-" && "-100"
    $browser.span(:xpath, "//span[contains(.,'Go to the next page')]").when_present.click
    sleep 1
    afterRowsText = $browser.div(:class => 'xy-kendo-grid-rows-of-label').when_present.text
    afterRowsText.include? "101-" && "-200"
    assertRowsText = $browser.div(:class => 'xy-kendo-grid-rows-of-label').text.split(" ", 4).last
    xt_assertElementExists('xt_dashboard_viewAllAlerts_gridFooter_100next',"#{assertRowsText}")
    xt_ScreenCapture("xt_dashboard_viewAllAlerts_gridFooter_100next")   
  rescue 
    xt_increment_failed("xt_dashboard_viewAllAlerts_gridFooter_100next")
    xt_ScreenCapture("xt_dashboard_viewAllAlerts_gridFooter_100next_failedMethodBlock")
  end    
end

def xt_dashboard_viewAllAlerts_gridFooter_25previous()
  begin
    sleep 1
    $browser.span(:xpath, "//span[contains(.,'Go to the next page')]").when_present.click
    sleep 2   
    beforeRowsText = $browser.div(:class => 'xy-kendo-grid-rows-of-label').when_present.text
    $browser.span(:xpath, "//span[contains(.,'Go to the previous page')]").when_present.click
    sleep 2
    afterRowsText = $browser.div(:class => 'xy-kendo-grid-rows-of-label').when_present.text
    assertRowsText = $browser.div(:class => 'xy-kendo-grid-rows-of-label').text.split(" ", 4).last
    xt_assertElementExists('xt_dashboard_viewAllAlerts_gridFooter_25previous',"#{assertRowsText}")
    xt_ScreenCapture("xt_dashboard_viewAllAlerts_gridFooter_25previous")   
  rescue 
    xt_increment_failed("xt_dashboard_viewAllAlerts_gridFooter_25previous")
    xt_ScreenCapture("xt_dashboard_viewAllAlerts_gridFooter_25previous_failedMethodBlock")
  end   
end

def xt_dashboard_viewAllAlerts_gridFooter_50previous()
  begin
    sleep 1
    $browser.span(:xpath, "//span[@class='k-input ng-scope']").when_present.click
    $browser.li(:xpath, "//li[contains(.,'50')]").when_present.click
    sleep 2    
    $browser.span(:xpath, "//span[contains(.,'Go to the next page')]").when_present.click
    sleep 2   
    beforeRowsText = $browser.div(:class => 'xy-kendo-grid-rows-of-label').when_present.text
    $browser.span(:xpath, "//span[contains(.,'Go to the previous page')]").when_present.click
    sleep 2
    afterRowsText = $browser.div(:class => 'xy-kendo-grid-rows-of-label').when_present.text
    assertRowsText = $browser.div(:class => 'xy-kendo-grid-rows-of-label').text.split(" ", 4).last
    xt_assertElementExists('xt_dashboard_viewAllAlerts_gridFooter_50previous',"#{assertRowsText}")
    xt_ScreenCapture("xt_dashboard_viewAllAlerts_gridFooter_50previous")   
  rescue 
    xt_increment_failed("xt_dashboard_viewAllAlerts_gridFooter_50previous")
    xt_ScreenCapture("xt_dashboard_viewAllAlerts_gridFooter_50previous_failedMethodBlock")
  end    
end

def xt_dashboard_viewAllAlerts_gridFooter_75previous()
  begin
    sleep 1
    $browser.span(:xpath, "//span[@class='k-input ng-scope']").when_present.click
    $browser.li(:xpath, "//li[contains(.,'75')]").when_present.click
    sleep 2    
    $browser.span(:xpath, "//span[contains(.,'Go to the next page')]").when_present.click
    sleep 2   
    beforeRowsText = $browser.div(:class => 'xy-kendo-grid-rows-of-label').when_present.text
    $browser.span(:xpath, "//span[contains(.,'Go to the previous page')]").when_present.click
    sleep 2
    afterRowsText = $browser.div(:class => 'xy-kendo-grid-rows-of-label').when_present.text
    assertRowsText = $browser.div(:class => 'xy-kendo-grid-rows-of-label').text.split(" ", 4).last
    xt_assertElementExists('xt_dashboard_viewAllAlerts_gridFooter_75previous',"#{assertRowsText}")
    xt_ScreenCapture("xt_dashboard_viewAllAlerts_gridFooter_75previous")   
  rescue 
    xt_increment_failed("xt_dashboard_viewAllAlerts_gridFooter_75previous")
    xt_ScreenCapture("xt_dashboard_viewAllAlerts_gridFooter_75previous_failedMethodBlock")
  end   
end

def xt_dashboard_viewAllAlerts_gridFooter_100previous()
  begin
    sleep 1
    $browser.span(:xpath, "//span[@class='k-input ng-scope']").when_present.click
    $browser.li(:xpath, "//li[contains(.,'100')]").when_present.click
    sleep 2    
    $browser.span(:xpath, "//span[contains(.,'Go to the next page')]").when_present.click
    sleep 2   
    beforeRowsText = $browser.div(:class => 'xy-kendo-grid-rows-of-label').when_present.text
    $browser.span(:xpath, "//span[contains(.,'Go to the previous page')]").when_present.click
    sleep 2
    afterRowsText = $browser.div(:class => 'xy-kendo-grid-rows-of-label').when_present.text
    assertRowsText = $browser.div(:class => 'xy-kendo-grid-rows-of-label').text.split(" ", 4).last
    xt_assertElementExists('xt_dashboard_viewAllAlerts_gridFooter_100previous',"#{assertRowsText}")
    xt_ScreenCapture("xt_dashboard_viewAllAlerts_gridFooter_100previous")   
  rescue 
    xt_increment_failed("xt_dashboard_viewAllAlerts_gridFooter_100previous")
    xt_ScreenCapture("xt_dashboard_viewAllAlerts_gridFooter_100previous_failedMethodBlock")
  end  
end

def xt_dashboard_viewAllAlerts_gridFooter_lastPage()     
  begin
    sleep 1
    $browser.span(:xpath, "//span[contains(.,'Go to the last page')]").when_present.click
    sleep 2
    rowsText = $browser.div(:class => 'xy-kendo-grid-rows-of-label').when_present.text
    numOfRows = $browser.div(:class => 'xy-kendo-grid-rows-of-label').text.split(" ").last
    assertRowsText = $browser.div(:class => 'xy-kendo-grid-rows-of-label').text.split(" ", 4).last
    xt_assertElementExists('xt_dashboard_viewAllAlerts_gridFooter_lastPage',"#{assertRowsText}")
    xt_ScreenCapture("xt_dashboard_viewAllAlerts_gridFooter_lastPage")   
  rescue 
    xt_increment_failed("xt_dashboard_viewAllAlerts_gridFooter_lastPage")
    xt_ScreenCapture("xt_dashboard_viewAllAlerts_gridFooter_lastPage_failedMethodBlock")
  end  
end

def xt_dashboard_viewAllAlerts_gridFooter_firstPage()
  begin
    sleep 1
    $browser.span(:xpath, "//span[contains(.,'Go to the last page')]").when_present.click
    sleep 2
    beforeRowsText = $browser.div(:class => 'xy-kendo-grid-rows-of-label').when_present.text
    $browser.span(:xpath, "//span[contains(.,'Go to the first page')]").when_present.click
    sleep 2 
    lastRowsText = $browser.div(:class => 'xy-kendo-grid-rows-of-label').when_present.text   
    assertRowsText = $browser.div(:class => 'xy-kendo-grid-rows-of-label').text.split(" ", 4).last
    xt_assertElementExists('xt_dashboard_viewAllAlerts_gridFooter_firstPage',"#{assertRowsText}")
    xt_ScreenCapture("xt_dashboard_viewAllAlerts_gridFooter_firstPage")   
  rescue 
    xt_increment_failed("xt_dashboard_viewAllAlerts_gridFooter_firstPage")
    xt_ScreenCapture("xt_dashboard_viewAllAlerts_gridFooter_firstPage_failedMethodBlock")
  end   
end

def xt_dashboard_viewAllAlerts_gridFooter_exportsResults()
  begin
    sleep 1
    $browser.button(:xpath, "//button[contains(.,'EXPORT RESULTS')]").when_present.click  
    xt_assertElementExists('xt_dashboard_viewAllAlerts_gridFooter_firstPage',"files exported") # functionality is not implemented yet
    xt_ScreenCapture("xt_dashboard_viewAllAlerts_gridFooter_exportsResults")   
  rescue 
    xt_increment_failed("xt_dashboard_viewAllAlerts_gridFooter_exportsResults")
    xt_ScreenCapture("xt_dashboard_viewAllAlerts_gridFooter_exportsResults_failedMethodBlock")
  end    
end

def xt_dashboard_viewAllAlerts_gridSortAlerts() # Grid cells don't have options: comments and alert nums
 begin
    sleep 1
    $browser.scroll.to :top
    $browser.a(:text => 'Alert').when_present.click
    #sleep 1
    if $browser.a(:text => 'Alert').span(:class => "k-icon k-i-arrow-n").when_present.exists? == true
      asc = $browser.tr(:class =>"ng-scope").cell(:index => 0).when_present.text
    else
      asc = ""
    end
    $browser.a(:text => 'Alert').when_present.click
    #sleep 1
    if $browser.a(:text => 'Alert').span(:class => "k-icon k-i-arrow-s").when_present.exists? == true
      desc = $browser.tr(:class =>"ng-scope").cell(:index => 0).when_present.text
    else
      desc = ""
    end
    if asc != desc 
      xt_ScreenCapture("xt_dashboard_viewAllAlerts_gridSortAlerts")      
      xt_assertPassed('xt_dashboard_viewAllAlerts_gridSortAlerts', "k-icon k-i-arrow-s")

    else
      puts "xt_dashboard_viewAllAlerts_gridSortAlerts Failed!"
    end
  rescue 
    xt_increment_failed("xt_dashboard_viewAllAlerts_gridSortAlerts")
    xt_ScreenCapture("xt_dashboard_viewAllAlerts_gridSortAlerts_failedMethodBlock")
  end   
end

def xt_dashboard_viewAllAlerts_gridSortCollections()
  begin
    sleep 1
    $browser.a(:text => 'Collection').when_present.click
    if $browser.a(:text => 'Collection').span(:class => "k-icon k-i-arrow-n").when_present.exists? == true
      asc = $browser.tr(:class =>"ng-scope").cell(:index => 1).when_present.text
    else
      asc = ""
    end
    $browser.a(:text => 'Collection').when_present.click
    if $browser.a(:text => 'Collection').span(:class => "k-icon k-i-arrow-s").when_present.exists? == true
      desc = $browser.tr(:class =>"ng-scope").cell(:index => 1).when_present.text
    else
      desc = ""
    end
    if asc != desc 
      xt_ScreenCapture("xt_dashboard_viewAllAlerts_gridSortCollections")      
      xt_assertPassed('xt_dashboard_viewAllAlerts_gridSortCollections', "k-icon k-i-arrow-s")

    else
      puts "xt_dashboard_viewAllAlerts_gridSortCollections Failed!"
    end
  rescue 
    xt_increment_failed("xt_dashboard_viewAllAlerts_gridSortCollections")
    xt_ScreenCapture("xt_dashboard_viewAllAlerts_gridSortCollections_failedMethodBlock")
  end   
end

def xt_dashboard_viewAllAlerts_gridSortMonitor()
    begin
    sleep 1
    $browser.a(:text => 'Monitor').when_present.click
    if $browser.a(:text => 'Monitor').span(:class => "k-icon k-i-arrow-n").when_present.exists? == true
      asc = $browser.tr(:class =>"ng-scope").cell(:index => 2).when_present.text
    else
      asc = ""
    end
    $browser.a(:text => 'Monitor').when_present.click
    if $browser.a(:text => 'Monitor').span(:class => "k-icon k-i-arrow-s").when_present.exists? == true
      desc = $browser.tr(:class =>"ng-scope").cell(:index => 2).when_present.text
    else
      desc = ""
    end
    if asc != desc 
      xt_ScreenCapture("xt_dashboard_viewAllAlerts_gridSortMonitor")      
      xt_assertPassed('xt_dashboard_viewAllAlerts_gridSortMonitor', "k-icon k-i-arrow-s")

    else
      puts "xt_dashboard_viewAllAlerts_gridSortMonitor Failed!"
    end
  rescue 
    xt_increment_failed("xt_dashboard_viewAllAlerts_gridSortMonitor")
    xt_ScreenCapture("xt_dashboard_viewAllAlerts_gridSortMonitor_failedMethodBlock")
  end   
end

def xt_dashboard_viewAllAlerts_gridSortSubsystem()
  begin
    sleep 1
    $browser.a(:text => 'Subsystem').when_present.click
    if $browser.a(:text => 'Subsystem').span(:class => "k-icon k-i-arrow-n").when_present.exists? == true
      asc = $browser.tr(:class =>"ng-scope").cell(:index => 3).when_present.text
    else
      asc = ""
    end
    $browser.a(:text => 'Subsystem').when_present.click
    if $browser.a(:text => 'Subsystem').span(:class => "k-icon k-i-arrow-s").when_present.exists? == true
      desc = $browser.tr(:class =>"ng-scope").cell(:index => 3).when_present.text
    else
      desc = ""
    end
    if asc != desc 
      xt_ScreenCapture("xt_dashboard_viewAllAlerts_gridSortSubsystem")      
      xt_assertPassed('xt_dashboard_viewAllAlerts_gridSortSubsystem', "k-icon k-i-arrow-s")

    else
      puts "xt_dashboard_viewAllAlerts_gridSortSubsystem Failed!"
    end
  rescue 
    xt_increment_failed("xt_dashboard_viewAllAlerts_gridSortSubsystem")
    xt_ScreenCapture("xt_dashboard_viewAllAlerts_gridSortSubsystem_failedMethodBlock")
  end   
end

def xt_dashboard_viewAllAlerts_gridSortMonitorType()
  begin
    sleep 1
    $browser.a(:text => 'Monitor Type').when_present.click
    if $browser.a(:text => 'Monitor Type').span(:class => "k-icon k-i-arrow-n").when_present.exists? == true
      asc = $browser.tr(:class =>"ng-scope").cell(:index => 4).when_present.text
    else
      asc = ""
    end
    $browser.a(:text => 'Monitor Type').when_present.click
    if $browser.a(:text => 'Monitor Type').span(:class => "k-icon k-i-arrow-s").when_present.exists? == true
      desc = $browser.tr(:class =>"ng-scope").cell(:index => 4).when_present.text
    else
      desc = ""
    end
    if asc != desc 
      xt_ScreenCapture("xt_dashboard_viewAllAlerts_gridSortMonitorType")      
      xt_assertPassed('xt_dashboard_viewAllAlerts_gridSortMonitorType', "k-icon k-i-arrow-s")

    else
      puts "xt_dashboard_viewAllAlerts_gridSortMonitorType Failed!"
    end
  rescue 
    xt_increment_failed("xt_dashboard_viewAllAlerts_gridSortMonitorType")
    xt_ScreenCapture("xt_dashboard_viewAllAlerts_gridSortMonitorType_failedMethodBlock")
  end   
end

def xt_dashboard_viewAllAlerts_gridSortNode()
  begin
    sleep 1
    $browser.a(:text => 'Node').when_present.click
    if $browser.a(:text => 'Node').span(:class => "k-icon k-i-arrow-n").when_present.exists? == true
      asc = $browser.tr(:class =>"ng-scope").cell(:index => 5).when_present.text
    else
      asc = ""
    end
    $browser.a(:text => 'Node').when_present.click
    if $browser.a(:text => 'Node').span(:class => "k-icon k-i-arrow-s").when_present.exists? == true
      desc = $browser.tr(:class =>"ng-scope").cell(:index => 5).when_present.text
    else
      desc = ""
    end
    if asc != desc 
      xt_ScreenCapture("xt_dashboard_viewAllAlerts_gridSortNode")      
      xt_assertPassed('xt_dashboard_viewAllAlerts_gridSortNode', "k-icon k-i-arrow-s")
    
    else
      puts "xt_dashboard_viewAllAlerts_gridSortNode Failed!"
    end
  rescue 
    xt_increment_failed("xt_dashboard_viewAllAlerts_gridSortNode")
    xt_ScreenCapture("xt_dashboard_viewAllAlerts_gridSortNode_failedMethodBlock")
  end   
end

def xt_dashboard_viewAllAlerts_gridSortEntity()
  begin
    sleep 1
    $browser.a(:text => 'Entity').when_present.click
    if $browser.a(:text => 'Entity').span(:class => "k-icon k-i-arrow-n").when_present.exists? == true
      asc = $browser.tr(:class =>"ng-scope").cell(:index => 6).when_present.text
    else
      asc = ""
    end
    $browser.a(:text => 'Entity').when_present.click
    if $browser.a(:text => 'Entity').span(:class => "k-icon k-i-arrow-s").when_present.exists? == true
      desc = $browser.tr(:class =>"ng-scope").cell(:index => 6).when_present.text
    else
      desc = ""
    end
    if asc != desc 
      xt_ScreenCapture("xt_dashboard_viewAllAlerts_gridSortEntity")      
      xt_assertPassed('xt_dashboard_viewAllAlerts_gridSortEntity', "k-icon k-i-arrow-s")

    else
      puts "xt_dashboard_viewAllAlerts_gridSortEntity Failed!"
    end
  rescue 
    xt_increment_failed("xt_dashboard_viewAllAlerts_gridSortEntity")
    xt_ScreenCapture("xt_dashboard_viewAllAlerts_gridSortEntity_failedMethodBlock")
  end   
end

def xt_dashboard_viewAllAlerts_gridSortAttribute()
begin
    sleep 1
    $browser.a(:text => 'Attribute').when_present.click
    if $browser.a(:text => 'Attribute').span(:class => "k-icon k-i-arrow-n").when_present.exists? == true
      asc = $browser.tr(:class =>"ng-scope").cell(:index => 7).when_present.text
    else
      asc = ""
    end
    $browser.a(:text => 'Attribute').when_present.click
    if $browser.a(:text => 'Attribute').span(:class => "k-icon k-i-arrow-s").when_present.exists? == true
      desc = $browser.tr(:class =>"ng-scope").cell(:index => 7).when_present.text
    else
      desc = ""
    end
    if asc != desc 
      xt_ScreenCapture("xt_dashboard_viewAllAlerts_gridSortAttribute")      
      xt_assertPassed('xt_dashboard_viewAllAlerts_gridSortAttribute', "k-icon k-i-arrow-s")

    else
      puts "xt_dashboard_viewAllAlerts_gridSortAttribute Failed!"
    end
  rescue 
    xt_increment_failed("xt_dashboard_viewAllAlerts_gridSortAttribute")
    xt_ScreenCapture("xt_dashboard_viewAllAlerts_gridSortAttribute_failedMethodBlock")
  end   
end

def xt_dashboard_viewAllAlerts_gridSortPrevious()
begin
    sleep 1
    $browser.a(:text => 'Previous').when_present.click
    if $browser.a(:text => 'Previous').span(:class => "k-icon k-i-arrow-n").when_present.exists? == true
      asc = $browser.tr(:class =>"ng-scope").cell(:index => 8).when_present.text
    else
      asc = ""
    end
    $browser.a(:text => 'Previous').when_present.click
    if $browser.a(:text => 'Previous').span(:class => "k-icon k-i-arrow-s").when_present.exists? == true
      desc = $browser.tr(:class =>"ng-scope").cell(:index => 8).when_present.text
    else
      desc = ""
    end
    if asc != desc 
      xt_ScreenCapture("xt_dashboard_viewAllAlerts_gridSortPrevious")      
      xt_assertPassed('xt_dashboard_viewAllAlerts_gridSortPrevious', "k-icon k-i-arrow-s")

    else
      puts "xt_dashboard_viewAllAlerts_gridSortPrevious Failed!"
    end
  rescue 
    xt_increment_failed("xt_dashboard_viewAllAlerts_gridSortPrevious")
    xt_ScreenCapture("xt_dashboard_viewAllAlerts_gridSortPrevious_failedMethodBlock")
  end   
end

def xt_dashboard_viewAllAlerts_gridSortCurrent()
 begin
    sleep 1
    $browser.a(:text => 'Current').when_present.click
    if $browser.a(:text => 'Current').span(:class => "k-icon k-i-arrow-n").when_present.exists? == true
      asc = $browser.tr(:class =>"ng-scope").cell(:index => 9).text
    else
      asc = ""
    end
    $browser.a(:text => 'Current').when_present.click
    if $browser.a(:text => 'Current').span(:class => "k-icon k-i-arrow-s").when_present.exists? == true
      desc = $browser.tr(:class =>"ng-scope").cell(:index => 9).text
    else
      desc = ""
    end
    if asc != desc 
      xt_ScreenCapture("xt_dashboard_viewAllAlerts_gridSortCurrent")      
      xt_assertPassed('xt_dashboard_viewAllAlerts_gridSortCurrent', "k-icon k-i-arrow-s")

    else
      puts "xt_dashboard_viewAllAlerts_gridSortCurrent Failed!"
    end
  rescue 
    xt_increment_failed("xt_dashboard_viewAllAlerts_gridSortCurrent")
    xt_ScreenCapture("xt_dashboard_viewAllAlerts_gridSortCurrent_failedMethodBlock")
  end   
end

def xt_dashboard_viewAllAlerts_gridMonitorCell_monitorPage()
  begin
    sleep 1
    mName = $browser.tr(:class =>"ng-scope").cell(:index => 2).when_present.text
    $browser.a(:class => 'xy-monitor-link ng-scope').when_present.click
    sleep 1
    vName = $browser.div(:class => "col-lg-12 col-xl-8 xy-no-side-padding top-panel-monitor-name ng-binding").when_present.text
    xt_assertElementExists('xt_dashboard_viewAllAlerts_gridMonitorCell_monitorPage', mName)
    xt_ScreenCapture("xt_dashboard_viewAllAlerts_gridMonitorCell_monitorPage")
  rescue 
    xt_increment_failed("xt_dashboard_viewAllAlerts_gridMonitorCell_monitorPage")
    xt_ScreenCapture("xt_dashboard_viewAllAlerts_gridMonitorCell_monitorPage_failedMethodBlock")
  end   
end

def xt_dashboard_viewAllAlerts_attributeAlertHistory_verifyAlertType()
  begin
    sleep 1
    gridType = $browser.tr(:class =>"ng-scope").cell(:index => 0).when_present.text
    aType = ""
    checkType = ""
    if gridType == "C"
      aType = "Changed"
      $browser.a(:class => 'xy-details-link').when_present.click
      checkType = $browser.div(:class => 'col-xs-12 col-sm-5 comment-alert-label ng-binding').when_present.text
    elsif gridType == "N"
      aType = "New"
      $browser.a(:class => 'xy-details-link').when_present.click
      checkType = $browser.div(:class => 'col-xs-12 col-sm-5 comment-alert-label ng-binding').when_present.text
    else
      aType = "Missing"
      $browser.a(:class => 'xy-details-link').when_present.click
      checkType = $browser.div(:class => 'col-xs-12 col-sm-5 comment-alert-label ng-binding').when_present.text
    end
    if checkType.include? aType
      xt_assertElementExists('xt_dashboard_viewAllAlerts_attributeAlertHistory_verifyAlertType', 'Alert History')
      xt_ScreenCapture("xt_dashboard_viewAllAlerts_attributeAlertHistory_verifyAlertType")
    end
  rescue 
    xt_increment_failed("xt_dashboard_viewAllAlerts_attributeAlertHistory_verifyAlertType")
    xt_ScreenCapture("xt_dashboard_viewAllAlerts_attributeAlertHistory_verifyAlertType_failedMethodBlock")
  end   
end

def xt_dashboard_viewAllAlerts_gridDetails_attributeAlertHistory_submit()
  begin
    sleep 1
    xt_assertion()
    xt_ScreenCapture()
  rescue 
    xt_increment_failed()
    xt_ScreenCapture()
  end   
end

def xt_dashboard_viewAllAlerts_gridDetails_attributeAlertHistory_clear()
    begin
    sleep 1
    $browser.button(:class => 'btn btn-default button-dark pull-right comment-clear-button').when_present.click
    xt_assertElementExists('xt_dashboard_viewAllAlerts_attributeAlertHistory_clear', 'Alert History')
    xt_ScreenCapture("xt_dashboard_viewAllAlerts_attributeAlertHistory_clear")
  rescue 
    xt_increment_failed("xt_dashboard_viewAllAlerts_attributeAlertHistory_clear")
    xt_ScreenCapture("xt_dashboard_viewAllAlerts_attributeAlertHistory_clear_failedMethodBlock")
  end    
end

def xt_dashboard_viewAllAlerts_gridDetails_attributeAlertHistory_clearAll()
  begin
    sleep 1
    $browser.button(:class => 'btn btn-default button-light pull-right ng-scope').when_present.click
    $browser.button(:class => 'btn btn-default button-dark pull-right confirm-clear-button').when_present.click
    xt_assertElementExists('xt_dashboard_viewAllAlerts_attributeAlertHistory_clearAll', 'Alert History')
    xt_ScreenCapture("xt_dashboard_viewAllAlerts_attributeAlertHistory_clearAll")
  rescue 
    xt_increment_failed("xt_dashboard_viewAllAlerts_attributeAlertHistory_clearAll")
    xt_ScreenCapture("xt_dashboard_viewAllAlerts_attributeAlertHistory_clearAll_failedMethodBlock")
  end    
end

def xt_dashboard_viewAllAlerts_gridDetails_attributeAlertHistory_addComment()
  begin
    sleep 1
    $browser.textarea(:class => 'form-control comment-add-input ng-pristine ng-valid').when_present.set 'Test'
    $browser.button(:text => 'ADD COMMENT').when_present.click
    xt_assertElementExists('xt_dashboard_viewAllAlerts_gridDetails_attributeAlertHistory_addComment', 'Alert History')
    xt_ScreenCapture("xt_dashboard_viewAllAlerts_gridDetails_attributeAlertHistory_addComment")
  rescue 
    xt_increment_failed("xt_dashboard_viewAllAlerts_gridDetails_attributeAlertHistory_addComment")
    xt_ScreenCapture("xt_dashboard_viewAllAlerts_gridDetails_attributeAlertHistory_addComment_failedMethodBlock")
  end   
end

def xt_dashboard_viewAllAlerts_gridDetails_attributeAlertHistory_close()
  begin
    sleep 1
    $browser.div(:class => 'closebtn pull-right').when_present.click
    xt_assertElementExists('xt_dashboard_viewAllAlerts_attributeAlertHistory_close', 'TRENDING')
    xt_ScreenCapture("xt_dashboard_viewAllAlerts_attributeAlertHistory_close")
  rescue 
    xt_increment_failed("xt_dashboard_viewAllAlerts_attributeAlertHistory_close")
    xt_ScreenCapture("xt_dashboard_viewAllAlerts_attributeAlertHistory_close_failedMethodBlock")
  end   
end

def xt_dashboard_viewAllAlerts_gridClear()
  begin
    sleep 1
    #sleep 20
    $browser.button(:class => 'btn btn-default button-dark top-panel-button').when_present.click
    xt_assertElementExists('xt_dashboard_viewAllAlerts_gridClear', 'CLEAR ALERT')
    xt_ScreenCapture("xt_dashboard_viewAllAlerts_gridClear")
  rescue 
    xt_increment_failed("xt_dashboard_viewAllAlerts_gridClear")
    xt_ScreenCapture("xt_dashboard_viewAllAlerts_gridClear_failedMethodBlock")
  end   
end

def xt_dashboard_viewAllAlerts_gridClear_addComment()
  begin
    sleep 1
    $browser.textarea(:class => 'form-control add-comment-optional-textarea ng-pristine ng-valid').when_present.set 'TEST'
    xt_assertElementExists('xt_dashboard_viewAllAlerts_gridClear_addComment', 'CLEAR ALERT')
    xt_ScreenCapture("xt_dashboard_viewAllAlerts_gridClear_addComment")
  rescue 
    xt_increment_failed("xt_dashboard_viewAllAlerts_gridClear_addComment")
    xt_ScreenCapture("xt_dashboard_viewAllAlerts_gridClear_addComment_failedMethodBlock")
  end   
end

def xt_dashboard_viewAllAlerts_gridClear_cancel() 
   begin
    sleep 1
    $browser.button(:class => 'btn btn-default button-dark top-panel-button').when_present.click
    $browser.button(:class => 'btn btn-default button-light pull-left').when_present.click
    xt_assertElementExists('xt_dashboard_viewAllAlerts_gridClear_cancel', 'CLEAR ALERT')
    xt_ScreenCapture("xt_dashboard_viewAllAlerts_gridClear_cancel")
  rescue 
    xt_increment_failed("xt_dashboard_viewAllAlerts_gridClear_cancel")
    xt_ScreenCapture("xt_dashboard_viewAllAlerts_gridClear_cancel_failedMethodBlock")
  end   
end

def xt_dashboard_viewAllAlerts_gridClear_confirmClear()
  begin
    sleep 1
    $browser.button(:xpath, "//button[@ng-click='clearConfirmClickHandler()']").when_present.click
    xt_assertElementDoesntExists('xt_dashboard_viewAllAlerts_gridClear_confirmClear', 'CLEAR ALERT')
    xt_ScreenCapture("xt_dashboard_viewAllAlerts_gridClear_confirmClear")
  rescue 
    xt_increment_failed("xt_dashboard_viewAllAlerts_gridClear_confirmClear")
    xt_ScreenCapture("xt_dashboard_viewAllAlerts_gridClear_confirmClear_failedMethodBlock")
  end   
end

def xt_dashboard_viewAllAlerts_gridSystem()
  begin
    sleep 1
    xt_assertion()
    xt_ScreenCapture()
  rescue 
    xt_increment_failed()
    xt_ScreenCapture()
  end   
end

# .............................................................................................................................Dashboard - Groups...........................................................................................................

def xt_dashboard_moveGroups()
  begin
    sleep 1
    xt_assertion()
    xt_ScreenCapture()
  rescue 
    xt_increment_failed()
    xt_ScreenCapture()
  end   
end

def xt_dashboard_visibleGroups() # display the latest 6 groups
  begin
    sleep 1
    xt_assertion()
    xt_ScreenCapture()
  rescue 
    xt_increment_failed()
    xt_ScreenCapture()
  end   
end

def xt_dashboard_showHiddenGroup()
  begin
    sleep 1
    $browser.div(:class => 'tile-header-label ng-scope ng-binding').when_present.click
    $browser.div(:class => 'dropdown-item-label ng-binding').when_present.click

    xt_assertElementExists("xt_dashboard_showHiddenGroup",$browser.div(:class => 'col-xs-12 col-lg-6 dropdown xy-dropdown open'))
    xt_ScreenCapture("xt_dashboard_showHiddenGroup")
  rescue
    xt_increment_failed("xt_dashboard_showHiddenGroup")
    xt_ScreenCapture("xt_dashboard_showHiddenGroup_failedMethodBlock")
  end
end

def xt_dashboard_viewMonitor()
  begin
    sleep 1
    $browser.div(:class => 'col-xs-12 col-sm-12 col-md-6 col-lg-6 tile-item-label ng-scope ng-binding').when_present.click
    xt_assertElementExists("xt_dashboard_viewMonitor", 'DEFINITION')
    xt_ScreenCapture("xt_dashboard_viewMonitor")
  rescue
    xt_increment_failed("xt_dashboard_viewMonitor")
    xt_ScreenCapture("xt_dashboard_viewMonitor_failedMethodBlock")
  end
end
# .............................................................................................................................Groups...........................................................................................................

def xt_monitors_createGroup_cancel() 
  begin
    sleep 1
    $browser.div(:class => "xy-new-item-container").a(:text => "NEW GROUP").when_present.click
    $browser.text_field(:xpath, "//input[@ng-model='group.groupName']").when_present.set("New Group Cancel")
    $browser.button(:class => 'btn btn-default button-light pull-left').when_present.click
    xt_assertElementDoesntExists('xt_monitors_group_delete', "New Group Cancel")
    xt_ScreenCapture("xt_monitors_createGroup_cancel")
  rescue 
    xt_increment_failed("xt_monitors_createGroup_cancel")
    xt_ScreenCapture("xt_monitors_createGroup_cancel_failedMethodBlock")
  end 
end

def xt_monitors_group_create() 
  begin
    sleep 1
    $groupName = "NewGroup " + SecureRandom.hex(3)
    $browser.div(:class => "xy-new-item-container").a(:text => "NEW GROUP").when_present.click
    $browser.text_field(:xpath, "//input[@ng-model='group.groupName']").when_present.set($groupName)
    $browser.div(:class => "modal-footer ng-scope").button(:text => 'CREATE GROUP').when_present.click
    xt_assertElementExists('xt_monitors_group_create',"There are no monitors for this group")
    xt_ScreenCapture("xt_monitors_group_create")
  rescue 
    xt_increment_failed("xt_monitors_group_create")
    xt_ScreenCapture("xt_monitors_group_create_failedMethodBlock")
  end 
end

def xt_monitors_group_createBadName() 
  begin
    sleep 1
    badGroupName = SecureRandom.base64
    $browser.div(:class => "xy-new-item-container").a(:text => "NEW GROUP").when_present.click
    $browser.text_field(:xpath, "//input[@ng-model='group.groupName']").when_present.set(badGroupName)
    $browser.div(:class => "modal-footer ng-scope").button(:text => 'CREATE GROUP').when_present.click
    xt_assertion('Name contains illegal characters (letters, numbers, \\, . and $ are allowed)', 'xt_monitors_group_createBadName', 'div', 'xpath', '//div[contains(@class,\'col-xs-12 error-message ng-scope ng-binding\')]')
    xt_ScreenCapture("xt_monitors_group_createBadName")
    $browser.div(:class => "modal-footer ng-scope").button(:text => 'CANCEL').when_present.click
  rescue 
    xt_increment_failed("xt_monitors_group_createBadName")
    xt_ScreenCapture("xt_monitors_group_createBadName_failedMethodBlock")
  end 
end

def xt_monitors_group_rename() 
  begin
    sleep 1
    $renamedGroupName = "RenamedGroup " + SecureRandom.hex(3)
    $browser.div(:class => "dropdown xy-dropdown").a(:xpath, "//a[contains(@style,'visibility: visible;')]").when_present.click
    $browser.div(:class => "dropdown xy-dropdown open").ul(:class => 'dropdown-menu xy-dropdown-menu xy-group-dropdown-menu pull-right').li(:text => 'Rename').when_present.click
    $browser.text_field(:xpath, "//input[@class='form-control ng-pristine ng-valid']").when_present.set($renamedGroupName)
    $browser.button(:xpath, "//button[@class='btn btn-default button-dark pull-right']").when_present.click
    xt_assertElementExists('xt_monitors_group_rename', "#{$renamedGroupName}")
    xt_ScreenCapture("xt_monitors_group_rename")
  rescue 
    xt_increment_failed("xt_monitors_group_rename")
    xt_ScreenCapture("xt_monitors_group_rename_failedMethodBlock")
  end 
end

def xt_monitors_renameExistingGroup() 
  begin
    sleep 1
    $browser.div(:class => "dropdown xy-dropdown").a(:xpath, "//a[contains(@style,'visibility: visible;')]").when_present.click
    $browser.div(:class => "dropdown xy-dropdown open").ul(:class => 'dropdown-menu xy-dropdown-menu xy-group-dropdown-menu pull-right').li(:text => 'Rename').when_present.click
    $browser.text_field(:xpath, "//input[@class='form-control ng-pristine ng-valid']").when_present.set($renamedGroupName)
    $browser.button(:xpath, "//button[@class='btn btn-default button-dark pull-right']").when_present.click
    xt_assertElementExists('xt_monitors_group_renameExisting', "There is already a group with this name")
    xt_ScreenCapture("xt_monitors_group_renameExisting")
    $browser.div(:class => "modal-footer ng-scope").button(:text => 'CANCEL').when_present.click
  rescue 
    xt_increment_failed("xt_monitors_group_renameExisting")
    xt_ScreenCapture("xt_monitors_group_renameExisting_failedMethodBlock")
  end 
end

def xt_monitors_group_delete() 
  begin
    sleep 1
    $browser.div(:class => "dropdown xy-dropdown").a(:xpath, "//a[contains(@style,'visibility: visible;')]").when_present.click
    $browser.div(:class => "dropdown xy-dropdown open").ul(:class => 'dropdown-menu xy-dropdown-menu xy-group-dropdown-menu pull-right').li(:text => 'Delete').when_present.click
    $browser.button(:xpath, "//button[@class='btn btn-default button-dark pull-right']").when_present.click             
    xt_assertElementDoesntExists('xt_monitors_group_delete', $renamedGroupName)
    xt_ScreenCapture("xt_monitors_group_delete")
  rescue 
    xt_increment_failed("xt_monitors_group_delete")
    xt_ScreenCapture("xt_monitors_group_delete_failedMethodBlock")
  end 
end

def xt_monitors_newGroup_addNewMonitors() 
  begin
    sleep 1
    xt_monitors_group_create() 
    monitorName = "#{$groupName} - NewMonitor"
    $browser.link(:xpath, "//a[contains(.,'CREATE A NEW MONITOR IN THIS GROUP')]").when_present.click
    $browser.text_field(:xpath, "//input[@placeholder='Enter Monitor Name']").when_present.set(monitorName)
    $browser.div(:xpath, "//div[@id='entityTypeNameInModal']").when_present.click
    $browser.div(:class => "dropdown xy-dropdown xy-form-dropdown-container entity-type-dropdown").ul(:class => 'dropdown-menu xy-dropdown-menu group-dropdown-list').a(:text => 'AuditPool').when_present.click
    $browser.div(:class => "modal-footer xy-clear-both ng-scope").button(:text => 'CREATE MONITOR').when_present.click
    sleep 2
    $browser.div(:class => "col-xs-5 xySummaryDirtyBitButtonContainer").button(:text => 'SAVE').when_present.click          
    xt_assertElementExists('xt_monitors_newGroup_addNewMonitors', monitorName)
    xt_ScreenCapture("xt_monitors_newGroup_addNewMonitors")
  rescue 
    xt_increment_failed("xt_monitors_newGroup_addNewMonitors")
    xt_ScreenCapture("xt_monitors_newGroup_addNewMonitors_failedMethodBlock")
  end 
end

def xt_monitors_newGroup_addExistingMonitors() 
  begin
    sleep 1
    xt_monitors_group_create() 
    $browser.div(:class, "tile-header-label xy-form-dropdown-selection-label no-monitor-text ng-binding").when_present.click
    $browser.ul(:class => 'dropdown-menu xy-dropdown-menu group-dropdown-list').li(:index => 0).checkbox(:class => 'monitor-form-checkbox pull-right ng-scope ng-pristine ng-valid').when_present.set
    $browser.button(:xpath, "//button[@ng-click='addMonitorsToGroup()']").when_present.click
    sleep 2      
    xt_assertElementExists('xt_monitors_newGroup_addExistingMonitors', $groupName)
    xt_ScreenCapture("xt_monitors_newGroup_addExistingMonitors")
  rescue 
    xt_increment_failed("xt_monitors_newGroup_addExistingMonitors")
    xt_ScreenCapture("xt_monitors_newGroup_addExistingMonitors_failedMethodBlock")
  end 
end

# .............................................................................................................................Monitors....................................................................................................
def xt_monitors_modal_discardChanges()
  sleep 1
  $browser.button(:text => "DISCARD CHANGES").when_present.click
end

def xt_monitors_createMonitor_cancel() 
  begin
    sleep 1
    $browser.a(:text => "NEW MONITOR").when_present.click
    $browser.text_field(:xpath, "//input[@placeholder='Enter Monitor Name']").when_present.set("New Monitors Cancel")
    $browser.div(:class => "modal-footer xy-clear-both ng-scope").button(:text => 'CANCEL').when_present.click
    xt_assertElementDoesntExists('xt_monitors_createMonitor_cancel', "New Monitors Cancel")
    xt_ScreenCapture("xt_monitors_createMonitor_cancel")
  rescue 
    xt_increment_failed("xt_monitors_createMonitor_cancel")
    xt_ScreenCapture("xt_monitors_createMonitor_cancel_failedMethodBlock")
  end 
end

def xt_monitors_createMonitor_cancelX() 
  begin
    sleep 1
    $browser.a(:text => "NEW MONITOR").when_present.click
    $browser.text_field(:xpath, "//input[@placeholder='Enter Monitor Name']").when_present.set("New Monitors Cancel X")
    $browser.div(:xpath, "//div[@class='closebtn pull-right']").when_present.click
    xt_assertElementDoesntExists('xt_monitors_createMonitor_cancelX', "New Monitors Cancel X")
    xt_ScreenCapture("xt_monitors_createMonitor_cancelX")
  rescue 
    xt_increment_failed("xt_monitors_createMonitor_cancelX")
    xt_ScreenCapture("xt_monitors_createMonitor_cancelX_failedMethodBlock")
  end 
end

def xt_monitors_createMonitorBadName() 
  begin
    sleep 1
    monitorName = SecureRandom.base64
    $browser.a(:text => "NEW MONITOR").when_present.click
    $browser.text_field(:xpath, "//input[@placeholder='Enter Monitor Name']").when_present.set(monitorName)
    $browser.div(:class => "modal-footer xy-clear-both ng-scope").button(:text => 'CREATE MONITOR').when_present.click
    xt_assertElementExists('xt_monitors_createMonitorBadName', "Name contains illegal characters")
    xt_ScreenCapture("xt_monitors_createMonitorBadName")
    $browser.button(:xpath, "//button[@ng-click='cancel()']").when_present.click
  rescue 
    xt_increment_failed("xt_monitors_createMonitorBadName")
    xt_ScreenCapture("xt_monitors_createMonitorBadName_failedMethodBlock")
  end  
end

def xt_monitors_createMonitorNoType() 
  begin
    sleep 1
    monitorName = "NewMonitor " + SecureRandom.hex(3)
    $browser.a(:text => "NEW MONITOR").when_present.click
    $browser.text_field(:xpath, "//input[@placeholder='Enter Monitor Name']").when_present.set(monitorName)
    $browser.div(:class => "modal-footer xy-clear-both ng-scope").button(:text => 'CREATE MONITOR').when_present.click
    xt_assertElementExists('xt_monitors_createMonitorNoType', "Select the type of monitor from the list")
    xt_ScreenCapture("xt_monitors_createMonitorNoType")
    $browser.button(:xpath, "//button[@ng-click='cancel()']").when_present.click
  rescue 
    xt_increment_failed("xt_monitors_createMonitorNoType")
    xt_ScreenCapture("xt_monitors_createMonitorNoType_failedMethodBlock")
  end  
end

def xt_monitors_createMonitor_saveAs() 
  begin
    sleep 1
    monitorName = "NewMonitorAuditPool " + SecureRandom.hex(3)
    $browser.a(:text => "NEW MONITOR").when_present.click
    $browser.text_field(:xpath, "//input[@placeholder='Enter Monitor Name']").when_present.set(monitorName)
    $browser.div(:xpath, "//div[@id='entityTypeNameInModal']").when_present.click
    $browser.div(:class => "dropdown xy-dropdown xy-form-dropdown-container entity-type-dropdown").ul(:class => 'dropdown-menu xy-dropdown-menu group-dropdown-list').a(:text => 'AuditPool').when_present.click
    $browser.div(:class => "modal-footer xy-clear-both ng-scope").button(:text => 'CREATE MONITOR').when_present.click
    sleep 2
    $browser.div(:class => "col-xs-5 xySummaryDirtyBitButtonContainer").button(:text => 'SAVE AS').when_present.click
    $browser.text_field(:xpath, "//input[@ng-model='monitorInformation.monitorName']").when_present.set(monitorName)
    $browser.button(:xpath, "//button[contains(.,'SAVE MONITOR')]").when_present.click
    xt_assertElementExists('xt_monitors_createMonitor_saveAs', "#{monitorName}")
    xt_ScreenCapture("xt_monitors_createMonitor_saveAs")
  rescue 
    xt_increment_failed("xt_monitors_createMonitor_saveAs")
    xt_ScreenCapture("xt_monitors_createMonitor_saveAs_failedMethodBlock")
  end    
end

def xt_monitors_createMonitor_reset() 
  begin
    sleep 1
    monitorName = "NewMonitorAuditPool " + SecureRandom.hex(3)
    $browser.a(:text => "NEW MONITOR").when_present.click
    $browser.text_field(:xpath, "//input[@placeholder='Enter Monitor Name']").when_present.set(monitorName)
    $browser.div(:xpath, "//div[@id='entityTypeNameInModal']").when_present.click
    $browser.div(:class => "dropdown xy-dropdown xy-form-dropdown-container entity-type-dropdown").ul(:class => 'dropdown-menu xy-dropdown-menu group-dropdown-list').a(:text => 'AuditPool').when_present.click
    $browser.div(:class => "modal-footer xy-clear-both ng-scope").button(:text => 'CREATE MONITOR').when_present.click
    sleep 2
    $browser.checkbox(:xpath, "//input[@name='active']").when_present.set
    $browser.checkbox(:xpath, "//input[@name='alertOnMissing']").when_present.set
    $browser.checkbox(:xpath, "//input[@name='alertOnNew']").when_present.set
    c = $browser.checkbox(:xpath, "//input[@name='alertOnNew']")
    $browser.div(:class => "col-xs-5 xySummaryDirtyBitButtonContainer").button(:text => 'RESET').when_present.click
    if c.set?
      xt_assertFailed('xt_monitors_createMonitor_reset', "#{c}")
    else
      xt_assertPassed('xt_monitors_createMonitor_reset', "#{c}")  
    end
    xt_ScreenCapture("xt_monitors_createMonitor_reset")
    $browser.div(:class => "col-xs-5 xySummaryDirtyBitButtonContainer").button(:text => 'SAVE').when_present.click
  rescue 
    xt_increment_failed("xt_monitors_createMonitor_reset")
    xt_ScreenCapture("xt_monitors_createMonitor_reset_failedMethodBlock")
  end    
end

def xt_monitors_createMonitor_auditPool() 
  begin
    sleep 1
    $auditPoolMonitorName = "NewMonitorAuditPool " + SecureRandom.hex(3)
    $browser.a(:text => "NEW MONITOR").when_present.click
    $browser.text_field(:xpath, "//input[@placeholder='Enter Monitor Name']").when_present.set($auditPoolMonitorName)
    $browser.div(:xpath, "//div[@id='entityTypeNameInModal']").when_present.click
    $browser.div(:class => "dropdown xy-dropdown xy-form-dropdown-container entity-type-dropdown").ul(:class => 'dropdown-menu xy-dropdown-menu group-dropdown-list').a(:text => 'AuditPool').when_present.click
    $browser.div(:class => "modal-footer xy-clear-both ng-scope").button(:text => 'CREATE MONITOR').when_present.click
    sleep 2
    $browser.div(:class => "col-xs-5 xySummaryDirtyBitButtonContainer").button(:text => 'SAVE').when_present.click
    xt_assertElementExists('xt_monitors_createMonitor_auditPool', "#{$auditPoolMonitorName}")
    xt_ScreenCapture("xt_monitors_createMonitor_auditPool")
  rescue 
    xt_increment_failed("xt_monitors_createMonitor_auditPool")
    xt_ScreenCapture("xt_monitors_createMonitor_auditPool_failedMethodBlock")
  end  
end

def xt_monitors_createMonitor_auditService() 
  begin
    sleep 1
    monitorName = "NewMonitorAuditService " + SecureRandom.hex(3)
    $browser.a(:text => "NEW MONITOR").when_present.click
    $browser.text_field(:xpath, "//input[@placeholder='Enter Monitor Name']").when_present.set(monitorName)
    $browser.div(:xpath, "//div[@id='entityTypeNameInModal']").when_present.click
    $browser.div(:class => "dropdown xy-dropdown xy-form-dropdown-container entity-type-dropdown").ul(:class => 'dropdown-menu xy-dropdown-menu group-dropdown-list').a(:text => 'AuditService').when_present.click
    $browser.div(:class => "modal-footer xy-clear-both ng-scope").button(:text => 'CREATE MONITOR').when_present.click
    sleep 2
    $browser.div(:class => "col-xs-5 xySummaryDirtyBitButtonContainer").button(:text => 'SAVE').when_present.click
    xt_assertElementExists('xt_monitors_createMonitor_auditService', "#{monitorName}")
    xt_ScreenCapture("xt_monitors_createMonitor_auditService")
  rescue 
    xt_increment_failed("xt_monitors_createMonitor_auditService")
    xt_ScreenCapture("xt_monitors_createMonitor_auditService_failedMethodBlock")
  end   
end

def xt_monitors_createMonitor_device() 
  begin
    sleep 1
    monitorName = "NewMonitorDevice " + SecureRandom.hex(3)
    $browser.a(:text => "NEW MONITOR").when_present.click
    $browser.text_field(:xpath, "//input[@placeholder='Enter Monitor Name']").when_present.set(monitorName)
    $browser.div(:xpath, "//div[@id='entityTypeNameInModal']").when_present.click
    $browser.div(:class => "dropdown xy-dropdown xy-form-dropdown-container entity-type-dropdown").ul(:class => 'dropdown-menu xy-dropdown-menu group-dropdown-list').a(:text => 'Device').when_present.click
    $browser.div(:class => "modal-footer xy-clear-both ng-scope").button(:text => 'CREATE MONITOR').when_present.click
    sleep 2
    $browser.div(:class => "col-xs-5 xySummaryDirtyBitButtonContainer").button(:text => 'SAVE').when_present.click
    xt_assertElementExists('xt_monitors_createMonitor_device', "#{monitorName}")
    xt_ScreenCapture("xt_monitors_createMonitor_device")
  rescue 
    xt_increment_failed("xt_monitors_createMonitor_device")
    xt_ScreenCapture("xt_monitors_createMonitor_device_failedMethodBlock")
  end    
end

def xt_monitors_createMonitor_deviceAcl() 
  begin
    sleep 1
    monitorName = "NewMonitorDeviceAcl " + SecureRandom.hex(3)
    $browser.a(:text => "NEW MONITOR").when_present.click
    $browser.text_field(:xpath, "//input[@placeholder='Enter Monitor Name']").when_present.set(monitorName)
    $browser.div(:xpath, "//div[@id='entityTypeNameInModal']").when_present.click
    $browser.div(:class => "dropdown xy-dropdown xy-form-dropdown-container entity-type-dropdown").ul(:class => 'dropdown-menu xy-dropdown-menu group-dropdown-list').a(:text => 'DeviceAcl').when_present.click
    $browser.div(:class => "modal-footer xy-clear-both ng-scope").button(:text => 'CREATE MONITOR').when_present.click
    sleep 2
    $browser.div(:class => "col-xs-5 xySummaryDirtyBitButtonContainer").button(:text => 'SAVE').when_present.click
    xt_assertElementExists('xt_monitors_createMonitor_deviceAcl', "#{monitorName}")
    xt_ScreenCapture("xt_monitors_createMonitor_deviceAcl")
  rescue 
    xt_increment_failed("xt_monitors_createMonitor_deviceAcl")
    xt_ScreenCapture("xt_monitors_createMonitor_deviceAcl_failedMethodBlock")
  end    
end

def xt_monitors_createMonitor_diskFile() 
  begin
    sleep 1
    monitorName = "NewMonitorDiskFile " + SecureRandom.hex(3)
    $browser.a(:text => "NEW MONITOR").when_present.click
    $browser.text_field(:xpath, "//input[@placeholder='Enter Monitor Name']").when_present.set(monitorName)
    $browser.div(:xpath, "//div[@id='entityTypeNameInModal']").when_present.click
    $browser.div(:class => "dropdown xy-dropdown xy-form-dropdown-container entity-type-dropdown").ul(:class => 'dropdown-menu xy-dropdown-menu group-dropdown-list').a(:text => 'DiskFile').when_present.click
    $browser.div(:class => "modal-footer xy-clear-both ng-scope").button(:text => 'CREATE MONITOR').when_present.click
    sleep 2
    $browser.div(:class => "col-xs-5 xySummaryDirtyBitButtonContainer").button(:text => 'SAVE').when_present.click
    xt_assertElementExists('xt_monitors_createMonitor_diskFile', "#{monitorName}")
    xt_ScreenCapture("xt_monitors_createMonitor_diskFile")
  rescue 
    xt_increment_failed("xt_monitors_createMonitor_diskFile")
    xt_ScreenCapture("xt_monitors_createMonitor_diskFile_failedMethodBlock")
  end   
end

def xt_monitors_createMonitor_diskFileAcl() 
  begin
    sleep 1
    monitorName = "NewMonitorDiskFileAcl " + SecureRandom.hex(3)
    $browser.a(:text => "NEW MONITOR").when_present.click
    $browser.text_field(:xpath, "//input[@placeholder='Enter Monitor Name']").when_present.set(monitorName)
    $browser.div(:xpath, "//div[@id='entityTypeNameInModal']").when_present.click
    $browser.div(:class => "dropdown xy-dropdown xy-form-dropdown-container entity-type-dropdown").ul(:class => 'dropdown-menu xy-dropdown-menu group-dropdown-list').a(:text => 'DiskFileAcl').when_present.click
    $browser.div(:class => "modal-footer xy-clear-both ng-scope").button(:text => 'CREATE MONITOR').when_present.click
    sleep 2
    $browser.div(:class => "col-xs-5 xySummaryDirtyBitButtonContainer").button(:text => 'SAVE').when_present.click
    xt_assertElementExists('xt_monitors_createMonitor_diskFileAcl', "#{monitorName}")
    xt_ScreenCapture("xt_monitors_createMonitor_diskFileAcl")
  rescue 
    xt_increment_failed("xt_monitors_createMonitor_diskFileAcl")
    xt_ScreenCapture("xt_monitors_createMonitor_diskFileAcl_failedMethodBlock")
  end    
end

def xt_monitors_createMonitor_diskFilePattern() 
  begin
    sleep 1
    monitorName = "NewMonitorDiskFilePattern " + SecureRandom.hex(3)
    $browser.a(:text => "NEW MONITOR").when_present.click
    $browser.text_field(:xpath, "//input[@placeholder='Enter Monitor Name']").when_present.set(monitorName)
    $browser.div(:xpath, "//div[@id='entityTypeNameInModal']").when_present.click
    $browser.div(:class => "dropdown xy-dropdown xy-form-dropdown-container entity-type-dropdown").ul(:class => 'dropdown-menu xy-dropdown-menu group-dropdown-list').a(:text => 'DiskFilePattern').when_present.click
    $browser.div(:class => "modal-footer xy-clear-both ng-scope").button(:text => 'CREATE MONITOR').when_present.click
    sleep 2
    $browser.div(:class => "col-xs-5 xySummaryDirtyBitButtonContainer").button(:text => 'SAVE').when_present.click
    xt_assertElementExists('xt_monitors_createMonitor_diskFilePattern', "#{monitorName}")
    xt_ScreenCapture("xt_monitors_createMonitor_diskFilePattern")
  rescue 
    xt_increment_failed("xt_monitors_createMonitor_diskFilePattern")
    xt_ScreenCapture("xt_monitors_createMonitor_diskFilePattern_failedMethodBlock")
  end   
end

def xt_monitors_createMonitor_diskFilePatternAcl() 
  begin
    sleep 1
    monitorName = "NewMonitorDiskFilePatternAcl " + SecureRandom.hex(3)
    $browser.a(:text => "NEW MONITOR").when_present.click
    $browser.text_field(:xpath, "//input[@placeholder='Enter Monitor Name']").when_present.set(monitorName)
    $browser.div(:xpath, "//div[@id='entityTypeNameInModal']").when_present.click
    $browser.div(:class => "dropdown xy-dropdown xy-form-dropdown-container entity-type-dropdown").ul(:class => 'dropdown-menu xy-dropdown-menu group-dropdown-list').a(:text => 'DiskFilePatternAcl').when_present.click
    $browser.div(:class => "modal-footer xy-clear-both ng-scope").button(:text => 'CREATE MONITOR').when_present.click
    sleep 2
    $browser.div(:class => "col-xs-5 xySummaryDirtyBitButtonContainer").button(:text => 'SAVE').when_present.click
    xt_assertElementExists('xt_monitors_createMonitor_diskFilePatternAcl', "#{monitorName}")
    xt_ScreenCapture("xt_monitors_createMonitor_diskFilePatternAcl")
  rescue 
    xt_increment_failed("xt_monitors_createMonitor_diskFilePatternAcl")
    xt_ScreenCapture("xt_monitors_createMonitor_diskFilePatternAcl_failedMethodBlock")
  end    
end

def xt_monitors_createMonitor_DPAcl() 
  begin
    sleep 1
    monitorName = "NewMonitorDPAcl " + SecureRandom.hex(3)
    $browser.a(:text => "NEW MONITOR").when_present.click
    $browser.text_field(:xpath, "//input[@placeholder='Enter Monitor Name']").when_present.set(monitorName)
    $browser.div(:xpath, "//div[@id='entityTypeNameInModal']").when_present.click
    $browser.div(:class => "dropdown xy-dropdown xy-form-dropdown-container entity-type-dropdown").ul(:class => 'dropdown-menu xy-dropdown-menu group-dropdown-list').a(:text => 'DPAcl').when_present.click
    $browser.div(:class => "modal-footer xy-clear-both ng-scope").button(:text => 'CREATE MONITOR').when_present.click
    sleep 2
    $browser.div(:class => "col-xs-5 xySummaryDirtyBitButtonContainer").button(:text => 'SAVE').when_present.click
    xt_assertElementExists('xt_monitors_createMonitor_DPAcl', "#{monitorName}")
    xt_ScreenCapture("xt_monitors_createMonitor_DPAcl")
  rescue 
    xt_increment_failed("xt_monitors_createMonitor_DPAcl")
    xt_ScreenCapture("xt_monitors_createMonitor_DPAcl_failedMethodBlock")
  end    
end

def xt_monitors_createMonitor_globals() 
  begin
    sleep 1
    monitorName = "NewMonitorGlobals " + SecureRandom.hex(3)
    $browser.a(:text => "NEW MONITOR").when_present.click
    $browser.text_field(:xpath, "//input[@placeholder='Enter Monitor Name']").when_present.set(monitorName)
    $browser.div(:xpath, "//div[@id='entityTypeNameInModal']").when_present.click
    $browser.div(:class => "dropdown xy-dropdown xy-form-dropdown-container entity-type-dropdown").ul(:class => 'dropdown-menu xy-dropdown-menu group-dropdown-list').a(:text => 'Globals').when_present.click
    $browser.div(:class => "modal-footer xy-clear-both ng-scope").button(:text => 'CREATE MONITOR').when_present.click
    sleep 2
    $browser.div(:class => "col-xs-5 xySummaryDirtyBitButtonContainer").button(:text => 'SAVE').when_present.click
    xt_assertElementExists('xt_monitors_createMonitor_globals', "#{monitorName}")
    xt_ScreenCapture("xt_monitors_createMonitor_globals")
  rescue 
    xt_increment_failed("xt_monitors_createMonitor_globals")
    xt_ScreenCapture("xt_monitors_createMonitor_globals_failedMethodBlock")
  end    
end

def xt_monitors_createMonitor_group() 
  begin
    sleep 1
    monitorName = "NewMonitorGroup " + SecureRandom.hex(3)
    $browser.a(:text => "NEW MONITOR").when_present.click
    $browser.text_field(:xpath, "//input[@placeholder='Enter Monitor Name']").when_present.set(monitorName)
    $browser.div(:xpath, "//div[@id='entityTypeNameInModal']").when_present.click
    $browser.div(:class => "dropdown xy-dropdown xy-form-dropdown-container entity-type-dropdown").ul(:class => 'dropdown-menu xy-dropdown-menu group-dropdown-list').a(:text => 'Group').when_present.click
    $browser.div(:class => "modal-footer xy-clear-both ng-scope").button(:text => 'CREATE MONITOR').when_present.click
    sleep 2
    $browser.div(:class => "col-xs-5 xySummaryDirtyBitButtonContainer").button(:text => 'SAVE').when_present.click
    xt_assertElementExists('xt_monitors_createMonitor_group', "#{monitorName}")
    xt_ScreenCapture("xt_monitors_createMonitor_group")
  rescue 
    xt_increment_failed("xt_monitors_createMonitor_group")
    xt_ScreenCapture("xt_monitors_createMonitor_group_failedMethodBlock")
  end   
end

def xt_monitors_createMonitor_groupMember() 
  begin
    sleep 1
    monitorName = "NewMonitorGroupMember " + SecureRandom.hex(3)
    $browser.a(:text => "NEW MONITOR").when_present.click
    $browser.text_field(:xpath, "//input[@placeholder='Enter Monitor Name']").when_present.set(monitorName)
    $browser.div(:xpath, "//div[@id='entityTypeNameInModal']").when_present.click
    $browser.div(:class => "dropdown xy-dropdown xy-form-dropdown-container entity-type-dropdown").ul(:class => 'dropdown-menu xy-dropdown-menu group-dropdown-list').a(:text => 'GroupMember').when_present.click
    $browser.div(:class => "modal-footer xy-clear-both ng-scope").button(:text => 'CREATE MONITOR').when_present.click
    sleep 2
    $browser.div(:class => "col-xs-5 xySummaryDirtyBitButtonContainer").button(:text => 'SAVE').when_present.click
    xt_assertElementExists('xt_monitors_createMonitor_groupMember', "#{monitorName}")
    xt_ScreenCapture("xt_monitors_createMonitor_groupMember")
  rescue 
    xt_increment_failed("xt_monitors_createMonitor_groupMember")
    xt_ScreenCapture("xt_monitors_createMonitor_groupMember_failedMethodBlock")
  end    
end

def xt_monitors_createMonitor_groupOwner() 
  begin
    sleep 1
    monitorName = "NewMonitorGroupOwner " + SecureRandom.hex(3)
    $browser.a(:text => "NEW MONITOR").when_present.click
    $browser.text_field(:xpath, "//input[@placeholder='Enter Monitor Name']").when_present.set(monitorName)
    $browser.div(:xpath, "//div[@id='entityTypeNameInModal']").when_present.click
    $browser.div(:class => "dropdown xy-dropdown xy-form-dropdown-container entity-type-dropdown").ul(:class => 'dropdown-menu xy-dropdown-menu group-dropdown-list').a(:text => 'GroupOwner').when_present.click
    $browser.div(:class => "modal-footer xy-clear-both ng-scope").button(:text => 'CREATE MONITOR').when_present.click
    sleep 2
    $browser.div(:class => "col-xs-5 xySummaryDirtyBitButtonContainer").button(:text => 'SAVE').when_present.click
    xt_assertElementExists('xt_monitors_createMonitor_groupOwner', "#{monitorName}")
    xt_ScreenCapture("xt_monitors_createMonitor_groupOwner")
  rescue 
    xt_increment_failed("xt_monitors_createMonitor_groupOwner")
    xt_ScreenCapture("xt_monitors_createMonitor_groupOwner_failedMethodBlock")
  end    
end

def xt_monitors_createMonitor_guardianFile() 
  begin
    sleep 1
    monitorName = "NewMonitorGuardianFile " + SecureRandom.hex(3)
    $browser.a(:text => "NEW MONITOR").when_present.click
    $browser.text_field(:xpath, "//input[@placeholder='Enter Monitor Name']").when_present.set(monitorName)
    $browser.div(:xpath, "//div[@id='entityTypeNameInModal']").when_present.click
    $browser.div(:class => "dropdown xy-dropdown xy-form-dropdown-container entity-type-dropdown").ul(:class => 'dropdown-menu xy-dropdown-menu group-dropdown-list').a(:text => 'GuardianFile').when_present.click
    $browser.div(:class => "modal-footer xy-clear-both ng-scope").button(:text => 'CREATE MONITOR').when_present.click
    sleep 2
    $browser.div(:class => "col-xs-5 xySummaryDirtyBitButtonContainer").button(:text => 'SAVE').when_present.click
    xt_assertElementExists('xt_monitors_createMonitor_guardianFile', "#{monitorName}")
    xt_ScreenCapture("xt_monitors_createMonitor_guardianFile")
  rescue 
    xt_increment_failed("xt_monitors_createMonitor_guardianFile")
    xt_ScreenCapture("xt_monitors_createMonitor_guardianFile_failedMethodBlock")
  end     
end

def xt_monitors_createMonitor_objectType() 
  begin
    sleep 1
    monitorName = "NewMonitorObjectType " + SecureRandom.hex(3)
    $browser.a(:text => "NEW MONITOR").when_present.click
    $browser.text_field(:xpath, "//input[@placeholder='Enter Monitor Name']").when_present.set(monitorName)
    $browser.div(:xpath, "//div[@id='entityTypeNameInModal']").when_present.click
    $browser.div(:class => "dropdown xy-dropdown xy-form-dropdown-container entity-type-dropdown").ul(:class => 'dropdown-menu xy-dropdown-menu group-dropdown-list').a(:text => 'ObjectType').when_present.click
    $browser.div(:class => "modal-footer xy-clear-both ng-scope").button(:text => 'CREATE MONITOR').when_present.click
    sleep 2
    $browser.div(:class => "col-xs-5 xySummaryDirtyBitButtonContainer").button(:text => 'SAVE').when_present.click
    xt_assertElementExists('xt_monitors_createMonitor_objectType', "#{monitorName}")
    xt_ScreenCapture("xt_monitors_createMonitor_objectType")
  rescue 
    xt_increment_failed("xt_monitors_createMonitor_objectType")
    xt_ScreenCapture("xt_monitors_createMonitor_objectType_failedMethodBlock")
  end     
end

def xt_monitors_createMonitor_objectTypeAcl() 
  begin
    sleep 1
    monitorName = "NewMonitorObjectTypeAcl " + SecureRandom.hex(3)
    $browser.a(:text => "NEW MONITOR").when_present.click
    $browser.text_field(:xpath, "//input[@placeholder='Enter Monitor Name']").when_present.set(monitorName)
    $browser.div(:xpath, "//div[@id='entityTypeNameInModal']").when_present.click
    $browser.div(:class => "dropdown xy-dropdown xy-form-dropdown-container entity-type-dropdown").ul(:class => 'dropdown-menu xy-dropdown-menu group-dropdown-list').a(:text => 'ObjectTypeAcl').when_present.click
    $browser.div(:class => "modal-footer xy-clear-both ng-scope").button(:text => 'CREATE MONITOR').when_present.click
    sleep 2
    $browser.div(:class => "col-xs-5 xySummaryDirtyBitButtonContainer").button(:text => 'SAVE').when_present.click
    xt_assertElementExists('xt_monitors_createMonitor_objectTypeAcl', "#{monitorName}")
    xt_ScreenCapture("xt_monitors_createMonitor_objectTypeAcl")
  rescue 
    xt_increment_failed("xt_monitors_createMonitor_objectTypeAcl")
    xt_ScreenCapture("xt_monitors_createMonitor_objectTypeAcl_failedMethodBlock")
  end     
end

def xt_monitors_createMonitor_owner() 
  begin
    sleep 1
    monitorName = "NewMonitorOwner " + SecureRandom.hex(3)
    $browser.a(:text => "NEW MONITOR").when_present.click
    $browser.text_field(:xpath, "//input[@placeholder='Enter Monitor Name']").when_present.set(monitorName)
    $browser.div(:xpath, "//div[@id='entityTypeNameInModal']").when_present.click
    $browser.div(:class => "dropdown xy-dropdown xy-form-dropdown-container entity-type-dropdown").ul(:class => 'dropdown-menu xy-dropdown-menu group-dropdown-list').a(:text => 'Owner').when_present.click
    $browser.div(:class => "modal-footer xy-clear-both ng-scope").button(:text => 'CREATE MONITOR').when_present.click
    sleep 2
    $browser.div(:class => "col-xs-5 xySummaryDirtyBitButtonContainer").button(:text => 'SAVE').when_present.click
    xt_assertElementExists('xt_monitors_createMonitor_owner', "#{monitorName}")
    xt_ScreenCapture("xt_monitors_createMonitor_owner")
  rescue 
    xt_increment_failed("xt_monitors_createMonitor_owner")
    xt_ScreenCapture("xt_monitors_createMonitor_owner_failedMethodBlock")
  end     
end

def xt_monitors_createMonitor_process() 
  begin
    sleep 1
    monitorName = "NewMonitorProcess " + SecureRandom.hex(3)
    $browser.a(:text => "NEW MONITOR").when_present.click
    $browser.text_field(:xpath, "//input[@placeholder='Enter Monitor Name']").when_present.set(monitorName)
    $browser.div(:xpath, "//div[@id='entityTypeNameInModal']").when_present.click
    $browser.div(:class => "dropdown xy-dropdown xy-form-dropdown-container entity-type-dropdown").ul(:class => 'dropdown-menu xy-dropdown-menu group-dropdown-list').a(:text => 'Process').when_present.click
    $browser.div(:class => "modal-footer xy-clear-both ng-scope").button(:text => 'CREATE MONITOR').when_present.click
    sleep 2
    $browser.div(:class => "col-xs-5 xySummaryDirtyBitButtonContainer").button(:text => 'SAVE').when_present.click
    xt_assertElementExists('xt_monitors_createMonitor_process', "#{monitorName}")
    xt_ScreenCapture("xt_monitors_createMonitor_process")
  rescue 
    xt_increment_failed("xt_monitors_createMonitor_process")
    xt_ScreenCapture("xt_monitors_createMonitor_process_failedMethodBlock")
  end     
end

def xt_monitors_createMonitor_processAcl() 
  begin
    sleep 1
    monitorName = "NewMonitorProcessAcl " + SecureRandom.hex(3)
    $browser.a(:text => "NEW MONITOR").when_present.click
    $browser.text_field(:xpath, "//input[@placeholder='Enter Monitor Name']").when_present.set(monitorName)
    $browser.div(:xpath, "//div[@id='entityTypeNameInModal']").when_present.click
    $browser.div(:class => "dropdown xy-dropdown xy-form-dropdown-container entity-type-dropdown").ul(:class => 'dropdown-menu xy-dropdown-menu group-dropdown-list').a(:text => 'ProcessAcl').when_present.click
    $browser.div(:class => "modal-footer xy-clear-both ng-scope").button(:text => 'CREATE MONITOR').when_present.click
    sleep 2
    $browser.div(:class => "col-xs-5 xySummaryDirtyBitButtonContainer").button(:text => 'SAVE').when_present.click
    xt_assertElementExists('xt_monitors_createMonitor_processAcl', "#{monitorName}")
    xt_ScreenCapture("xt_monitors_createMonitor_processAcl")
  rescue 
    xt_increment_failed("xt_monitors_createMonitor_processAcl")
    xt_ScreenCapture("xt_monitors_createMonitor_processAcl_failedMethodBlock")
  end     
end

def xt_monitors_createMonitor_remotePassword() 
  begin
    sleep 1
    monitorName = "NewMonitorRemotePassword " + SecureRandom.hex(3)
    $browser.a(:text => "NEW MONITOR").when_present.click
    $browser.text_field(:xpath, "//input[@placeholder='Enter Monitor Name']").when_present.set(monitorName)
    $browser.div(:xpath, "//div[@id='entityTypeNameInModal']").when_present.click
    $browser.div(:class => "dropdown xy-dropdown xy-form-dropdown-container entity-type-dropdown").ul(:class => 'dropdown-menu xy-dropdown-menu group-dropdown-list').a(:text => 'RemotePassword').when_present.click
    $browser.div(:class => "modal-footer xy-clear-both ng-scope").button(:text => 'CREATE MONITOR').when_present.click
    sleep 2
    $browser.div(:class => "col-xs-5 xySummaryDirtyBitButtonContainer").button(:text => 'SAVE').when_present.click
    xt_assertElementExists('xt_monitors_createMonitor_remotePassword', "#{monitorName}")
    xt_ScreenCapture("xt_monitors_createMonitor_remotePassword")
  rescue 
    xt_increment_failed("xt_monitors_createMonitor_remotePassword")
    xt_ScreenCapture("xt_monitors_createMonitor_remotePassword_failedMethodBlock")
  end     
end

def xt_monitors_createMonitor_securityGroup() 
  begin
    sleep 1
    monitorName = "NewMonitorSecurityGroup " + SecureRandom.hex(3)
    $browser.a(:text => "NEW MONITOR").when_present.click
    $browser.text_field(:xpath, "//input[@placeholder='Enter Monitor Name']").when_present.set(monitorName)
    $browser.div(:xpath, "//div[@id='entityTypeNameInModal']").when_present.click
    $browser.div(:class => "dropdown xy-dropdown xy-form-dropdown-container entity-type-dropdown").ul(:class => 'dropdown-menu xy-dropdown-menu group-dropdown-list').a(:text => 'SecurityGroup').when_present.click
    $browser.div(:class => "modal-footer xy-clear-both ng-scope").button(:text => 'CREATE MONITOR').when_present.click
    sleep 2
    $browser.div(:class => "col-xs-5 xySummaryDirtyBitButtonContainer").button(:text => 'SAVE').when_present.click
    xt_assertElementExists('xt_monitors_createMonitor_securityGroup', "#{monitorName}")
    xt_ScreenCapture("xt_monitors_createMonitor_securityGroup")
  rescue 
    xt_increment_failed("xt_monitors_createMonitor_securityGroup")
    xt_ScreenCapture("xt_monitors_createMonitor_securityGroup_failedMethodBlock")
  end     
end

def xt_monitors_createMonitor_seep() 
  begin
    sleep 1
    monitorName = "NewMonitorSeep " + SecureRandom.hex(3)
    $browser.a(:text => "NEW MONITOR").when_present.click
    $browser.text_field(:xpath, "//input[@placeholder='Enter Monitor Name']").when_present.set(monitorName)
    $browser.div(:xpath, "//div[@id='entityTypeNameInModal']").when_present.click
    $browser.div(:class => "dropdown xy-dropdown xy-form-dropdown-container entity-type-dropdown").ul(:class => 'dropdown-menu xy-dropdown-menu group-dropdown-list').a(:text => 'Seep').when_present.click
    $browser.div(:class => "modal-footer xy-clear-both ng-scope").button(:text => 'CREATE MONITOR').when_present.click
    sleep 2
    $browser.div(:class => "col-xs-5 xySummaryDirtyBitButtonContainer").button(:text => 'SAVE').when_present.click
    xt_assertElementExists('xt_monitors_createMonitor_seep', "#{monitorName}")
    xt_ScreenCapture("xt_monitors_createMonitor_seep")
  rescue 
    xt_increment_failed("xt_monitors_createMonitor_seep")
    xt_ScreenCapture("xt_monitors_createMonitor_seep_failedMethodBlock")
  end     
end

def xt_monitors_createMonitor_subDevice() 
  begin
    sleep 1
    monitorName = "NewMonitorSubDevice " + SecureRandom.hex(3)
    $browser.a(:text => "NEW MONITOR").when_present.click
    $browser.text_field(:xpath, "//input[@placeholder='Enter Monitor Name']").when_present.set(monitorName)
    $browser.div(:xpath, "//div[@id='entityTypeNameInModal']").when_present.click
    $browser.div(:class => "dropdown xy-dropdown xy-form-dropdown-container entity-type-dropdown").ul(:class => 'dropdown-menu xy-dropdown-menu group-dropdown-list').a(:text => 'Subdevice').when_present.click
    $browser.div(:class => "modal-footer xy-clear-both ng-scope").button(:text => 'CREATE MONITOR').when_present.click
    sleep 2
    $browser.div(:class => "col-xs-5 xySummaryDirtyBitButtonContainer").button(:text => 'SAVE').when_present.click
    xt_assertElementExists('xt_monitors_createMonitor_subDevice', "#{monitorName}")
    xt_ScreenCapture("xt_monitors_createMonitor_subDevice")
  rescue 
    xt_increment_failed("xt_monitors_createMonitor_subDevice")
    xt_ScreenCapture("xt_monitors_createMonitor_subDevice_failedMethodBlock")
  end     
end

def xt_monitors_createMonitor_subDeviceAcl() 
  begin
    sleep 1
    monitorName = "NewMonitorSubDeviceAcl " + SecureRandom.hex(3)
    $browser.a(:text => "NEW MONITOR").when_present.click
    $browser.text_field(:xpath, "//input[@placeholder='Enter Monitor Name']").when_present.set(monitorName)
    $browser.div(:xpath, "//div[@id='entityTypeNameInModal']").when_present.click
    $browser.div(:class => "dropdown xy-dropdown xy-form-dropdown-container entity-type-dropdown").ul(:class => 'dropdown-menu xy-dropdown-menu group-dropdown-list').a(:text => 'SubdeviceAcl').when_present.click
    $browser.div(:class => "modal-footer xy-clear-both ng-scope").button(:text => 'CREATE MONITOR').when_present.click
    sleep 2
    $browser.div(:class => "col-xs-5 xySummaryDirtyBitButtonContainer").button(:text => 'SAVE').when_present.click
    xt_assertElementExists('xt_monitors_createMonitor_subDeviceAcl', "#{monitorName}")
    xt_ScreenCapture("xt_monitors_createMonitor_subDeviceAcl")
  rescue 
    xt_increment_failed("xt_monitors_createMonitor_subDeviceAcl")
    xt_ScreenCapture("xt_monitors_createMonitor_subDeviceAcl_failedMethodBlock")
  end     
end

def xt_monitors_createMonitor_subProcess() 
  begin
    sleep 1
    monitorName = "NewMonitorSubProcess " + SecureRandom.hex(3)
    $browser.a(:text => "NEW MONITOR").when_present.click
    $browser.text_field(:xpath, "//input[@placeholder='Enter Monitor Name']").when_present.set(monitorName)
    $browser.div(:xpath, "//div[@id='entityTypeNameInModal']").when_present.click
    $browser.div(:class => "dropdown xy-dropdown xy-form-dropdown-container entity-type-dropdown").ul(:class => 'dropdown-menu xy-dropdown-menu group-dropdown-list').a(:text => 'Subprocess').when_present.click
    $browser.div(:class => "modal-footer xy-clear-both ng-scope").button(:text => 'CREATE MONITOR').when_present.click
    sleep 2
    $browser.div(:class => "col-xs-5 xySummaryDirtyBitButtonContainer").button(:text => 'SAVE').when_present.click
    xt_assertElementExists('xt_monitors_createMonitor_subProcess', "#{monitorName}")
    xt_ScreenCapture("xt_monitors_createMonitor_subProcess")
  rescue 
    xt_increment_failed("xt_monitors_createMonitor_subProcess")
    xt_ScreenCapture("xt_monitors_createMonitor_subProcess_failedMethodBlock")
  end     
end

def xt_monitors_createMonitor_subProcessAcl() 
  begin
    sleep 1
    monitorName = "NewMonitorSubProcessAcl " + SecureRandom.hex(3)
    $browser.a(:text => "NEW MONITOR").when_present.click
    $browser.text_field(:xpath, "//input[@placeholder='Enter Monitor Name']").when_present.set(monitorName)
    $browser.div(:xpath, "//div[@id='entityTypeNameInModal']").when_present.click
    $browser.div(:class => "dropdown xy-dropdown xy-form-dropdown-container entity-type-dropdown").ul(:class => 'dropdown-menu xy-dropdown-menu group-dropdown-list').a(:text => 'SubprocessAcl').when_present.click
    $browser.div(:class => "modal-footer xy-clear-both ng-scope").button(:text => 'CREATE MONITOR').when_present.click
    sleep 2
    $browser.div(:class => "col-xs-5 xySummaryDirtyBitButtonContainer").button(:text => 'SAVE').when_present.click
    xt_assertElementExists('xt_monitors_createMonitor_subProcessAcl', "#{monitorName}")
    xt_ScreenCapture("xt_monitors_createMonitor_subProcessAcl")
  rescue 
    xt_increment_failed("xt_monitors_createMonitor_subProcessAcl")
    xt_ScreenCapture("xt_monitors_createMonitor_subProcessAcl_failedMethodBlock")
  end     
end

def xt_monitors_createMonitor_subvol() 
  begin
    sleep 1
    monitorName = "NewMonitorSubvol " + SecureRandom.hex(3)
    $browser.a(:text => "NEW MONITOR").when_present.click
    $browser.text_field(:xpath, "//input[@placeholder='Enter Monitor Name']").when_present.set(monitorName)
    $browser.div(:xpath, "//div[@id='entityTypeNameInModal']").when_present.click
    $browser.div(:class => "dropdown xy-dropdown xy-form-dropdown-container entity-type-dropdown").ul(:class => 'dropdown-menu xy-dropdown-menu group-dropdown-list').a(:text => 'Subvol').when_present.click
    $browser.div(:class => "modal-footer xy-clear-both ng-scope").button(:text => 'CREATE MONITOR').when_present.click
    sleep 2
    $browser.div(:class => "col-xs-5 xySummaryDirtyBitButtonContainer").button(:text => 'SAVE').when_present.click
    xt_assertElementExists('xt_monitors_createMonitor_subvol', "#{monitorName}")
    xt_ScreenCapture("xt_monitors_createMonitor_subvol")
  rescue 
    xt_increment_failed("xt_monitors_createMonitor_subvol")
    xt_ScreenCapture("xt_monitors_createMonitor_subvol_failedMethodBlock")
  end     
end

def xt_monitors_createMonitor_subvolAcl() 
  begin
    sleep 1
    monitorName = "NewMonitorSubvolAcl " + SecureRandom.hex(3)
    $browser.a(:text => "NEW MONITOR").when_present.click
    $browser.text_field(:xpath, "//input[@placeholder='Enter Monitor Name']").when_present.set(monitorName)
    $browser.div(:xpath, "//div[@id='entityTypeNameInModal']").when_present.click
    $browser.div(:class => "dropdown xy-dropdown xy-form-dropdown-container entity-type-dropdown").ul(:class => 'dropdown-menu xy-dropdown-menu group-dropdown-list').a(:text => 'SubvolAcl').when_present.click
    $browser.div(:class => "modal-footer xy-clear-both ng-scope").button(:text => 'CREATE MONITOR').when_present.click
    sleep 2
    $browser.div(:class => "col-xs-5 xySummaryDirtyBitButtonContainer").button(:text => 'SAVE').when_present.click
    xt_assertElementExists('xt_monitors_createMonitor_subvolAcl', "#{monitorName}")
    xt_ScreenCapture("xt_monitors_createMonitor_subvolAcl")
  rescue 
    xt_increment_failed("xt_monitors_createMonitor_subvolAcl")
    xt_ScreenCapture("xt_monitors_createMonitor_subvolAcl_failedMethodBlock")
  end     
end

def xt_monitors_createMonitor_terminal() 
  begin
    sleep 1
    monitorName = "NewMonitorTerminal " + SecureRandom.hex(3)
    $browser.a(:text => "NEW MONITOR").when_present.click
    $browser.text_field(:xpath, "//input[@placeholder='Enter Monitor Name']").when_present.set(monitorName)
    $browser.div(:xpath, "//div[@id='entityTypeNameInModal']").when_present.click
    $browser.div(:class => "dropdown xy-dropdown xy-form-dropdown-container entity-type-dropdown").ul(:class => 'dropdown-menu xy-dropdown-menu group-dropdown-list').a(:text => 'Terminal').when_present.click
    $browser.div(:class => "modal-footer xy-clear-both ng-scope").button(:text => 'CREATE MONITOR').when_present.click
    sleep 2
    $browser.div(:class => "col-xs-5 xySummaryDirtyBitButtonContainer").button(:text => 'SAVE').when_present.click
    xt_assertElementExists('xt_monitors_createMonitor_terminal', "#{monitorName}")
    xt_ScreenCapture("xt_monitors_createMonitor_terminal")
  rescue 
    xt_increment_failed("xt_monitors_createMonitor_terminal")
    xt_ScreenCapture("xt_monitors_createMonitor_terminal_failedMethodBlock")
  end    
end

def xt_monitors_createMonitor_user() 
  begin
    sleep 1
    monitorName = "NewMonitorUser " + SecureRandom.hex(3)
    $browser.a(:text => "NEW MONITOR").when_present.click
    $browser.text_field(:xpath, "//input[@placeholder='Enter Monitor Name']").when_present.set(monitorName)
    $browser.div(:xpath, "//div[@id='entityTypeNameInModal']").when_present.click
    $browser.div(:class => "dropdown xy-dropdown xy-form-dropdown-container entity-type-dropdown").ul(:class => 'dropdown-menu xy-dropdown-menu group-dropdown-list').a(:text => 'User').when_present.click
    $browser.div(:class => "modal-footer xy-clear-both ng-scope").button(:text => 'CREATE MONITOR').when_present.click
    sleep 2
    $browser.div(:class => "col-xs-5 xySummaryDirtyBitButtonContainer").button(:text => 'SAVE').when_present.click
    xt_assertElementExists('xt_monitors_createMonitor_user', "#{monitorName}")
    xt_ScreenCapture("xt_monitors_createMonitor_user")
  rescue 
    xt_increment_failed("xt_monitors_createMonitor_user")
    xt_ScreenCapture("xt_monitors_createMonitor_user_failedMethodBlock")
  end    
end

def xt_monitors_createMonitor_volume() 
  begin
    sleep 1
    monitorName = "NewMonitorVolume " + SecureRandom.hex(3)
    $browser.a(:text => "NEW MONITOR").when_present.click
    $browser.text_field(:xpath, "//input[@placeholder='Enter Monitor Name']").when_present.set(monitorName)
    $browser.div(:xpath, "//div[@id='entityTypeNameInModal']").when_present.click
    $browser.div(:class => "dropdown xy-dropdown xy-form-dropdown-container entity-type-dropdown").ul(:class => 'dropdown-menu xy-dropdown-menu group-dropdown-list').a(:text => 'Volume').when_present.click
    $browser.div(:class => "modal-footer xy-clear-both ng-scope").button(:text => 'CREATE MONITOR').when_present.click
    sleep 2
    $browser.div(:class => "col-xs-5 xySummaryDirtyBitButtonContainer").button(:text => 'SAVE').when_present.click
    xt_assertElementExists('xt_monitors_createMonitor_volume', "#{monitorName}")
    xt_ScreenCapture("xt_monitors_createMonitor_volume")
  rescue 
    xt_increment_failed("xt_monitors_createMonitor_volume")
    xt_ScreenCapture("xt_monitors_createMonitor_volume_failedMethodBlock")
  end     
end

def xt_monitors_createMonitor_volumeAcl() 
  begin
    sleep 1
    monitorName = "NewMonitorVolumeAcl " + SecureRandom.hex(3)
    $browser.a(:text => "NEW MONITOR").when_present.click
    $browser.text_field(:xpath, "//input[@placeholder='Enter Monitor Name']").when_present.set(monitorName)
    $browser.div(:xpath, "//div[@id='entityTypeNameInModal']").when_present.click
    $browser.div(:class => "dropdown xy-dropdown xy-form-dropdown-container entity-type-dropdown").ul(:class => 'dropdown-menu xy-dropdown-menu group-dropdown-list').a(:text => 'VolumeAcl').when_present.click
    $browser.div(:class => "modal-footer xy-clear-both ng-scope").button(:text => 'CREATE MONITOR').when_present.click
    sleep 2
    $browser.div(:class => "col-xs-5 xySummaryDirtyBitButtonContainer").button(:text => 'SAVE').when_present.click
    xt_assertElementExists('xt_monitors_createMonitor_volumeAcl', "#{monitorName}")
    xt_ScreenCapture("xt_monitors_createMonitor_volumeAcl")
  rescue 
    xt_increment_failed("xt_monitors_createMonitor_volumeAcl")
    xt_ScreenCapture("xt_monitors_createMonitor_volumeAcl_failedMethodBlock")
  end     
end

def xt_monitors_renameExistingMonitor() 
  begin
    sleep 1
    monitorName = "renameMonitor " + SecureRandom.hex(3)
    $browser.div(:xpath, "//div[@tooltip='#{$auditPoolMonitorName}']").when_present.click
    $browser.button(:xpath, "//button[@ng-click='renameMonitorDefinition()']").when_present.click
    $browser.text_field(:xpath, "//input[@placeholder='Enter Monitor Name']").when_present.clear
    $browser.text_field(:xpath, "//input[@class='form-control ng-valid ng-dirty']").when_present.set($auditPoolMonitorName)
    $browser.button(:xpath, "//button[@class='btn btn-default button-dark pull-right']").when_present.click
    xt_assertElementExists('xt_monitors_renameExistingMonitor', "There is already a monitor with this name")
    xt_ScreenCapture("xt_monitors_renameExistingMonitor")
    $browser.button(:xpath, "//button[@ng-click='cancel()']").when_present.click
  rescue 
    xt_increment_failed("xt_monitors_renameExistingMonitor")
    xt_ScreenCapture("xt_monitors_renameExistingMonitor_failedMethodBlock")
  end 
end

def xt_monitors_renameMonitor() 
  begin
    sleep 1
    monitorName = "renameMonitor " + SecureRandom.hex(3)
    $browser.div(:xpath, "//div[@tooltip='#{$auditPoolMonitorName}']").when_present.click
    $browser.button(:xpath, "//button[@ng-click='renameMonitorDefinition()']").when_present.click
    $browser.text_field(:xpath, "//input[@placeholder='Enter Monitor Name']").when_present.clear
    $browser.text_field(:xpath, "//input[@class='form-control ng-valid ng-dirty']").when_present.set(monitorName)
    $browser.button(:xpath, "//button[@class='btn btn-default button-dark pull-right']").when_present.click
    sleep 2
    $browser.element.wd.location_once_scrolled_into_view
    $browser.div(:class => "col-xs-5 xySummaryDirtyBitButtonContainer").button(:text => 'SAVE').when_present.click
    xt_assertElementExists('xt_monitors_renameMonitor', "#{monitorName}")
    xt_ScreenCapture("xt_monitors_renameMonitor")
  rescue 
    xt_increment_failed("xt_monitors_renameMonitor")
    xt_ScreenCapture("xt_monitors_renameMonitor_failedMethodBlock")
  end 
end

def xt_monitors_monitorSearch() 
  begin
    sleep 1
    $auditPoolMonitorName = "NewMonitorAuditPool " + SecureRandom.hex(3)
    $browser.text_field(:xpath => "//input[@placeholder='search monitors']").when_present.set($auditPoolMonitorName)
    xt_assertElementExists('xt_monitors_monitorSearch', "#{$auditPoolMonitorName}")
    xt_ScreenCapture("xt_monitors_monitorSearch")
    $browser.text_field(:xpath => "//input[@placeholder='search monitors']").when_present.set('')
  rescue 
    xt_increment_failed("xt_monitors_monitorSearch")
    xt_ScreenCapture("xt_monitors_monitorSearch_failedMethodBlock")
    $browser.text_field(:xpath => "//input[@placeholder='search monitors']").when_present.set('')
  end   
end

def xt_monitors_dragMonitorToGroup() 
  begin
    sleep 1
    groupName = "NewGroup" + SecureRandom.hex(3)
    $browser.div(:class => "xy-new-item-container").a(:text => "NEW GROUP").when_present.click
    $browser.text_field(:xpath, "//input[@ng-model='group.groupName']").when_present.set(groupName)
    $browser.div(:class => "modal-footer ng-scope").button(:text => 'CREATE GROUP').when_present.click    
    $browser.div(:class, "tile-header-label xy-form-dropdown-selection-label no-monitor-text ng-binding").when_present.click
    $browser.ul(:class => 'dropdown-menu xy-dropdown-menu group-dropdown-list').li(:index => 0).checkbox(:class => 'monitor-form-checkbox pull-right ng-scope ng-pristine ng-valid').when_present.set
    $browser.button(:xpath, "//button[@ng-click='addMonitorsToGroup()']").when_present.click
        
    draggedMonitor = "draggedMonitor" + SecureRandom.hex(10)
    $browser.a(:text => "NEW MONITOR").when_present.click
    $browser.text_field(:xpath, "//input[@placeholder='Enter Monitor Name']").when_present.set(draggedMonitor)
    $browser.div(:xpath, "//div[@id='entityTypeNameInModal']").when_present.click
    $browser.div(:class => "dropdown xy-dropdown xy-form-dropdown-container entity-type-dropdown").ul(:class => 'dropdown-menu xy-dropdown-menu group-dropdown-list').a(:text => 'AuditPool').when_present.click
    $browser.div(:class => "modal-footer xy-clear-both ng-scope").button(:text => 'CREATE MONITOR').when_present.click    
    sleep 2
    $browser.div(:class => "col-xs-5 xySummaryDirtyBitButtonContainer").button(:text => 'SAVE').when_present.click    
    puts origin = $browser.div(:xpath, "//div[contains(@tooltip,\"#{draggedMonitor}\")]").when_present
    # puts target = $browser.div(:class => "xy-list-item xy-list-item-margin xy-list-item-over").div(:text => "\\Mohamed").when_present
    # origin.drag_and_drop_on(target)
    
    #$browser.div(:class => "xy-list-item xy-list-item-margin").div(:text => "\\Mohamed").when_present.click
    xt_assertElementExists('xt_monitors_dragMonitorToGroup', "#{draggedMonitor}")
    xt_ScreenCapture("xt_monitors_dragMonitorToGroup")
  rescue 
    xt_increment_failed("xt_monitors_dragMonitorToGroup")
    xt_ScreenCapture("xt_monitors_dragMonitorToGroup_failedMethodBlock")
  end  
end


# .............................................................................................................................Monitor Header....................................................................................................


def xt_monitor_nameSaveAs() 
  begin
    sleep 1
    $browser.div(:class => "col-sm-12 xy-monitor-summary-button-container").button(:text => "SAVE AS").when_present.click
    $browser.text_field(:xpath => "//input[@ng-model='monitorInformation.monitorName']").when_present.set '$' + SecureRandom.hex(3)
    t = $browser.text_field(:xpath => "//input[@ng-model='monitorInformation.monitorName']").text
    $browser.button(:text => 'SAVE MONITOR').when_present.click
    xt_assertElementExists('xt_monitor_nameSaveAs', t)
    xt_ScreenCapture("xt_monitor_nameSaveAs")
  rescue 
    xt_increment_failed("xt_monitor_nameSaveAs")
    xt_ScreenCapture("xt_monitor_nameSaveAs_failedMethodBlock")
  end   
end

def xt_monitor_nameSaveAs_cancel() 
  begin
    sleep 1
    $browser.div(:class => "col-sm-12 xy-monitor-summary-button-container").button(:text => "SAVE AS").when_present.click
    t = $browser.text_field(:xpath => "//input[@ng-model='monitorInformation.monitorName']").text
    $browser.text_field(:xpath => "//input[@ng-model='monitorInformation.monitorName']").when_present.set '$' + SecureRandom.hex(3)
    $browser.button(:xpath => "//button[@ng-click='cancel()']").when_present.click
    xt_assertElementExists('xt_monitor_nameSaveAs_cancel', t)
    xt_ScreenCapture("xt_monitor_nameSaveAs_cancel")
  rescue 
    xt_increment_failed("xt_monitor_nameSaveAs_cancel")
    xt_ScreenCapture("xt_monitor_nameSaveAs_cancel_failedMethodBlock")
  end   
end

def xt_monitor_nameRename() 
  begin
    sleep 1
    $browser.div(:class => "col-sm-12 xy-monitor-summary-button-container").button(:text => "RENAME").when_present.click
    $browser.text_field(:xpath => "//input[@ng-model='monitorInformation.monitorName']").when_present.set '$' + SecureRandom.hex(3)
    t = $browser.text_field(:xpath => "//input[@ng-model='monitorInformation.monitorName']").text
    $browser.button(:text => 'RENAME MONITOR').when_present.click
    sleep 2
    $browser.div(:class => "col-xs-5 xySummaryDirtyBitButtonContainer").button(:text => 'SAVE').when_present.click
    xt_assertElementExists('xt_monitor_nameRename', t)
    xt_ScreenCapture("xt_monitor_nameRename")
  rescue 
    xt_increment_failed("xt_monitor_nameRename")
    xt_ScreenCapture("xt_monitor_nameRename_failedMethodBlock")
  end   
end

def xt_monitor_nameRename_cancel() 
  begin
    sleep 1
    $browser.div(:class => "col-sm-12 xy-monitor-summary-button-container").button(:text => "RENAME").when_present.click
    t = $browser.text_field(:xpath => "//input[@ng-model='monitorInformation.monitorName']").text
    $browser.text_field(:xpath => "//input[@ng-model='monitorInformation.monitorName']").when_present.set '$' + SecureRandom.hex(3)
    $browser.button(:xpath => "//button[@ng-click='cancel()']").when_present.click
    sleep 2
    $browser.div(:class => "col-xs-5 xySummaryDirtyBitButtonContainer").button(:text => 'SAVE').when_present.click
    xt_assertElementExists('xt_monitor_nameRename_cancel', t)
    xt_ScreenCapture("xt_monitor_nameRename_cancel")
  rescue 
    xt_increment_failed("xt_monitor_nameRename_cancel")
    xt_ScreenCapture("xt_monitor_nameRename_cancel_failedMethodBlock")
  end   
end

def xt_monitor_nameDelete() 
  begin
    sleep 1
    t = $browser.div(:xpath => "//div[@class='col-lg-12 col-xl-8 xy-no-side-padding top-panel-monitor-name ng-binding']").text
    $browser.div(:class => "col-sm-12 xy-monitor-summary-button-container").button(:text => "DELETE").when_present.click
    $browser.button(:text => 'DELETE MONITOR').when_present.click
    xt_assertElementDoesntExists('xt_monitor_nameDelete', t)
    xt_ScreenCapture("xt_monitor_nameDelete")
  rescue 
    xt_increment_failed("xt_monitor_nameDelete")
    xt_ScreenCapture("xt_monitor_nameDelete_failedMethodBlock")
  end   
end

def xt_monitor_nameDelete_cancel() 
  begin
    sleep 1
    t = $browser.div(:xpath => "//div[@class='col-lg-12 col-xl-8 xy-no-side-padding top-panel-monitor-name ng-binding']").text
    $browser.div(:class => "col-sm-12 xy-monitor-summary-button-container").button(:text => "DELETE").when_present.click
    $browser.button(:xpath => "//button[@ng-click='cancel()']").when_present.click
    xt_assertElementExists('xt_monitor_nameDelete_cancel', t)
    xt_ScreenCapture("xt_monitor_nameDelete_cancel")
  rescue 
    xt_increment_failed("xt_monitor_nameDelete_cancel")
    xt_ScreenCapture("xt_monitor_nameDelete_cancel_failedMethodBlock")
  end   
end

def xt_monitors_totalAlerts()
  begin
    sleep 1
    puts totalAlerts = $browser.div(:class => "col-sm-12 col-md-5 col-lg-4 monitor-summary-chart-container").div(:class => "monitor-alerts ng-binding").text  
    query = ""
    #xt_assertion_DB(activeMonitors, "xt_monitors_totalAlerts", query)
    xt_ScreenCapture("xt_monitors_totalAlerts")
  rescue 
    xt_increment_failed("xt_monitors_totalAlerts")
    xt_ScreenCapture("xt_monitors_totalAlerts_failedMethodBlock")
  end
end

def xt_monitors_totalChangedAlerts()
  begin
    sleep 1
    puts totalChangedAlerts = $browser.div(:class => "col-sm-12 col-md-5 col-lg-4 monitor-summary-chart-container").div(:class => "monitor-changed ng-binding").text  
    query = ""
    #xt_assertion_DB(activeMonitors, "xt_monitors_totalChangedAlerts", query)
    xt_ScreenCapture("xt_monitors_totalChangedAlerts")
  rescue 
    xt_increment_failed("xt_monitors_totalChangedAlerts")
    xt_ScreenCapture("xt_monitors_totalChangedAlerts_failedMethodBlock")
  end   
end

def xt_monitors_totalNewAlerts()
  begin
    sleep 1
    puts totalNewAlerts = $browser.div(:class => "col-sm-12 col-md-5 col-lg-4 monitor-summary-chart-container").div(:class => "monitor-new ng-binding").text  
    query = ""
    #xt_assertion_DB(activeMonitors, "xt_monitors_totalNewAlerts", query)
    xt_ScreenCapture("xt_monitors_totalNewAlerts")
  rescue 
    xt_increment_failed("xt_monitors_totalNewAlerts")
    xt_ScreenCapture("xt_monitors_totalNewAlerts_failedMethodBlock")
  end  
end

def xt_monitors_totalMissingAlerts()
  begin
    sleep 1
    puts totalNewAlerts = $browser.div(:class => "col-sm-12 col-md-5 col-lg-4 monitor-summary-chart-container").div(:class => "monitor-missing ng-binding").text  
    query = ""
    #xt_assertion_DB(activeMonitors, "xt_monitors_totalMissingAlerts", query)
    xt_ScreenCapture("xt_monitors_totalMissingAlerts")
  rescue 
    xt_increment_failed("xt_monitors_totalMissingAlerts")
    xt_ScreenCapture("xt_monitors_totalMissingAlerts_failedMethodBlock")
  end    
end

def xt_monitors_pieChart()
  begin
    sleep 1
    xt_assertion()
    xt_ScreenCapture()
  rescue 
    xt_increment_failed()
    xt_ScreenCapture()
  end   
end

def xt_monitors_barChart()
  begin
    sleep 1
    xt_assertion()
    xt_ScreenCapture()
  rescue 
    xt_increment_failed()
    xt_ScreenCapture()
  end   
end

def xt_monitors_clearAll()
  begin
    sleep 1
    $browser.button(:xpath => "//button[@class='col-xs-1 col-sm-2 btn btn-default button-light xy-btn-clear-all-alerts']").when_present.click
    $browser.button(:text => "CONFIRM CLEAR").when_present.click
    xt_assertElementExists('xt_monitor_clearAll', 'No Alerts')
    xt_ScreenCapture("xt_monitor_clearAll")
  rescue 
    xt_increment_failed("xt_monitor_clearAll")
    xt_ScreenCapture("xt_monitor_clearAll_failedMethodBlock")
  end   
end


def xt_monitors_newGroup_createNewMonitor() 
  begin
    sleep 1
    $groupName = "NewGroup " + SecureRandom.hex(3)
    $browser.div(:class => "xy-new-item-container").a(:text => "NEW GROUP").when_present.click
    $browser.text_field(:xpath, "//input[@ng-model='group.groupName']").when_present.set($groupName)
    $browser.div(:class => "modal-footer ng-scope").button(:text => 'CREATE GROUP').when_present.click
    $browser.a(:class => "xy-no-monitor-link no-monitor-text new-group-icon").when_present.click
    $auditPoolMonitorName = "NewMonitorAuditPool " + SecureRandom.hex(3)
    $browser.text_field(:xpath => "//input[@class='form-control ng-pristine ng-valid']").when_present.set($auditPoolMonitorName)
    $browser.div(:id => "entityTypeNameInModal").when_present.click
    $browser.div(:class => "entity-item-label dropdown-item-label form-dropdown-label ng-binding").when_present.click
    $browser.button(:text => "CREATE MONITOR").when_present.click
    sleep 2
    $browser.div(:class => "col-xs-5 xySummaryDirtyBitButtonContainer").button(:text => 'SAVE').when_present.click
    xt_assertElementExists('xt_monitors_newGroup_createNewMonitor_cancel', $auditPoolMonitorName)
    xt_ScreenCapture("xt_monitors_newGroup_createNewMonitor_cancel")
  rescue 
    xt_increment_failed("xt_monitors_newGroup_createNewMonitor_cancel")
    xt_ScreenCapture("xt_monitors_newGroup_createNewMonitor_cancel_failedMethodBlock")
  end   
end

def xt_monitors_newGroup_createNewMonitor_cancel() 
  begin
    sleep 1
    $groupName = "NewGroup " + SecureRandom.hex(3)
    $browser.div(:class => "xy-new-item-container").a(:text => "NEW GROUP").when_present.click
    $browser.text_field(:xpath, "//input[@ng-model='group.groupName']").when_present.set($groupName)
    $browser.div(:class => "modal-footer ng-scope").button(:text => 'CREATE GROUP').when_present.click
    $browser.a(:class => "xy-no-monitor-link no-monitor-text new-group-icon").when_present.click
    $auditPoolMonitorName = "NewMonitorAuditPool " + SecureRandom.hex(3)
    $browser.text_field(:xpath => "//input[@class='form-control ng-pristine ng-valid']").when_present.set($auditPoolMonitorName)
    $browser.div(:id => "entityTypeNameInModal").when_present.click
    $browser.div(:class => "entity-item-label dropdown-item-label form-dropdown-label ng-binding").when_present.click
    $browser.button(:text => "CANCEL").when_present.click
    sleep 2
    $browser.div(:class => "col-xs-5 xySummaryDirtyBitButtonContainer").button(:text => 'SAVE').when_present.click
    xt_assertElementDoesntExists('xt_monitors_newGroup_createNewMonitor_cancel', $auditPoolMonitorName)
    xt_ScreenCapture("xt_monitors_newGroup_createNewMonitor_cancel")
  rescue 
    xt_increment_failed("xt_monitors_newGroup_createNewMonitor_cancel")
    xt_ScreenCapture("xt_monitors_newGroup_createNewMonitor_cancel_failedMethodBlock")
  end   
end

def xt_monitors_newGroup_addMonitors() 
  begin
    sleep 1
    xt_monitors_group_create() 
    $browser.div(:class, "tile-header-label xy-form-dropdown-selection-label no-monitor-text ng-binding").when_present.click
    $browser.ul(:class => 'dropdown-menu xy-dropdown-menu group-dropdown-list').li(:index => 0).checkbox(:class => 'monitor-form-checkbox pull-right ng-scope ng-pristine ng-valid').when_present.set
    $browser.button(:xpath, "//button[@ng-click='addMonitorsToGroup()']").when_present.click
    sleep 2      
    xt_assertElementExists('xt_monitors_newGroup_addMonitors', $groupName)
    xt_ScreenCapture("xt_monitors_newGroup_addMonitors")
  rescue 
    xt_increment_failed("xt_monitors_newGroup_addMonitors")
    xt_ScreenCapture("xt_monitors_newGroup_addMonitors_failedMethodBlock")
  end  
end

def xt_monitors_groups_search() 
  begin
    sleep 1
    $browser.text_field(:xpath => "//input[@ng-model='groupSearchText']").set 'b'
    t = $browser.text_field(:xpath => "//input[@ng-model='groupSearchText']").when_present.text
    if $browser.text_field(:xpath => "//input[@ng-model='groupSearchText']").text == t
      xt_assertPassed("xt_monitors_groups_search", 'b')
      xt_ScreenCapture("xt_monitors_groups_search")
      $browser.text_field(:xpath => "//input[@ng-model='groupSearchText']").set ''
    else
      xt_assertFailed('xt_monitors_groups_search', 'b')
    end
  rescue 
    xt_increment_failed("xt_monitors_groups_search")
    xt_ScreenCapture("xt_monitors_groups_search_failedMethodBlock")
  end   
end

def xt_monitors_groups_allMonitors() 
  begin
    sleep 1
    $browser.div(:class => "xy-list-item-name ng-scope ng-binding").when_present.click
    # xt_assertion()
    # xt_ScreenCapture()
  rescue 
    # xt_increment_failed()
    # xt_ScreenCapture()
  end   
end

def xt_monitors_groups_singleMonitorRename() #doesn't work because icon is not visible without mouseover. Researching Solution 
  begin
    sleep 1
    $browser.div(:xpath => "//a[@style='visibility: visible;']").when_present.click
    # xt_assertion()
    # xt_ScreenCapture()
  rescue 
    # xt_increment_failed()
    # xt_ScreenCapture()
  end   
end

def xt_monitors_groups_singleMonitorDelete() #Same issue as above Method
  begin
    sleep 1
    xt_assertion()
    xt_ScreenCapture()
  rescue 
    xt_increment_failed()
    xt_ScreenCapture()
  end   
end

# .............................................................................................................................Monitor - Definition.................................................................................................

def xt_monitors_definition_monitorType() 
  begin
    sleep 1
    $auditPoolMonitorName = "NewMonitorAuditPool " + SecureRandom.hex(3)
    $browser.a(:text => "NEW MONITOR").when_present.click
    $browser.text_field(:xpath, "//input[@placeholder='Enter Monitor Name']").when_present.set($auditPoolMonitorName)
    $browser.div(:xpath, "//div[@id='entityTypeNameInModal']").when_present.click
    $browser.div(:class => "dropdown xy-dropdown xy-form-dropdown-container entity-type-dropdown").ul(:class => 'dropdown-menu xy-dropdown-menu group-dropdown-list').a(:text => 'AuditPool').when_present.click
    $browser.div(:class => "modal-footer xy-clear-both ng-scope").button(:text => 'CREATE MONITOR').when_present.click
    sleep 2
    $browser.div(:class => "col-xs-5 xySummaryDirtyBitButtonContainer").button(:text => 'SAVE').when_present.click
    xt_assertElementExists("xt_monitors_definition_monitorType", 'Monitor Type:')
    xt_ScreenCapture("xt_monitors_definition_monitorType")
  rescue 
    xt_increment_failed("xt_monitors_definition_monitorType")
    xt_ScreenCapture("xt_monitors_definition_monitorType_failedMethodBlock")
  end   
end

def xt_monitors_definition_analysisType() 
  begin
    sleep 1
    $auditPoolMonitorName = "NewMonitorAuditPool " + SecureRandom.hex(3)
    $browser.a(:text => "NEW MONITOR").when_present.click
    $browser.text_field(:xpath, "//input[@placeholder='Enter Monitor Name']").when_present.set($auditPoolMonitorName)
    $browser.div(:xpath, "//div[@id='entityTypeNameInModal']").when_present.click
    $browser.div(:class => "dropdown xy-dropdown xy-form-dropdown-container entity-type-dropdown").ul(:class => 'dropdown-menu xy-dropdown-menu group-dropdown-list').a(:text => 'AuditPool').when_present.click
    $browser.div(:class => "modal-footer xy-clear-both ng-scope").button(:text => 'CREATE MONITOR').when_present.click
    sleep 2
    $browser.div(:class => "col-xs-5 xySummaryDirtyBitButtonContainer").button(:text => 'SAVE').when_present.click
    xt_assertElementExists("xt_monitors_definition_analysisType", 'Analysis Type:')
    xt_ScreenCapture("xt_monitors_definition_analysisType")
  rescue 
    xt_increment_failed("xt_monitors_definition_analysisType")
    xt_ScreenCapture("xt_monitors_definition_analysisType_failedMethodBlock")
  end   
end

def xt_monitors_definition_visibility_private() 
  begin
    sleep 1
    $auditPoolMonitorName = "NewMonitorAuditPool " + SecureRandom.hex(3)
    $browser.a(:text => "NEW MONITOR").when_present.click
    $browser.text_field(:xpath, "//input[@placeholder='Enter Monitor Name']").when_present.set($auditPoolMonitorName)
    $browser.div(:xpath, "//div[@id='entityTypeNameInModal']").when_present.click
    $browser.div(:class => "dropdown xy-dropdown xy-form-dropdown-container entity-type-dropdown").ul(:class => 'dropdown-menu xy-dropdown-menu group-dropdown-list').a(:text => 'AuditPool').when_present.click
    $browser.div(:class => "modal-footer xy-clear-both ng-scope").button(:text => 'CREATE MONITOR').when_present.click
    sleep 2
    # $browser.div(:id => "visibility").when_present.click
    $browser.div(:xpath, "//div[contains(.,'private')]").when_present.click
    $browser.a(:text => "private").when_present.click
    sleep 2
    $browser.div(:class => "col-xs-5 xySummaryDirtyBitButtonContainer").button(:text => 'SAVE').when_present.click
    xt_assertElementExists("xt_monitors_definition_visibility_private", 'private')
    xt_ScreenCapture("xt_monitors_definition_visibility_private")
  rescue 
    xt_increment_failed("xt_monitors_definition_visibility_private")
    xt_ScreenCapture("xt_monitors_definition_visibility_private_failedMethodBlock")
  end   
end

def xt_monitors_definition_visibility_shared() 
  begin
    sleep 1
    $auditPoolMonitorName = "NewMonitorAuditPool " + SecureRandom.hex(3)
    $browser.a(:text => "NEW MONITOR").when_present.click
    $browser.text_field(:xpath, "//input[@placeholder='Enter Monitor Name']").when_present.set($auditPoolMonitorName)
    $browser.div(:xpath, "//div[@id='entityTypeNameInModal']").when_present.click
    $browser.div(:class => "dropdown xy-dropdown xy-form-dropdown-container entity-type-dropdown").ul(:class => 'dropdown-menu xy-dropdown-menu group-dropdown-list').a(:text => 'AuditPool').when_present.click
    $browser.div(:class => "modal-footer xy-clear-both ng-scope").button(:text => 'CREATE MONITOR').when_present.click
    sleep 2
    $browser.div(:id => "visibility").when_present.click
    $browser.a(:class => "dropdown-inner-item xy-dropdown-inner-item bottom-item").when_present.click
    sleep 2
    $browser.div(:class => "col-xs-5 xySummaryDirtyBitButtonContainer").button(:text => 'SAVE').when_present.click
    xt_assertElementExists("xt_monitors_definition_visibility_shared", 'shared')
    xt_ScreenCapture("xt_monitors_definition_visibility_shared")
  rescue 
    xt_increment_failed("xt_monitors_definition_visibility_shared")
    xt_ScreenCapture("xt_monitors_definition_visibility_shared_failedMethodBlock")
  end   
end

def xt_monitors_definition_groups() 
  begin
    sleep 1
    xt_assertion()
    xt_ScreenCapture()
  rescue 
    xt_increment_failed()
    xt_ScreenCapture()
  end   
end

def xt_monitors_definition_criticality_low() #work in progress
  begin
    sleep 1
    $auditPoolMonitorName = "NewMonitorAuditPool " + SecureRandom.hex(3)
    $browser.a(:text => "NEW MONITOR").when_present.click
    $browser.text_field(:xpath, "//input[@placeholder='Enter Monitor Name']").when_present.set($auditPoolMonitorName)
    $browser.div(:xpath, "//div[@id='entityTypeNameInModal']").when_present.click
    $browser.div(:class => "dropdown xy-dropdown xy-form-dropdown-container entity-type-dropdown").ul(:class => 'dropdown-menu xy-dropdown-menu group-dropdown-list').a(:text => 'AuditPool').when_present.click
    $browser.div(:class => "modal-footer xy-clear-both ng-scope").button(:text => 'CREATE MONITOR').when_present.click
    sleep 2
    $browser.div(:id => "criticality").when_present.click
    $browser.div(:xpath => "//div[@class='dropdown-item-label form-dropdown-label']").when_present.click
    #$browser.div(:class => "dropdown-item-label form-dropdown-label").when_present.click
    #$browser.li(:class => "dropdown-item xy-dropdown-item xy-dropdown-line-bottom").when_present.click
    sleep 2
    $browser.div(:class => "col-xs-5 xySummaryDirtyBitButtonContainer").button(:text => 'SAVE').when_present.click
    # xt_assertion()
    # xt_ScreenCapture()
  rescue 
    # xt_increment_failed()
    # xt_ScreenCapture()
  end   
end

def xt_monitors_definition_criticality_medium() 
  begin
    sleep 1
    $auditPoolMonitorName = "NewMonitorAuditPool " + SecureRandom.hex(3)
    $browser.a(:text => "NEW MONITOR").when_present.click
    $browser.text_field(:xpath, "//input[@placeholder='Enter Monitor Name']").when_present.set($auditPoolMonitorName)
    $browser.div(:xpath, "//div[@id='entityTypeNameInModal']").when_present.click
    $browser.div(:class => "dropdown xy-dropdown xy-form-dropdown-container entity-type-dropdown").ul(:class => 'dropdown-menu xy-dropdown-menu group-dropdown-list').a(:text => 'AuditPool').when_present.click
    $browser.div(:class => "modal-footer xy-clear-both ng-scope").button(:text => 'CREATE MONITOR').when_present.click
    sleep 2
    $browser.div(:id => "criticality").when_present.click
    xt_assertion()
    xt_ScreenCapture()
  rescue 
    xt_increment_failed()
    xt_ScreenCapture()
  end   
end

def xt_monitors_definition_criticality_high() 
  begin
    sleep 1
    xt_assertion()
    xt_ScreenCapture()
  rescue 
    xt_increment_failed()
    xt_ScreenCapture()
  end   
end

def xt_monitors_definition_alertSetting_active() 
  begin
    sleep 1
    $auditPoolMonitorName = "NewMonitorAuditPool " + SecureRandom.hex(3)
    $browser.a(:text => "NEW MONITOR").when_present.click
    $browser.text_field(:xpath, "//input[@placeholder='Enter Monitor Name']").when_present.set($auditPoolMonitorName)
    $browser.div(:xpath, "//div[@id='entityTypeNameInModal']").when_present.click
    $browser.div(:class => "dropdown xy-dropdown xy-form-dropdown-container entity-type-dropdown").ul(:class => 'dropdown-menu xy-dropdown-menu group-dropdown-list').a(:text => 'AuditPool').when_present.click
    $browser.div(:class => "modal-footer xy-clear-both ng-scope").button(:text => 'CREATE MONITOR').when_present.click
    sleep 2
    $browser.checkbox(:value => 'active').set
    $browser.button(:class => "btn btn-default button-light pull-left").when_present.click
    if ($browser.checkbox(:value => 'active').set?)
      xt_assertPassed("xt_monitors_definition_alertSetting_active", 'monitor-form-bottom-checkbox ng-valid ng-dirty')
      xt_ScreenCapture("xt_monitors_definition_alertSetting_active")
    else
      xt_assertFailed("xt_monitors_definition_alertSetting_active", 'monitor-form-bottom-checkbox ng-valid ng-dirty')
    end
    sleep 2
    $browser.div(:class => "col-xs-5 xySummaryDirtyBitButtonContainer").button(:text => 'SAVE').when_present.click
  rescue 
    xt_increment_failed("xt_monitors_definition_alertSetting_active")
    xt_ScreenCapture("xt_monitors_definition_alertSetting_active_failedMethodBlock")
  end   
end

def xt_monitors_definition_alertSetting_alertOnMissing() 
  begin
    sleep 1
    $auditPoolMonitorName = "NewMonitorAuditPool " + SecureRandom.hex(3)
    $browser.a(:text => "NEW MONITOR").when_present.click
    $browser.text_field(:xpath, "//input[@placeholder='Enter Monitor Name']").when_present.set($auditPoolMonitorName)
    $browser.div(:xpath, "//div[@id='entityTypeNameInModal']").when_present.click
    $browser.div(:class => "dropdown xy-dropdown xy-form-dropdown-container entity-type-dropdown").ul(:class => 'dropdown-menu xy-dropdown-menu group-dropdown-list').a(:text => 'AuditPool').when_present.click
    $browser.div(:class => "modal-footer xy-clear-both ng-scope").button(:text => 'CREATE MONITOR').when_present.click
    sleep 2
    $browser.checkbox(:value => 'alertOnMissing').clear
    $browser.checkbox(:value => 'alertOnMissing').set
    if ($browser.checkbox(:value => 'alertOnMissing').set?)
      xt_assertPassed("xt_monitors_definition_alertSetting_alertOnMissing", 'monitor-form-bottom-checkbox ng-valid ng-dirty')
      xt_ScreenCapture("xt_monitors_definition_alertSetting_alertOnMissing")
    else
      xt_assertFailed("xt_monitors_definition_alertSetting_alertOnMissing", 'monitor-form-bottom-checkbox ng-valid ng-dirty')
    end
    sleep 2
    $browser.div(:class => "col-xs-5 xySummaryDirtyBitButtonContainer").button(:text => 'SAVE').when_present.click
  rescue 
    xt_increment_failed("xt_monitors_definition_alertSetting_alertOnMissing")
    xt_ScreenCapture("xt_monitors_definition_alertSetting_alertOnMissing_failedMethodBlock")
  end   
end

def xt_monitors_definition_alertSetting_alertOnNew() 
  begin
    sleep 1
    $auditPoolMonitorName = "NewMonitorAuditPool " + SecureRandom.hex(3)
    $browser.a(:text => "NEW MONITOR").when_present.click
    $browser.text_field(:xpath, "//input[@placeholder='Enter Monitor Name']").when_present.set($auditPoolMonitorName)
    $browser.div(:xpath, "//div[@id='entityTypeNameInModal']").when_present.click
    $browser.div(:class => "dropdown xy-dropdown xy-form-dropdown-container entity-type-dropdown").ul(:class => 'dropdown-menu xy-dropdown-menu group-dropdown-list').a(:text => 'AuditPool').when_present.click
    $browser.div(:class => "modal-footer xy-clear-both ng-scope").button(:text => 'CREATE MONITOR').when_present.click
    sleep 2
    $browser.checkbox(:value => 'alertOnNew').clear
    $browser.checkbox(:value => 'alertOnNew').set
    if ($browser.checkbox(:value => 'alertOnNew').set?)
      xt_assertPassed("xt_monitors_definition_alertSetting_alertOnNew", 'monitor-form-bottom-checkbox ng-valid ng-dirty')
      xt_ScreenCapture("xt_monitors_definition_alertSetting_alertOnNew")
    else
      xt_assertFailed("xt_monitors_definition_alertSetting_alertOnNew", 'monitor-form-bottom-checkbox ng-valid ng-dirty')
    end
    sleep 2
    $browser.div(:class => "col-xs-5 xySummaryDirtyBitButtonContainer").button(:text => 'SAVE').when_present.click
  rescue 
    xt_increment_failed("xt_monitors_definition_alertSetting_alertOnNew")
    xt_ScreenCapture("xt_monitors_definition_alertSetting_alertOnNew_failedMethodBlock")
  end 
end

def xt_monitors_definition_node_addNameFilter() 
  begin
    sleep 1
    $auditPoolMonitorName = "NewMonitorAuditPool " + SecureRandom.hex(3)
    $browser.a(:text => "NEW MONITOR").when_present.click
    $browser.text_field(:xpath, "//input[@placeholder='Enter Monitor Name']").when_present.set($auditPoolMonitorName)
    $browser.div(:xpath, "//div[@id='entityTypeNameInModal']").when_present.click
    $browser.div(:class => "dropdown xy-dropdown xy-form-dropdown-container entity-type-dropdown").ul(:class => 'dropdown-menu xy-dropdown-menu group-dropdown-list').a(:text => 'AuditPool').when_present.click
    $browser.div(:class => "modal-footer xy-clear-both ng-scope").button(:text => 'CREATE MONITOR').when_present.click
    sleep 2
    $browser.div(:class => "right xy-contrast-text definition-link xy-edit-icon entity-add-button").when_present.click
    $browser.text_field(:xpath => "//input[@class='form-control xy-typeahead ng-pristine ng-valid']").set '\X'
    $browser.send_keys :enter
    $browser.button(:class => "btn btn-default button-dark popover-btn").when_present.click
    sleep 2
    $browser.div(:class => "col-xs-5 xySummaryDirtyBitButtonContainer").button(:text => 'SAVE').when_present.click
    xt_assertElementExists("xt_monitors_definition_node_addNameFilter", '\X')
    xt_ScreenCapture("xt_monitors_definition_node_addNameFilter")
  rescue 
    xt_increment_failed("xt_monitors_definition_node_addNameFilter")
    xt_ScreenCapture("xt_monitors_definition_node_addNameFilter_failedMethodBlock")
  end   
end

def xt_monitors_definition_node_addWildcardFilter() 
  begin
    sleep 1
    xt_assertion()
    xt_ScreenCapture()
  rescue 
    xt_increment_failed()
    xt_ScreenCapture()
  end   
end

def xt_monitors_definition_node_add_cancel() 
  begin
    sleep 1
    $auditPoolMonitorName = "NewMonitorAuditPool " + SecureRandom.hex(3)
    $browser.a(:text => "NEW MONITOR").when_present.click
    $browser.text_field(:xpath, "//input[@placeholder='Enter Monitor Name']").when_present.set($auditPoolMonitorName)
    $browser.div(:xpath, "//div[@id='entityTypeNameInModal']").when_present.click
    $browser.div(:class => "dropdown xy-dropdown xy-form-dropdown-container entity-type-dropdown").ul(:class => 'dropdown-menu xy-dropdown-menu group-dropdown-list').a(:text => 'AuditPool').when_present.click
    $browser.div(:class => "modal-footer xy-clear-both ng-scope").button(:text => 'CREATE MONITOR').when_present.click
    sleep 2
    $browser.div(:class => "right xy-contrast-text definition-link xy-edit-icon entity-add-button").when_present.click
    $browser.text_field(:xpath => "//input[@class='form-control xy-typeahead ng-pristine ng-valid']").set '\X'
    $browser.send_keys :enter
    $browser.button(:text => "CANCEL").when_present.click
    sleep 2
    $browser.div(:class => "col-xs-5 xySummaryDirtyBitButtonContainer").button(:text => 'SAVE').when_present.click
    #xt_assertion()
    #xt_ScreenCapture()
  rescue 
    #xt_increment_failed()
    #xt_ScreenCapture()
  end   
end

def xt_monitors_definition_entity_editValueFilter() 
  begin
    sleep 1
    xt_assertion()
    xt_ScreenCapture()
  rescue 
    xt_increment_failed()
    xt_ScreenCapture()
  end   
end


def xt_monitors_definition_entity_edit_cancel() 
  begin
    sleep 1
    xt_assertion()
    xt_ScreenCapture()
  rescue 
    xt_increment_failed()
    xt_ScreenCapture()
  end   
end

def xt_monitors_definition_removeAttribute_single() 
  begin
    sleep 1
    $auditPoolMonitorName = "NewMonitorAuditPool " + SecureRandom.hex(3)
    $browser.a(:text => "NEW MONITOR").when_present.click
    $browser.text_field(:xpath, "//input[@placeholder='Enter Monitor Name']").when_present.set($auditPoolMonitorName)
    $browser.div(:xpath, "//div[@id='entityTypeNameInModal']").when_present.click
    $browser.div(:class => "dropdown xy-dropdown xy-form-dropdown-container entity-type-dropdown").ul(:class => 'dropdown-menu xy-dropdown-menu group-dropdown-list').a(:text => 'AuditPool').when_present.click
    $browser.div(:class => "modal-footer xy-clear-both ng-scope").button(:text => 'CREATE MONITOR').when_present.click
    sleep 2
    $browser.div(:class => "definition-text text-center xy-contrast-text").when_present.click
    sleep 2
    $browser.div(:class => "col-xs-5 xySummaryDirtyBitButtonContainer").button(:text => 'SAVE').when_present.click
    #xt_assertion()
    #xt_ScreenCapture()
  rescue 
    #xt_increment_failed()
    #xt_ScreenCapture()
  end   
end

def xt_monitors_definition_removeAttribute_all() 
  begin
    sleep 1
    $auditPoolMonitorName = "NewMonitorAuditPool " + SecureRandom.hex(3)
    $browser.a(:text => "NEW MONITOR").when_present.click
    $browser.text_field(:xpath, "//input[@placeholder='Enter Monitor Name']").when_present.set($auditPoolMonitorName)
    $browser.div(:xpath, "//div[@id='entityTypeNameInModal']").when_present.click
    $browser.div(:class => "dropdown xy-dropdown xy-form-dropdown-container entity-type-dropdown").ul(:class => 'dropdown-menu xy-dropdown-menu group-dropdown-list').a(:text => 'AuditPool').when_present.click
    $browser.div(:class => "modal-footer xy-clear-both ng-scope").button(:text => 'CREATE MONITOR').when_present.click
    sleep 2
    $browser.div(:class => "col-xs-3 col-sm-3 xy-contrast-text xy-definition-link-text text-center").when_present.click
    sleep 2
    $browser.div(:class => "col-xs-5 xySummaryDirtyBitButtonContainer").button(:text => 'SAVE').when_present.click
    #xt_assertion()
    #xt_ScreenCapture()
  rescue 
    #xt_increment_failed()
    #xt_ScreenCapture()
  end  
end

def xt_monitors_definition_addAttribute_search() 
  begin
    sleep 1
    xt_assertion()
    xt_ScreenCapture()
  rescue 
    xt_increment_failed()
    xt_ScreenCapture()
  end   
end

def xt_monitors_definition_addAttribute_single() 
  begin
    sleep 1
    $auditPoolMonitorName = "NewMonitorAuditPool " + SecureRandom.hex(3)
    $browser.a(:text => "NEW MONITOR").when_present.click
    $browser.text_field(:xpath, "//input[@placeholder='Enter Monitor Name']").when_present.set($auditPoolMonitorName)
    $browser.div(:xpath, "//div[@id='entityTypeNameInModal']").when_present.click
    $browser.div(:class => "dropdown xy-dropdown xy-form-dropdown-container entity-type-dropdown").ul(:class => 'dropdown-menu xy-dropdown-menu group-dropdown-list').a(:text => 'AuditPool').when_present.click
    $browser.div(:class => "modal-footer xy-clear-both ng-scope").button(:text => 'CREATE MONITOR').when_present.click
    sleep 2
    $browser.div(:class => "col-xs-3 col-sm-3 xy-contrast-text xy-definition-link-text text-center").when_present.click
    $browser.div(:class => "xy-contrast-text xy-definition-link-text add-attribute-button").when_present.click
    $browser.div(:class => "col-sm-3 xy-contrast-text text-right attribute-not-added").when_present.click
    sleep 2
    $browser.div(:class => "col-xs-5 xySummaryDirtyBitButtonContainer").button(:text => 'SAVE').when_present.click
    xt_assertElementExists("xt_monitors_definition_addAttribute_single", 'added')
    xt_ScreenCapture("xt_monitors_definition_addAttribute_single")
  rescue 
    xt_increment_failed("xt_monitors_definition_addAttribute_single")
    xt_ScreenCapture("xt_monitors_definition_addAttribute_single_failedMethodBlock")
  end  
end

def xt_monitors_definition_addAttribute_all() 
  begin
    sleep 1
    $auditPoolMonitorName = "NewMonitorAuditPool " + SecureRandom.hex(3)
    $browser.a(:text => "NEW MONITOR").when_present.click
    $browser.text_field(:xpath, "//input[@placeholder='Enter Monitor Name']").when_present.set($auditPoolMonitorName)
    $browser.div(:xpath, "//div[@id='entityTypeNameInModal']").when_present.click
    $browser.div(:class => "dropdown xy-dropdown xy-form-dropdown-container entity-type-dropdown").ul(:class => 'dropdown-menu xy-dropdown-menu group-dropdown-list').a(:text => 'AuditPool').when_present.click
    $browser.div(:class => "modal-footer xy-clear-both ng-scope").button(:text => 'CREATE MONITOR').when_present.click
    sleep 2
    $browser.div(:class => "col-xs-3 col-sm-3 xy-contrast-text xy-definition-link-text text-center").when_present.click
    $browser.div(:class => "xy-contrast-text xy-definition-link-text add-attribute-button").when_present.click
    $browser.div(:class => "col-xs-12 xy-contrast-text addAllAttribute").when_present.click
    sleep 2
    $browser.div(:class => "col-xs-5 xySummaryDirtyBitButtonContainer").button(:text => 'SAVE').when_present.click
    xt_assertElementExists("xt_monitors_definition_addAttribute_all", 'added')
    xt_ScreenCapture("xt_monitors_definition_addAttribute_all")
  rescue 
    xt_increment_failed("xt_monitors_definition_addAttribute_all")
    xt_ScreenCapture("xt_monitors_definition_addAttribute_all_failedMethodBlock")
  end  
end

def xt_monitors_definition_rearrangeAttributes() 
  begin
    sleep 1
    xt_assertion()
    xt_ScreenCapture()
  rescue 
    xt_increment_failed()
    xt_ScreenCapture()
  end   
end


# .............................................................................................................................Monitor - Export Setting.................................................................................................
def xt_monitors_goToExportSettings() 
  begin
    sleep 1
    $browser.a(:text => "EXPORT SETTINGS").when_present.click
    xt_assertElementExists('xt_monitors_goToExportSettings',"SCHEDULE")
    xt_ScreenCapture("xt_monitors_goToExportSettings")
  rescue 
    xt_increment_failed("xt_monitors_goToExportSettings")
    xt_ScreenCapture("xt_monitors_goToExportSettings_failedMethodBlock")
  end   
end

def xt_monitors_exportSettings_schedule_todaysDate() 
  begin
    sleep 1
    $browser.span(:class => "k-icon k-i-calendar").when_present.click
    $browser.a(:class => "k-link k-nav-today").when_present.click
    xt_assertElementExists('xt_monitors_exportSettings_schedule_todaysDate',"Su")
    xt_ScreenCapture("xt_monitors_exportSettings_schedule_todaysDate")
  rescue 
    xt_increment_failed("xt_monitors_exportSettings_schedule_todaysDate")
    xt_ScreenCapture("xt_monitors_exportSettings_schedule_todaysDate_failedMethodBlock")
  end   
end

def xt_monitors_exportSettings_schedule_date() 
  begin
    sleep 1
    $browser.span(:class => "k-icon k-i-calendar").when_present.click
    sleep 2
    $browser.span(:class => "k-icon k-i-arrow-e").when_present.click
    $browser.table(:class =>"k-content").tr(:index => 2).cell(:index => 4).when_present.click
    xt_assertElementExists('xt_monitors_exportSettings_schedule_date',"Su")
    xt_ScreenCapture("xt_monitors_exportSettings_schedule_date")
  rescue 
    xt_increment_failed("xt_monitors_exportSettings_schedule_date")
    xt_ScreenCapture("xt_monitors_exportSettings_schedule_date_failedMethodBlock")
  end   
end

def xt_monitors_exportSettings_schedule_manualDate()
  begin
    sleep 1
    $browser.text_field(:class => 'ng-pristine ng-valid k-input').when_present.click
     $browser.text_field(:class => 'ng-pristine ng-valid k-input').set '12/12/2024'
    xt_assertElementExists('xt_monitors_exportSettings_schedule_manualDate',"12/12/2024")
    xt_ScreenCapture("xt_monitors_exportSettings_schedule_manualDate")
  rescue 
    xt_increment_failed("xt_monitors_exportSettings_schedule_manualDate")
    xt_ScreenCapture("xt_monitors_exportSettings_schedule_manualDate_failedMethodBlock")
  end   
end

def xt_monitors_exportSettings_schedule_time()
  begin
    sleep 1
    $browser.select(:class => 'ng-pristine ng-valid').when_present.click
    i = 0
    until i == 3 do
      $browser.send_keys :arrow_down
      i+=1
    end
    $browser.send_keys :enter
    xt_assertElementExists('xt_monitors_exportSettings_schedule_time',":")
    xt_ScreenCapture("xt_monitors_exportSettings_schedule_time")
  rescue 
    xt_increment_failed("xt_monitors_exportSettings_schedule_time")
    xt_ScreenCapture("xt_monitors_exportSettings_schedule_time_failedMethodBlock")
  end   
end

def xt_monitors_exportSettings_schedule_recurrenceNone() 
  begin
    sleep 1
    $browser.radio(:value => "None").set
    xt_assertElementExists('xt_monitors_exportSettings_schedule_recurrenceNone',"None")
    xt_ScreenCapture("xt_monitors_exportSettings_schedule_recurrenceNone")
  rescue 
    xt_increment_failed("xt_monitors_exportSettings_schedule_recurrenceNone")
    xt_ScreenCapture("xt_monitors_exportSettings_schedule_recurrenceNone_failedMethodBlock")
  end   
end

def xt_monitors_exportSettings_schedule_recurrenceDaily() 
  begin
    sleep 1
    $browser.radio(:value => "Daily").set
    xt_assertElementExists('xt_monitors_exportSettings_schedule_recurrenceDaily',"Daily")
    xt_ScreenCapture("xt_monitors_exportSettings_schedule_recurrenceDaily")
  rescue 
    xt_increment_failed("xt_monitors_exportSettings_schedule_recurrenceDaily")
    xt_ScreenCapture("xt_monitors_exportSettings_schedule_recurrenceDaily_failedMethodBlock")
  end   
end

def xt_monitors_exportSettings_schedule_recurrenceWeekly() 
  begin
    sleep 1
    $browser.radio(:value => "Weekly").set
    xt_assertElementExists('xt_monitors_exportSettings_schedule_recurrenceWeekly',"Weekly")
    xt_ScreenCapture("xt_monitors_exportSettings_schedule_recurrenceWeekly")
  rescue 
    xt_increment_failed("xt_monitors_exportSettings_schedule_recurrenceWeekly")
    xt_ScreenCapture("xt_monitors_exportSettings_schedule_recurrenceWeekly_failedMethodBlock")
  end   
end

def xt_monitors_exportSettings_schedule_recurrenceMonthly() 
  begin
    sleep 1
    $browser.radio(:value => "Monthly").set
    xt_assertElementExists('xt_monitors_exportSettings_schedule_recurrenceMonthly',"Monthly")
    xt_ScreenCapture("xt_monitors_exportSettings_schedule_recurrenceMonthly")
  rescue 
    xt_increment_failed("xt_monitors_exportSettings_schedule_recurrenceMonthly")
    xt_ScreenCapture("xt_monitors_exportSettings_schedule_recurrenceMonthly_failedMethodBlock")
  end   
end

def xt_monitors_exportSettings_schedule_recurrenceYearly() 
  begin
    sleep 1
    $browser.radio(:value => "Yearly").set
    xt_assertElementExists('xt_monitors_exportSettings_schedule_recurrenceYearly',"Yearly")
    xt_ScreenCapture("xt_monitors_exportSettings_schedule_recurrenceYearly")
  rescue 
    xt_increment_failed("xt_monitors_exportSettings_schedule_recurrenceYearly")
    xt_ScreenCapture("xt_monitors_exportSettings_schedule_recurrenceYearly_failedMethodBlock")
  end   
end

def xt_monitors_exportSettings_schedule_repeat_everyWeekDay() 
  begin
    sleep 1
    $browser.radio(:value => "everyWeekday").when_present.set
    xt_assertElementExists('xt_monitors_exportSettings_schedule_repeat_everyWeekDay',"weekday")
    xt_ScreenCapture("xt_monitors_exportSettings_schedule_repeat_everyWeekDay")
  rescue 
    xt_increment_failed("xt_monitors_exportSettings_schedule_repeat_everyWeekDay")
    xt_ScreenCapture("xt_monitors_exportSettings_schedule_repeat_everyWeekDay_failedMethodBlock")
  end   
end

def xt_monitors_exportSettings_schedule_repeat_every()
  begin
    sleep 1
    $browser.radio(:value => "everyNDays").when_present.set
    $browser.input(:name => "repeatevery").when_present.click
    $browser.send_keys :arrow_up
    xt_assertElementExists('xt_monitors_exportSettings_schedule_repeat_every',"day(s)")
    xt_ScreenCapture("xt_monitors_exportSettings_schedule_repeat_every")
  rescue 
    xt_increment_failed("xt_monitors_exportSettings_schedule_repeat_every")
    xt_ScreenCapture("xt_monitors_exportSettings_schedule_repeat_every_failedMethodBlock")
  end   
end

def xt_monitors_exportSettings_schedule_endDate_none() 
  begin
    sleep 1
    $browser.div(:class => "xy-recurrence-block").radio(:value => "None").set
    xt_assertElementExists('xt_monitors_exportSettings_schedule_endDate_none',"None")
    xt_ScreenCapture("xt_monitors_exportSettings_schedule_endDate_none")
  rescue 
    xt_increment_failed("xt_monitors_exportSettings_schedule_endDate_none")
    xt_ScreenCapture("xt_monitors_exportSettings_schedule_endDate_none_failedMethodBlock")
  end   
end

def xt_monitors_exportSettings_schedule_endDate_endAfter() 
  begin
    sleep 1
    $browser.radio(:value => "EndAfter").set
    $browser.text_field(:xpath, "//input[@id='export-end-date-number']").when_present.click
    $browser.send_keys :arrow_up
    xt_assertElementExists('xt_monitors_exportSettings_schedule_endDate_endAfter',"End After")
    xt_ScreenCapture("xt_monitors_exportSettings_schedule_endDate_endAfter")
  rescue 
    xt_increment_failed("xt_monitors_exportSettings_schedule_endDate_endAfter")
    xt_ScreenCapture("xt_monitors_exportSettings_schedule_endDate_endAfter_failedMethodBlock")
  end   
end

def xt_monitors_exportSettings_schedule_endDate_endBy() 
  begin
    sleep 1
    $browser.radio(:value => "EndBy").set
    $browser.text_field(:xpath, "//input[@id='export-end-data-picker']").when_present.click
    $browser.text_field(:xpath, "//input[@id='export-end-data-picker']").set '12/12/2024'
    xt_assertElementExists('xt_monitors_exportSettings_schedule_endDate_endBy',"12/12/2024")
    xt_ScreenCapture("xt_monitors_exportSettings_schedule_endDate_endBy")
  rescue 
    xt_increment_failed("xt_monitors_exportSettings_schedule_endDate_endBy")
    xt_ScreenCapture("xt_monitors_exportSettings_schedule_endDate_endBy_failedMethodBlock")
  end  
end

def xt_monitors_exportSettings_format_csv() # use space delimiter for this export test
  begin
    sleep 1
    $browser.text_field(:class => "form-control xy-export-input ng-pristine ng-valid").when_present.click
    $browser.text_field(:class => "form-control xy-export-input ng-pristine ng-valid").set 'csvTest'
    $browser.select(:class => "xy-export-format-select ng-pristine ng-valid").select 'CSV'
    $browser.div(:class => "col-md-3 xy-align-right").select(:class => "xy-export-format-select ng-pristine ng-valid").select 'Spaces'
    xt_assertElementExists('xt_monitors_exportSettings_format_csv',"CSV")
    xt_ScreenCapture("xt_monitors_exportSettings_format_csv")
  rescue 
    xt_increment_failed("xt_monitors_exportSettings_format_csv")
    xt_ScreenCapture("xt_monitors_exportSettings_schedule_format_csv_failedMethodBlock")
  end   
end

def xt_monitors_exportSettings_format_tsv() # use comma delimiter for this export test
  begin
    sleep 1
    $browser.text_field(:name => "title").set 'tsvTest'
    $browser.select(:class => "xy-export-format-select ng-valid ng-dirty").select 'TSV'
    $browser.div(:class => "col-md-3 xy-align-right").select(:class => "xy-export-format-select ng-valid ng-dirty").select 'Commas'
    xt_assertElementExists('xt_monitors_exportSettings_format_tsv',"TSV")
    xt_ScreenCapture("xt_monitors_exportSettings_format_tsv")
  rescue 
    xt_increment_failed("xt_monitors_exportSettings_format_tsv")
    xt_ScreenCapture("xt_monitors_exportSettings_schedule_format_tsv_failedMethodBlock")
  end   
end

def xt_monitors_exportSettings_format_xls() # use tab delimiter for this export test
  begin
    sleep 1
    $browser.text_field(:name => "title").set 'xlsTest'
    $browser.select(:class => "xy-export-format-select ng-valid ng-dirty").select 'XLS'
    $browser.div(:class => "col-md-3 xy-align-right").select(:class => "xy-export-format-select ng-valid ng-dirty").select 'Tabs'
    xt_assertElementExists('xt_monitors_exportSettings_format_xls',"XLS")
    xt_ScreenCapture("xt_monitors_exportSettings_format_xls")
  rescue 
    xt_increment_failed("xt_monitors_exportSettings_format_xls")
    xt_ScreenCapture("xt_monitors_exportSettings_schedule_format_xls_failedMethodBlock")
  end   
end

def xt_monitors_exportSettings_format_pdf() # use no delimiter for this export test
  begin
    sleep 1
    $browser.text_field(:name => "title").set 'pdfTest'
    $browser.select(:class => "xy-export-format-select ng-valid ng-dirty").select 'PDF'
    $browser.div(:class => "col-md-3 xy-align-right").select(:class => "xy-export-format-select ng-valid ng-dirty").select 'None'
    $browser.text_field(:name => "header").set 'Header Test'
    $browser.text_field(:name => "footer").set 'Footer Test'
    xt_assertElementExists('xt_monitors_exportSettings_format_pdf',"PDF")
    xt_ScreenCapture("xt_monitors_exportSettings_format_pdf")
  rescue 
    xt_increment_failed("xt_monitors_exportSettings_format_pdf")
    xt_ScreenCapture("xt_monitors_exportSettings_schedule_format_pdf_failedMethodBlock")
  end   
end

def xt_monitors_exportSettings_format_rtf() 
  begin
    sleep 1
    $browser.text_field(:name => "title").set 'rtfTest'
    $browser.select(:class => "xy-export-format-select ng-valid ng-dirty").select 'RTF'
    $browser.div(:class => "col-md-3 xy-align-right").select(:class => "xy-export-format-select ng-valid ng-dirty").select 'Spaces'
    $browser.text_field(:name => "header").set 'Header Test'
    $browser.text_field(:name => "footer").set 'Footer Test'
    xt_assertElementExists('xt_monitors_exportSettings_format_rtf',"RTF")
    xt_ScreenCapture("xt_monitors_exportSettings_format_rtf")
  rescue 
    xt_increment_failed("xt_monitors_exportSettings_format_rtf")
    xt_ScreenCapture("xt_monitors_exportSettings_schedule_format_rtf_failedMethodBlock")
  end   
end

def xt_monitors_exportSettings_format_html() 
  begin
    sleep 1
    $browser.text_field(:name => "title").set 'htmlTest'
    $browser.select(:class => "xy-export-format-select ng-valid ng-dirty").select 'HTML'
    $browser.div(:class => "col-md-3 xy-align-right").select(:class => "xy-export-format-select ng-valid ng-dirty").select 'Commas'
    xt_assertElementExists('xt_monitors_exportSettings_format_html',"HTML")
    xt_ScreenCapture("xt_monitors_exportSettings_format_html")
  rescue 
    xt_increment_failed("xt_monitors_exportSettings_format_html")
    xt_ScreenCapture("xt_monitors_exportSettings_schedule_format_html_failedMethodBlock")
  end   
end

def xt_monitors_exportSettings_format_addPath() 
  begin
    sleep 1
    $browser.span(:class => 'xy-action-text').when_present.click
    xt_assertElementExists('xt_monitors_exportSettings_format_addPath',"add")
    xt_ScreenCapture("xt_monitors_exportSettings_format_addPath")
  rescue 
    xt_increment_failed("xt_monitors_exportSettings_format_addPath")
    xt_ScreenCapture("xt_monitors_exportSettings_schedule_format_addPath_failedMethodBlock")
  end   
end

def xt_monitors_exportSettings_format_removePath() 
  begin
    sleep 1
    $browser.div(:class => 'xy-delete-btn pull-right').when_present.click
    xt_assertElementExists('xt_monitors_exportSettings_format_removePath',"remove")
    xt_ScreenCapture("xt_monitors_exportSettings_format_removePath")
  rescue 
    xt_increment_failed("xt_monitors_exportSettings_format_removePath")
    xt_ScreenCapture("xt_monitors_exportSettings_schedule_format_removePath_failedMethodBlock")
  end   
end

def xt_monitors_exportSettings_format_addDocumentFormat() 
  begin
    sleep 1
    $browser.span(:class => 'xy-action-text xy-add-another-format').when_present.click
    xt_assertElementExists('xt_monitors_exportSettings_format_addDocumentFormat',"add")
    xt_ScreenCapture("xt_monitors_exportSettings_format_addDocumentFormat")
  rescue 
    xt_increment_failed("xt_monitors_exportSettings_format_addDocumentFormat")
    xt_ScreenCapture("xt_monitors_exportSettings_schedule_format_addDocumentFormat_failedMethodBlock")
  end   
end

def xt_monitors_exportSettings_format_removeDocumentFormat() 
  begin
    sleep 1
    $browser.span(:text => 'REMOVE').when_present.click
    xt_assertElementExists('xt_monitors_exportSettings_format_removeDocumentFormat',"remove")
    xt_ScreenCapture("xt_monitors_exportSettings_format_removeDocumentFormat")
  rescue 
    xt_increment_failed("xt_monitors_exportSettings_format_removeDocumentFormat")
    xt_ScreenCapture("xt_monitors_exportSettings_schedule_format_removeDocumentFormat_failedMethodBlock")
  end   
end

def xt_monitors_exportSettings_delimiter_none() 
  begin
    sleep 1
    $browser.div(:class => "col-md-3 xy-align-right").select(:class => "xy-export-format-select ng-valid ng-dirty").select 'None'
    xt_assertElementExists('xt_monitors_exportSettings_delimiter_none',"none")
    xt_ScreenCapture("xt_monitors_exportSettings_delimiter_none")
  rescue 
    xt_increment_failed("xt_monitors_exportSettings_delimiter_none")
    xt_ScreenCapture("xt_monitors_exportSettings_schedule_delimiter_none_failedMethodBlock")
  end   
end

def xt_monitors_exportSettings_delimiter_commas() 
  begin
    sleep 1
    $browser.div(:class => "col-md-3 xy-align-right").select(:class => "xy-export-format-select ng-valid ng-dirty").select 'Commas'
    xt_assertElementExists('xt_monitors_exportSettings_delimiter_commas',"comma")
    xt_ScreenCapture("xt_monitors_exportSettings_delimiter_commas")
  rescue 
    xt_increment_failed("xt_monitors_exportSettings_delimiter_commas")
    xt_ScreenCapture("xt_monitors_exportSettings_schedule_delimiter_commas_failedMethodBlock")
  end   
end

def xt_monitors_exportSettings_delimiter_spaces() 
  begin
    sleep 1
    $browser.div(:class => "col-md-3 xy-align-right").select(:class => "xy-export-format-select ng-valid ng-dirty").select 'Spaces'
    xt_assertElementExists('xt_monitors_exportSettings_delimiter_spaces',"space")
    xt_ScreenCapture("xt_monitors_exportSettings_delimiter_spaces")
  rescue 
    xt_increment_failed("xt_monitors_exportSettings_delimiter_spaces")
    xt_ScreenCapture("xt_monitors_exportSettings_schedule_delimiter_spaces_failedMethodBlock")
  end   
end

def xt_monitors_exportSettings_delimiter_tabs() 
  begin
    sleep 1
    $browser.div(:class => "col-md-3 xy-align-right").select(:class => "xy-export-format-select ng-valid ng-dirty").select 'Tabs'
    xt_assertElementExists('xt_monitors_exportSettings_delimiter_tabs',"tab")
    xt_ScreenCapture("xt_monitors_exportSettings_delimiter_tabs")
  rescue 
    xt_increment_failed("xt_monitors_exportSettings_delimiter_tabs")
    xt_ScreenCapture("xt_monitors_exportSettings_schedule_delimiter_tabs_failedMethodBlock")
  end   
end


# .............................................................................................................................Monitor - Results.................................................................................................

def xt_monitors_results_all()
  begin
    sleep 1
    $browser.a(:text => 'RESULTS').when_present.click
    xt_assertElementExists('xt_monitors_results_all',"ALL")
    xt_ScreenCapture("xt_monitors_results_all")
  rescue 
    xt_increment_failed("xt_monitors_results_all")
    xt_ScreenCapture("xt_monitors_results_all_failedMethodBlock")
  end   
end

def xt_monitors_results_alerts()
  begin
    sleep 1
    $browser.a(:text => 'RESULTS').when_present.click
    $browser.a(:text => 'ALERTS').when_present.click
    xt_assertElementExists('xt_monitors_results_alerts',"Alert Status:")
    xt_ScreenCapture("xt_monitors_results_alerts")
  rescue 
    xt_increment_failed("xt_monitors_results_alerts")
    xt_ScreenCapture("xt_monitors_results_alerts_failedMethodBlock")
  end   
end

def xt_monitors_results_refresh()
  begin
    sleep 1
    $browser.a(:text => 'RESULTS').when_present.click
    $browser.span(:class => 'xy-refresh glyphicon glyphicon-refresh ng-scope').when_present.click
    # xt_assertion()
    # xt_ScreenCapture()
  rescue 
    # xt_increment_failed()
    # xt_ScreenCapture()
  end   
end

def xt_monitors_results_groupColumns()
  begin
    sleep 1
    xt_assertion()
    xt_ScreenCapture()
  rescue 
    xt_increment_failed()
    xt_ScreenCapture()
  end   
end

def xt_monitors_results_gridSortHeader_ascending()
  begin
    sleep 1
    $browser.a(:text => 'RESULTS').when_present.click
    $browser.th(:index => 1).span(:class => 'k-icon k-i-arrowhead-s').when_present.click
    $browser.span(:class => 'k-sprite k-i-sort-asc').when_present.click
    xt_assertElementExists('xt_monitors_results_gridSortHeader_ascending','k-icon k-i-arrow-n')
    xt_ScreenCapture("xt_monitors_results_gridSortHeader_ascending")
  rescue 
    xt_increment_failed("xt_monitors_results_gridSortHeader_ascending")
    xt_ScreenCapture("xt_monitors_results_gridSortHeader_ascending_failedMethodBlock")
  end   
end

def xt_monitors_results_gridSortHeader_descending()
  begin
    sleep 1
    $browser.a(:text => 'RESULTS').when_present.click
    $browser.th(:index => 1).span(:class => 'k-icon k-i-arrowhead-s').when_present.click
    $browser.span(:class => 'k-sprite k-i-sort-desc').when_present.click
    xt_assertElementExists('xt_monitors_results_gridSortHeader_descending','k-icon k-i-arrow-s')
    xt_ScreenCapture("xt_monitors_results_gridSortHeader_descending")
  rescue 
    xt_increment_failed("xt_monitors_results_gridSortHeader_descending")
    xt_ScreenCapture("xt_monitors_results_gridSortHeader_descending_failedMethodBlock")
  end   
end

def xt_monitors_results_gridSortHeader_columns()
  begin
    sleep 1
    xt_assertion()
    xt_ScreenCapture()
  rescue 
    xt_increment_failed()
    xt_ScreenCapture()
  end   
end

def xt_monitors_results_gridSortHeader_columns_isFrozen() #this method may be in the wrong section need to ask for clarification
  begin
    sleep 1
    $browser.a(:text => 'RESULTS').when_present.click
    $browser.a(:text => 'IsFrozen').when_present.click
    if $browser.a(:text => 'IsFrozen').span(:class => "k-icon k-i-arrow-n").when_present.exists? == true
      asc = $browser.tr(:class =>"ng-scope").cell(:index => 1).when_present.text
    else
      asc = ""
    end
    $browser.a(:text => 'IsFrozen').when_present.click
    if $browser.a(:text => 'IsFrozen').span(:class => "k-icon k-i-arrow-s").when_present.exists? == true
      desc = $browser.tr(:class =>"ng-scope").cell(:index => 1).when_present.text
    else
      desc = ""
    end
    if asc != desc 
      xt_ScreenCapture("xt_monitors_results_gridSortHeader_columns_isFrozen")      
      xt_assertPassed('xt_monitors_results_gridSortHeader_columns_isFrozen', "k-icon k-i-arrow-s")

    else
      puts "xt_monitors_results_gridSortHeader_columns_isFrozen Failed!"
    end
  rescue 
    xt_increment_failed("xt_monitors_results_gridSortHeader_columns_isFrozen")
    xt_ScreenCapture("xt_monitors_results_gridSortHeader_columns_isFrozen_failedMethodBlock")
  end      
end

def xt_monitors_results_gridSortHeader_columns_initialDirectory()
  begin
    sleep 1
    xt_assertion()
    xt_ScreenCapture()
  rescue 
    xt_increment_failed()
    xt_ScreenCapture()
  end   
end

def xt_monitors_results_gridSortHeader_columns_auditAuthenticateFail()
  begin
    sleep 1    
    xt_assertion()
    xt_ScreenCapture()
  rescue 
    xt_increment_failed()
    xt_ScreenCapture()
  end   
end

def xt_monitors_results_gridSortHeader_columns_auditAuthenticatePass()
  begin
    sleep 1
    xt_assertion()
    xt_ScreenCapture()
  rescue 
    xt_increment_failed()
    xt_ScreenCapture()
  end   
end

def xt_monitors_results_gridSortHeader_filter()
  begin
    sleep 1
    $browser.a(:text => 'RESULTS').when_present.click
    $browser.th(:index => 1).span(:class => 'k-icon k-i-arrowhead-s').when_present.click
     $browser.span(:class => 'k-sprite k-filter').when_present.click
    xt_assertElementExists('xt_monitors_results_gridSortHeader_filter',"Show items")
    xt_ScreenCapture("xt_monitors_results_gridSortHeader_filter")
  rescue 
    xt_increment_failed("xt_monitors_results_gridSortHeader_filter")
    xt_ScreenCapture("xt_monitors_results_gridSortHeader_filter_failedMethodBlock")
  end   
end

def xt_monitors_results_gridSortHeader_filter_isEqualTo() 
  begin
    sleep 1
    $browser.a(:text => 'RESULTS').when_present.click
    $browser.th(:index => 1).span(:class => 'k-icon k-i-arrowhead-s').when_present.click
    $browser.span(:class => 'k-sprite k-filter').when_present.click
    $browser.text_field(:xpath => "//input[@class='k-textbox']").when_present.set '\X'
    $browser.button(:text => 'Filter').when_present.click
    xt_assertElementExists('xt_monitors_results_gridSortHeader_filter_isEqualTo',"\X")
    xt_ScreenCapture("xt_monitors_results_gridSortHeader_filter_isEqualTo")
  rescue 
    xt_increment_failed("xt_monitors_results_gridSortHeader_filter_isEqualTo")
    xt_ScreenCapture("xt_monitors_results_gridSortHeader_filter_isEqualTo_failedMethodBlock")
  end   
end

def xt_monitors_results_gridSortHeader_filter_isEqualTo_clear() #Assertion needs to be reworked, Brainstorming
  begin
    sleep 1
    $browser.a(:text => 'RESULTS').when_present.click
    $browser.th(:index => 1).span(:class => 'k-icon k-i-arrowhead-s').when_present.click
    $browser.span(:class => 'k-sprite k-filter').when_present.click
    $browser.text_field(:xpath => "//input[@class='k-textbox']").when_present.set '\X'
    $browser.button(:text => 'Clear').when_present.click
    xt_assertElementExists('xt_monitors_results_gridSortHeader_filter_isEqualTo_clear',"\X")
    xt_ScreenCapture("xt_monitors_results_gridSortHeader_filter_isEqualTo_clear")
  rescue 
    xt_increment_failed("xt_monitors_results_gridSortHeader_filter_isEqualTo_clear")
    xt_ScreenCapture("xt_monitors_results_gridSortHeader_filter_isEqualTo_clear_failedMethodBlock")
 isequal end   
end

def xt_monitors_results_gridSortAlerts() #Alerts don't sort in Results All
  begin
    sleep 1
    xt_assertion()
    xt_ScreenCapture()
  rescue 
    xt_increment_failed()
    xt_ScreenCapture()
  end   
end

def xt_monitors_results_gridSortNodeName()
  begin
    sleep 1
    $browser.a(:text => 'RESULTS').when_present.click
    $browser.a(:text => 'Node Name').when_present.click
    if $browser.a(:text => 'Node Name').span(:class => "k-icon k-i-arrow-n").when_present.exists? == true
      asc = $browser.tr(:class =>"ng-scope").cell(:index => 1).when_present.text
    else
      asc = ""
    end
    $browser.a(:text => 'Node Name').when_present.click
    if $browser.a(:text => 'Node Name').span(:class => "k-icon k-i-arrow-s").when_present.exists? == true
      desc = $browser.tr(:class =>"ng-scope").cell(:index => 1).when_present.text
    else
      desc = ""
    end
    if asc != desc 
      xt_ScreenCapture("xt_monitors_results_gridSortNodeName")      
      xt_assertPassed('xt_monitors_results_gridSortNodeName', "k-icon k-i-arrow-s")

    else
      puts "xt_monitors_results_gridSortNodeName Failed!"
    end
  rescue 
    xt_increment_failed("xt_monitors_results_gridSortNodeName")
    xt_ScreenCapture("xt_monitors_results_gridSortNodeName_failedMethodBlock")
  end      
end

def xt_monitors_results_gridSortUser()
  begin
    sleep 1
    $browser.a(:text => 'RESULTS').when_present.click
    $browser.a(:text => 'User').when_present.click
    if $browser.a(:text => 'User').span(:class => "k-icon k-i-arrow-n").when_present.exists? == true
      asc = $browser.tr(:class =>"ng-scope").cell(:index => 1).when_present.text
    else
      asc = ""
    end
    $browser.a(:text => 'User').when_present.click
    if $browser.a(:text => 'User').span(:class => "k-icon k-i-arrow-s").when_present.exists? == true
      desc = $browser.tr(:class =>"ng-scope").cell(:index => 1).when_present.text
    else
      desc = ""
    end
    if asc != desc 
      xt_ScreenCapture("xt_monitors_results_gridSortUser")      
      xt_assertPassed('xt_monitors_results_gridSortUser', "k-icon k-i-arrow-s")

    else
      puts "xt_monitors_results_gridSortUser Failed!"
    end
  rescue 
    xt_increment_failed("xt_monitors_results_gridSortUser")
    xt_ScreenCapture("xt_monitors_results_gridSortUser_failedMethodBlock")
  end   
end

def xt_monitors_results_gridDragSortIsFrozen()
  begin
    sleep 1
    xt_assertion()
    xt_ScreenCapture()
  rescue 
    xt_increment_failed()
    xt_ScreenCapture()
  end   
end

def xt_monitors_results_gridSortInitialDirectory()
  begin
    sleep 1
    $browser.a(:text => 'RESULTS').when_present.click
    $browser.a(:text => 'InitialDirectory').when_present.click
    if $browser.a(:text => 'InitialDirectory').span(:class => "k-icon k-i-arrow-n").when_present.exists? == true
      asc = $browser.tr(:class =>"ng-scope").cell(:index => 1).when_present.text
    else
      asc = ""
    end
    $browser.a(:text => 'InitialDirectory').when_present.click
    if $browser.a(:text => 'InitialDirectory').span(:class => "k-icon k-i-arrow-s").when_present.exists? == true
      desc = $browser.tr(:class =>"ng-scope").cell(:index => 1).when_present.text
    else
      desc = ""
    end
    if asc != desc 
      xt_ScreenCapture("xt_monitors_results_gridSortInitialDirectory")      
      xt_assertPassed('xt_monitors_results_gridSortInitialDirectory', "k-icon k-i-arrow-s")

    else
      puts "xt_monitors_results_gridSortInitialDirectory Failed!"
    end
  rescue 
    xt_increment_failed("xt_monitors_results_gridSortInitialDirectory")
    xt_ScreenCapture("xt_monitors_results_gridSortInitialDirectory_failedMethodBlock")
  end   
end

def xt_monitors_results_gridSortAuditAuthenticateFail()
  begin
    sleep 1
    $browser.a(:text => 'RESULTS').when_present.click
    $browser.a(:text => 'AuditAuthenticateFail').when_present.click
    if $browser.a(:text => 'AuditAuthenticateFail').span(:class => "k-icon k-i-arrow-n").when_present.exists? == true
      asc = $browser.tr(:class =>"ng-scope").cell(:index => 1).when_present.text
    else
      asc = ""
    end
    $browser.a(:text => 'AuditAuthenticateFail').when_present.click
    if $browser.a(:text => 'AuditAuthenticateFail').span(:class => "k-icon k-i-arrow-s").when_present.exists? == true
      desc = $browser.tr(:class =>"ng-scope").cell(:index => 1).when_present.text
    else
      desc = ""
    end
    if asc != desc 
      xt_ScreenCapture("xt_monitors_results_gridSortAuditAuthenticateFail")      
      xt_assertPassed('xt_monitors_results_gridSortAuditAuthenticateFail', "k-icon k-i-arrow-s")

    else
      puts "xt_monitors_results_gridSortAuditAuthenticateFail Failed!"
    end
  rescue 
    xt_increment_failed("xt_monitors_results_gridSortAuditAuthenticateFail")
    xt_ScreenCapture("xt_monitors_results_gridSortAuditAuthenticateFail_failedMethodBlock")
  end   
end

def xt_monitors_results_gridSortAuditAuthenticatePass()
  begin
    sleep 1
    $browser.a(:text => 'RESULTS').when_present.click
    $browser.a(:text => 'AuditAuthenticatePass').when_present.click
    if $browser.a(:text => 'AuditAuthenticatePass').span(:class => "k-icon k-i-arrow-n").when_present.exists? == true
      asc = $browser.tr(:class =>"ng-scope").cell(:index => 1).when_present.text
    else
      asc = ""
    end
    $browser.a(:text => 'AuditAuthenticatePass').when_present.click
    if $browser.a(:text => 'AuditAuthenticatePass').span(:class => "k-icon k-i-arrow-s").when_present.exists? == true
      desc = $browser.tr(:class =>"ng-scope").cell(:index => 1).when_present.text
    else
      desc = ""
    end
    if asc != desc 
      xt_ScreenCapture("xt_monitors_results_gridSortAuditAuthenticatePass")      
      xt_assertPassed('xt_monitors_results_gridSortAuditAuthenticatePass', "k-icon k-i-arrow-s")

    else
      puts "xt_monitors_results_gridSortAuditAuthenticatePass Failed!"
    end
  rescue 
    xt_increment_failed("xt_monitors_results_gridSortAuditAuthenticatePass")
    xt_ScreenCapture("xt_monitors_results_gridSortAuditAuthenticatePass_failedMethodBlock")
  end   
end

def xt_monitors_results_gridAlertCellAttributes_clearRow()
  begin
    sleep 1
    $browser.div(:xpath => "//div[@class='xy-flag-icon']").when_present.click
    $browser.a(:text => 'RESULTS').when_present.click
    $browser.a(:text => 'ALERTS').when_present.click
    assertRowsText = $browser.div(:class => 'monitor-alerts ng-binding').text
    $browser.button(:xpath, "//button[contains(@style,'display: inline-block; width: 91px; margin-right: 20px; margin-left: 10px;')]").when_present.click
    sleep 1
    $browser.button(:class => 'btn btn-default button-dark pull-right').when_present.click
    sleep 1
    assertRowsTextNew = $browser.div(:class => 'monitor-alerts ng-binding').text
    if assertRowsTextNew != assertRowsText
      xt_ScreenCapture("xt_monitors_results_gridAlertCellAttributes_clearRow")
      xt_assertPassed('xt_monitors_results_gridAlertCellAttributes_clearRow', 'ng-binding')
    else
      puts "xt_monitors_results_gridAlertCellAttributes_clearRow Failed"
    end
  rescue 
    xt_increment_failed("xt_monitors_results_gridAlertCellAttributes_clearRow")
    xt_ScreenCapture("xt_monitors_results_gridAlertCellAttributes_clearRow_failedMethodBlock")
  end   
end

def xt_monitors_results_gridAlertCellAttributes_ball()
  begin
    sleep 1
    xt_assertion()
    xt_ScreenCapture()
  rescue 
    xt_increment_failed()
    xt_ScreenCapture()
  end   
end

def xt_monitors_results_gridAlertCellAttributes_number()
  begin
    sleep 1
    xt_assertion()
    xt_ScreenCapture()
  rescue 
    xt_increment_failed()
    xt_ScreenCapture()
  end   
end

def xt_monitors_results_gridNodeNameCell()
  begin
    sleep 1
    xt_assertion()
    xt_ScreenCapture()
  rescue 
    xt_increment_failed()
    xt_ScreenCapture()
  end   
end

def xt_monitors_results_gridNodeNameCell_entityAlertHistory_changed()
  begin
    sleep 1
    # $browser.a(:text => 'RESULTS').when_present.click
    # $browser.div(:xpath => "//div[@class='xy-flag-icon']").when_present.click
    # $browser.a(:text => 'ALERTS').when_present.click
    # $browser.a(:class => 'xy-details-link').when_present.click
    xt_assertElementExists('xt_monitors_results_gridNodeNameCell_entityAlertHistory_changed',"Changed")
    xt_ScreenCapture("xt_monitors_results_gridNodeNameCell_entityAlertHistory_changed")
  rescue 
    xt_increment_failed("xt_monitors_results_gridNodeNameCell_entityAlertHistory_changed")
    xt_ScreenCapture("xt_monitors_results_gridNodeNameCell_entityAlertHistory_changed_failedMethodBlock")
  end   
end

def xt_monitors_results_gridNodeNameCell_entityAlertHistory_new()
  begin
    sleep 1
    # $browser.a(:text => 'RESULTS').when_present.click
    # sleep 1
    # $browser.div(:xpath => "//div[@class='xy-flag-icon']").when_present.click
    # $browser.a(:text => 'ALERTS').when_present.click
    $browser.a(:class => 'xy-details-link').when_present.click
    xt_assertElementExists('xt_monitors_results_gridNodeNameCell_entityAlertHistory_new',"New")
    xt_ScreenCapture("xt_monitors_results_gridNodeNameCell_entityAlertHistory_new")
  rescue 
    xt_increment_failed("xt_monitors_results_gridNodeNameCell_entityAlertHistory_new")
    xt_ScreenCapture("xt_monitors_results_gridNodeNameCell_entityAlertHistory_new_failedMethodBlock")
  end   
end

def xt_monitors_results_gridNodeNameCell_entityAlertHistory_missing()
  begin
    sleep 1
    # $browser.a(:text => 'RESULTS').when_present.click
    # $browser.div(:xpath => "//div[@class='xy-flag-icon']").when_present.click
    # $browser.a(:text => 'ALERTS').when_present.click
    # $browser.a(:class => 'xy-details-link').when_present.click
    xt_assertElementExists('xt_monitors_results_gridNodeNameCell_entityAlertHistory_missing',"Missing")
    xt_ScreenCapture("xt_monitors_results_gridNodeNameCell_entityAlertHistory_missing")
  rescue 
    xt_increment_failed("xt_monitors_results_gridNodeNameCell_entityAlertHistory_missing")
    xt_ScreenCapture("xt_monitors_results_gridNodeNameCell_entityAlertHistory_missing_failedMethodBlock")
  end   
end

def xt_monitors_results_gridNodeNameCell_entityAlertHistory_submit()
  begin
    sleep 1
    xt_assertion()
    xt_ScreenCapture()
  rescue 
    xt_increment_failed()
    xt_ScreenCapture()
  end   
end

def xt_monitors_results_gridNodeNameCell_entityAlertHistory_clear()
  begin
    sleep 1
    # $browser.a(:text => 'RESULTS').when_present.click
    # $browser.div(:xpath => "//div[@class='xy-flag-icon']").when_present.click
    # $browser.a(:text => 'ALERTS').when_present.click
    # $browser.a(:class => 'xy-details-link').when_present.click
    $browser.button(:class => 'btn btn-default button-dark pull-right comment-clear-button').when_present.click
    xt_assertElementExists('xt_monitors_results_gridNodeNameCell_entityAlertHistory_clear',"Alert cleared by")
    xt_ScreenCapture("xt_monitors_results_gridNodeNameCell_entityAlertHistory_clear")
  rescue 
    xt_increment_failed("xt_monitors_results_gridNodeNameCell_entityAlertHistory_clear")
    xt_ScreenCapture("xt_monitors_results_gridNodeNameCell_entityAlertHistory_clear_failedMethodBlock")
  end   
end

def xt_monitors_results_gridNodeNameCell_entityAlertHistory_clearAll()
  begin
    sleep 1
    # $browser.a(:text => 'RESULTS').when_present.click
    # $browser.div(:xpath => "//div[@class='xy-flag-icon']").when_present.click
    # $browser.a(:text => 'ALERTS').when_present.click
    # $browser.a(:class => 'xy-details-link').when_present.click
    $browser.button(:xpath, "//button[@ng-if='!alertHistoryIsEmpty()']").when_present.click
    $browser.button(:class => 'btn btn-default button-dark pull-right confirm-clear-button').when_present.click
    xt_assertElementExists('xt_monitors_results_gridNodeNameCell_entityAlertHistory_clearAll',": 0")
    xt_ScreenCapture("xt_monitors_results_gridNodeNameCell_entityAlertHistory_clearAll")
  rescue 
    xt_increment_failed("xt_monitors_results_gridNodeNameCell_entityAlertHistory_clearAll")
    xt_ScreenCapture("xt_monitors_results_gridNodeNameCell_entityAlertHistory_clearAll_failedMethodBlock")
  end   
end

def xt_monitors_results_gridNodeNameCell_entityAlertHistory_addComment()
  begin
    sleep 1
    # $browser.a(:text => 'RESULTS').when_present.click
    # $browser.div(:xpath => "//div[@class='xy-flag-icon']").when_present.click
    # $browser.a(:text => 'ALERTS').when_present.click
    # $browser.a(:class => 'xy-details-link').when_present.click
    $browser.textarea(:class => 'form-control comment-add-input ng-pristine ng-valid').when_present.set 'Test'
    $browser.button(:text => 'ADD COMMENT').when_present.click
    xt_assertElementExists('xt_monitors_results_gridNodeNameCell_entityAlertHistory_addComment',"Test")
    xt_ScreenCapture("xt_monitors_results_gridNodeNameCell_entityAlertHistory_addComment")
  rescue 
    xt_increment_failed("xt_monitors_results_gridNodeNameCell_entityAlertHistory_addComment")
    xt_ScreenCapture("xt_monitors_results_gridNodeNameCell_entityAlertHistory_addComment_failedMethodBlock")
  end   
end

def xt_monitors_results_gridNodeNameCell_entityAlertHistory_close()
  begin
    sleep 1
    # $browser.a(:text => 'RESULTS').when_present.click
    # $browser.div(:xpath => "//div[@class='xy-flag-icon']").when_present.click
    # $browser.a(:text => 'ALERTS').when_present.click
    # $browser.a(:class => 'xy-details-link').when_present.click
    $browser.div(:xpath, "//div[@class='closebtn pull-right']").when_present.click
    xt_assertElementExists('xt_monitors_results_gridNodeNameCell_entityAlertHistory_close', 'Alert Status:')
    xt_ScreenCapture("xt_monitors_results_gridNodeNameCell_entityAlertHistory_close")
  rescue 
    xt_increment_failed("xt_monitors_results_gridNodeNameCell_entityAlertHistory_close")
    xt_ScreenCapture("xt_monitors_results_gridNodeNameCell_entityAlertHistory_close_failedMethodBlock")
  end   
end

def xt_monitors_results_gridUserCell_entityAlertHistory_close() # tested all the entityAlertHistory functions in the User cell
  begin
    sleep 1
    $browser.a(:text => 'RESULTS').when_present.click
    cellName = 'User'
    if cellName.exists? == true
      $browser.a(:text => 'User').button(:class => 'xy-full-height xy-grid-button xy-no-left-border xy-transparent-border').when_present.click
      $browser.div(:xpath => "//div[@class='closebtn pull-right']").when_present.click
      xt_ScreenCapture("xt_monitors_results_gridUserCell_entityAlertHistory_close")
      xt_assertPassed('xt_monitors_results_gridUserCell_entityAlertHistory_close', 'ng-binding')
    else
       xt_assertFailed("xt_monitors_results_gridUserCell_entityAlertHistory_close", 'xy-full-height xy-grid-button xy-no-left-border xy-transparent-border')
    end
  rescue 
    xt_increment_failed('xt_monitors_results_gridUserCell_entityAlertHistory_close')
    xt_ScreenCapture('xt_monitors_results_gridUserCell_entityAlertHistory_close_failedMethodBlock')
  end   
end

def xt_monitors_results_gridIsFrozen_attributeAlertHistory_close() # tested all the attributeAlertHistory functions in the dashboard_viewAllAlerts_gridDetails cell
  begin
    sleep 1
    $browser.a(:text => 'RESULTS').when_present.click
    sleep 2
    puts $browser.th(:text => 'IsFrozen').index
    if $browser.a(:text => 'IsFrozen').exists? == true
      $browser.button(:class => 'xy-full-height xy-grid-button xy-no-left-border xy-transparent-border').when_present.click
      $browser.div(:xpath => "//div[@class='closebtn pull-right']").when_present.click
      xt_ScreenCapture("xt_monitors_results_gridIsFrozen_attributeAlertHistory_close")
      xt_assertPassed('xt_monitors_results_gridIsFrozen_attributeAlertHistory_close', 'ng-binding')
    else
       xt_assertFailed("xt_monitors_results_gridIsFrozen_attributeAlertHistory_close", 'xy-full-height xy-grid-button xy-no-left-border xy-transparent-border')
    end
  rescue 
    xt_increment_failed('xt_monitors_results_gridIsFrozen_attributeAlertHistory_close')
    xt_ScreenCapture('xt_monitors_results_gridIsFrozen_attributeAlertHistory_close_failedMethodBlock')
  end   
end

def xt_monitors_results_gridInitialDirectory_attributeAlertHistory_close() # tested all the attributeAlertHistory functions in the dashboard_viewAllAlerts_gridDetails cell
  begin
    sleep 1
    xt_assertion()
    xt_ScreenCapture()
  rescue 
    xt_increment_failed()
    xt_ScreenCapture()
  end   
end

def xt_monitors_results_gridAuditAuthenticateFail_alertHistory_close() # alertHistory modal is empty
  begin
    sleep 1
    xt_assertion()
    xt_ScreenCapture()
  rescue 
    xt_increment_failed()
    xt_ScreenCapture()
  end   
end

def xt_monitors_results_gridAuditAuthenticatePass_alertHistory_close() # alertHistory modal is empty
  begin
    sleep 1
    xt_assertion()
    xt_ScreenCapture()
  rescue 
    xt_increment_failed()
    xt_ScreenCapture()
  end   
end

def xt_monitors_results_gridCellAttributes_alertNumber() 
  begin
    sleep 1
    xt_assertion()
    xt_ScreenCapture()
  rescue 
    xt_increment_failed()
    xt_ScreenCapture()
  end   
end

def xt_monitors_results_gridCellAttributes_comment() 
  begin
    sleep 1
    xt_assertion()
    xt_ScreenCapture()
  rescue 
    xt_increment_failed()
    xt_ScreenCapture()
  end   
end

# .............................................................................................................................Security - OWASP...........................................................................................................

def xt_owasp_1() 
  begin
    sleep 1
    xt_assertion()
    xt_ScreenCapture()
  rescue 
    xt_increment_failed()
    xt_ScreenCapture()
  end   
end

def xt_owasp_2() 
  begin
    sleep 1
    xt_assertion()
    xt_ScreenCapture()
  rescue 
    xt_increment_failed()
    xt_ScreenCapture()
  end   
end

def xt_owasp_3() 
  begin
    sleep 1
    xt_assertion()
    xt_ScreenCapture()
  rescue 
    xt_increment_failed()
    xt_ScreenCapture()
  end   
end

def xt_owasp_4() 
  begin
    sleep 1
    xt_assertion()
    xt_ScreenCapture()
  rescue 
    xt_increment_failed()
    xt_ScreenCapture()
  end   
end

def xt_owasp_5() 
  begin
    sleep 1
    xt_assertion()
    xt_ScreenCapture()
  rescue 
    xt_increment_failed()
    xt_ScreenCapture()
  end   
end

def xt_owasp_6() 
  begin
    sleep 1
    xt_assertion()
    xt_ScreenCapture()
  rescue 
    xt_increment_failed()
    xt_ScreenCapture()
  end   
end

def xt_owasp_7() 
  begin
    sleep 1
    xt_assertion()
    xt_ScreenCapture()
  rescue 
    xt_increment_failed()
    xt_ScreenCapture()
  end   
end

def xt_owasp_8() 
  begin
    sleep 1
    xt_assertion()
    xt_ScreenCapture()
  rescue 
    xt_increment_failed()
    xt_ScreenCapture()
  end   
end

def xt_owasp_9() 
  begin
    sleep 1
    xt_assertion()
    xt_ScreenCapture()
  rescue 
    xt_increment_failed()
    xt_ScreenCapture()
  end   
end

def xt_owasp_10() 
  begin
    sleep 1
    xt_assertion()
    xt_ScreenCapture()
  rescue 
    xt_increment_failed()
    xt_ScreenCapture()
  end   
end



# .............................................................................................................................Defects..................................................................................................................

def xt_utr_1() 
  begin
    sleep 1
    xt_assertion()
    xt_ScreenCapture()
  rescue 
    xt_increment_failed()
    xt_ScreenCapture()
  end   
end

def xt_utr_2() 
  begin
    sleep 1
    xt_assertion()
    xt_ScreenCapture()
  rescue 
    xt_increment_failed()
    xt_ScreenCapture()
  end   
end

def xt_utr_3() 
  begin
    sleep 1
    xt_assertion()
    xt_ScreenCapture()
  rescue 
    xt_increment_failed()
    xt_ScreenCapture()
  end   
end

def xt_utr_4() 
  begin
    sleep 1
    xt_assertion()
    xt_ScreenCapture()
  rescue 
    xt_increment_failed()
    xt_ScreenCapture()
  end   
end

def xt_utr_5() 
  begin
    sleep 1
    xt_assertion()
    xt_ScreenCapture()
  rescue 
    xt_increment_failed()
    xt_ScreenCapture()
  end   
end

def xt_utr_6() 
  begin
    sleep 1
    xt_assertion()
    xt_ScreenCapture()
  rescue 
    xt_increment_failed()
    xt_ScreenCapture()
  end   
end

def xt_utr_7() 
  begin
    sleep 1
    xt_assertion()
    xt_ScreenCapture()
  rescue 
    xt_increment_failed()
    xt_ScreenCapture()
  end   
end

def xt_utr_8() 
  begin
    sleep 1
    xt_assertion()
    xt_ScreenCapture()
  rescue 
    xt_increment_failed()
    xt_ScreenCapture()
  end   
end

def xt_utr_9() 
  begin
    sleep 1
    xt_assertion()
    xt_ScreenCapture()
  rescue 
    xt_increment_failed()
    xt_ScreenCapture()
  end   
end

def xt_utr_10() 
  begin
    sleep 1
    xt_assertion()
    xt_ScreenCapture()
  rescue 
    xt_increment_failed()
    xt_ScreenCapture()
  end   
end