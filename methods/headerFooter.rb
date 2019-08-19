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
# # ............................................................................................................................. Header Bar ....................................................................................................
# 
# def xt_headerLogo()
  # begin
    # if $browser.link(:class => 'navbar-brand header-logo').exists?
      # xt_ScreenCapture("navbarBrand")
      # xt_assertion_passed('xt_navbarBrand', 'Nav Bar Logo', 'Passed', 'navbar-brand header-logo')
    # end 
  # rescue 
    # xt_ScreenCapture("navbarBrand__failedMethodBlock")
    # xt_increment_failed("navbarBrand")
  # end
# end 
# 
# def xt_goToDashboard()
  # begin
    # $browser.ul(:class => 'nav navbar-nav xy_nav-min-width').lis.first.select  
    # xt_assertion_text('xt_goToDashboard',"INTEGRITY CHECK SUMMARY")
    # xt_ScreenCapture("xt_goToDashboard")   
  # rescue 
    # xt_increment_failed("xt_goToDashboard")
    # xt_ScreenCapture("xt_goToDashboard_failedMethodBlock")
  # end
# end
# 
# def xt_goToMonitor()
  # begin
    # $browser.ul(:class => 'nav navbar-nav xy_nav-min-width').li(:text => 'MONITORS').when_present.click  
    # xt_assertion_text('xt_goToMonitor',"NEW GROUP")
    # xt_ScreenCapture("xt_goToMonitor")   
  # rescue 
    # xt_increment_failed("xt_goToMonitor")
    # xt_ScreenCapture("xt_goToMonitor_failedMethodBlock")
  # end
# end  
# 
#     
# # .............................................................................................................................Monitor - Header ....................................................................................................
# 
# 
# def xt_monitor_nameSaveAs() 
  # begin
    # xt_assertion()
    # xt_ScreenCapture()
  # rescue 
    # xt_increment_failed()
    # xt_ScreenCapture()
  # end   
# end
# 
# def xt_monitor_nameSaveAs_cancel() 
  # begin
    # xt_assertion()
    # xt_ScreenCapture()
  # rescue 
    # xt_increment_failed()
    # xt_ScreenCapture()
  # end   
# end
# 
# def xt_monitor_nameRename() 
  # begin
    # xt_assertion()
    # xt_ScreenCapture()
  # rescue 
    # xt_increment_failed()
    # xt_ScreenCapture()
  # end   
# end
# 
# def xt_monitor_nameRename_cancel() 
  # begin
    # xt_assertion()
    # xt_ScreenCapture()
  # rescue 
    # xt_increment_failed()
    # xt_ScreenCapture()
  # end   
# end
# 
# def xt_monitor_nameDelete() 
  # begin
    # xt_assertion()
    # xt_ScreenCapture()
  # rescue 
    # xt_increment_failed()
    # xt_ScreenCapture()
  # end   
# end
# 
# def xt_monitor_nameDelete_cancel() 
  # begin
    # xt_assertion()
    # xt_ScreenCapture()
  # rescue 
    # xt_increment_failed()
    # xt_ScreenCapture()
  # end   
# end
# 
# def xt_monitors_totalAlerts()
  # begin
    # xt_assertion()
    # xt_ScreenCapture()
  # rescue 
    # xt_increment_failed()
    # xt_ScreenCapture()
  # end
# end
# 
# def xt_monitors_totalChangedAlerts()
  # begin
    # xt_assertion()
    # xt_ScreenCapture()
  # rescue 
    # xt_increment_failed()
    # xt_ScreenCapture()
  # end   
# end
# 
# def xt_monitors_totalNewAlerts()
  # begin
    # xt_assertion()
    # xt_ScreenCapture()
  # rescue 
    # xt_increment_failed()
    # xt_ScreenCapture()
  # end   
# end
# 
# def xt_monitors_totalMissingAlerts()
  # begin
    # xt_assertion()
    # xt_ScreenCapture()
  # rescue 
    # xt_increment_failed()
    # xt_ScreenCapture()
  # end   
# end
# 
# def xt_monitors_pieChart()
  # begin
    # xt_assertion()
    # xt_ScreenCapture()
  # rescue 
    # xt_increment_failed()
    # xt_ScreenCapture()
  # end   
# end
# 
# def xt_monitors_barChart()
  # begin
    # xt_assertion()
    # xt_ScreenCapture()
  # rescue 
    # xt_increment_failed()
    # xt_ScreenCapture()
  # end   
# end
# 
# def xt_monitors_clearAll()
  # begin
    # xt_assertion()
    # xt_ScreenCapture()
  # rescue 
    # xt_increment_failed()
    # xt_ScreenCapture()
  # end   
# end