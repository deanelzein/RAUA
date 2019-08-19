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
# # .............................................................................................................................Dashboard - Summary.................................................................................................
# 
# def xt_dashboard_graph()
  # begin
    # if $browser.div(:class => "summary-line-chart k-chart").exists?
      # xt_assertion_passed('xt_dashboard_graph', 'Dashboard Graph', 'Passed', 'summary-line-chart k-chart')
      # xt_ScreenCapture("xt_dashboard_graph")
    # end   
  # rescue 
    # xt_increment_failed("xt_dashboard_graph")
    # xt_ScreenCapture("xt_dashboard_graph_failedMethodBlock")
  # end
# end
# 
# def xt_dashboard_totalActiveMonitors()
  # begin
    # activeMonitors = $browser.div(:class => "col-xs-6 col-sm-2 active-monitors-container").div(:class => "total-amount-label ng-binding").text  
    # query = ""
    # #xt_assertion_DB(activeMonitors, "xt_dashboard_totalActiveMonitors", query)
    # xt_ScreenCapture("xt_dashboard_totalActiveMonitors")
  # rescue 
    # xt_increment_failed("xt_dashboard_totalActiveMonitors")
    # xt_ScreenCapture("xt_dashboard_totalActiveMonitors_failedMethodBlock")
  # end
# end
# 
# def xt_dashboard_totalAlerts()
  # begin
    # totalAlerts = $browser.div(:class => "col-xs-6 col-sm-2 alerts-container").div(:class => "total-amount-label ng-binding").text  
    # query = ""
    # #xt_assertion_DB(activeMonitors, "xt_dashboard_totalAlerts", query)
    # xt_ScreenCapture("xt_dashboard_totalAlerts")
  # rescue 
    # xt_increment_failed("xt_dashboard_totalAlerts")
    # xt_ScreenCapture("xt_dashboard_totalAlerts_failedMethodBlock")
  # end
# end
# 
# def xt_dashboard_totalChangedAlerts()
  # begin
    # totalChangedAlerts = $browser.div(:class => "col-xs-2 ng-scope").div(:class => "changed ng-binding").text  
    # query = ""
    # #xt_assertion_DB(activeMonitors, "xt_dashboard_totalChangedAlerts", query)
    # xt_ScreenCapture("xt_dashboard_totalChangedAlerts")
  # rescue 
    # xt_increment_failed("xt_dashboard_totalChangedAlerts")
    # xt_ScreenCapture("xt_dashboard_totalChangedAlerts_failedMethodBlock")
  # end  
# end
# 
# def xt_dashboard_totalNewAlerts()
  # begin
    # totalNewAlerts = $browser.div(:class => "col-xs-2 ng-scope").div(:class => "new ng-binding").text  
    # query = ""
    # #xt_assertion_DB(activeMonitors, "xt_dashboard_totalNewAlerts", query)
    # xt_ScreenCapture("xt_dashboard_totalNewAlerts")
  # rescue 
    # xt_increment_failed("xt_dashboard_totalNewAlerts")
    # xt_ScreenCapture("xt_dashboard_totalNewAlerts_failedMethodBlock")
  # end
# end
# 
# def xt_dashboard_totalMissingAlerts()
  # begin
    # totalMissingAlerts = $browser.div(:class => "col-xs-2 ng-scope").div(:class => "missing ng-binding").text 
    # query = ""
    # #xt_assertion_DB(activeMonitors, "xt_dashboard_totalMissingAlerts", query)
    # xt_ScreenCapture("xt_dashboard_totalMissingAlerts")
  # rescue 
    # xt_increment_failed("xt_dashboard_totalMissingAlerts")
    # xt_ScreenCapture("xt_dashboard_totalMissingAlerts_failedMethodBlock")
  # end  
# end
# 
# def xt_dashboard_noAlerts()
  # begin
    # xt_assertion()
    # xt_ScreenCapture()
  # rescue 
    # xt_increment_failed()
    # xt_ScreenCapture()
  # end   
# end
# 
# def xt_dashboard_pieChart()
  # begin
    # xt_assertion()
    # xt_ScreenCapture()
  # rescue 
    # xt_increment_failed()
    # xt_ScreenCapture()
  # end   
# end
# 
# 
# def xt_dashboard_barChart()
  # begin
    # xt_assertion()
    # xt_ScreenCapture()
  # rescue 
    # xt_increment_failed()
    # xt_ScreenCapture()
  # end   
# end
# 
# def xt_dashboard_causeErrorsFilter()
  # begin
    # sleep 2
    # #$browser.ul(:class => 'dropdown-menu xy-trend-chart-menu').li(:text => 'Cause Errors').exists?
    # puts $browser.ul(:class => 'dropdown-menu xy-trend-chart-menu').lis.first.select
    # #xt_assertion_text('xt_dashboard_causeErrorsFilter',"System Errors")
    # xt_ScreenCapture("xt_dashboard_causeErrorsFilter")
  # rescue 
    # xt_increment_failed("xt_dashboard_causeErrorsFilter")
    # xt_ScreenCapture("xt_dashboard_causeErrorsFilter_failedMethodBlock")
  # end   
# end
# 
# def xt_dashboard_cleanErrorsFilter()
  # begin
    # sleep 2
    # testng = $browser.ul(:class => "btn btn-default dropdown pull-right xy-trend-chart-pulldown").div(:class => "total-amount-label ng-binding").when_present.select('Clear Errors')
    # puts testng
    # #xt_assertion_text('xt_dashboard_cleanErrorsFilter',"System Errors")
    # xt_ScreenCapture("xt_dashboard_cleanErrorsFilter")
  # rescue 
    # xt_increment_failed("xt_dashboard_cleanErrorsFilter")
    # xt_ScreenCapture("xt_dashboard_cleanErrorsFilter_failedMethodBlock")
  # end     
# end
# 
# def xt_dashboard_toggleBarPerGroupFilter()
  # begin
    # $browser.select_list(:class => "btn btn-default dropdown pull-right xy-trend-chart-pulldown").div(:class => "total-amount-label ng-binding").when_present.select('Toggle bar per group')
    # xt_assertion_text('xt_dashboard_toggleBarPerGroupFilter',"System Errors")
    # xt_ScreenCapture("xt_dashboard_toggleBarPerGroupFilter")
  # rescue 
    # xt_increment_failed("xt_dashboard_toggleBarPerGroupFilter")
    # xt_ScreenCapture("xt_dashboard_toggleBarPerGroupFilter_failedMethodBlock")
  # end    
# end
# 
# def xt_dashboard_specifyTopGroups()
  # begin
    # xt_assertion()
    # xt_ScreenCapture()
  # rescue 
    # xt_increment_failed()
    # xt_ScreenCapture()
  # end   
# end
# 
# def xt_dashboard_progressBar()
  # begin
    # xt_assertion()
    # xt_ScreenCapture()
  # rescue 
    # xt_increment_failed()
    # xt_ScreenCapture()
  # end   
# end
