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
# # .............................................................................................................................Dashboard - All Alert Grid.................................................................................................
# 
# def xt_dashboard_viewAllAlerts()
  # begin
    # $browser.div(:class => "show-all-alerts ng-binding").when_present.click
    # xt_assertion_text('xt_dashboard_viewAllAlerts',"Alert Status:")
    # xt_ScreenCapture("xt_dashboard_viewAllAlerts")
  # rescue 
    # xt_increment_failed("xt_dashboard_viewAllAlerts")
    # xt_ScreenCapture("xt_dashboard_viewAllAlerts_failedMethodBlock")
  # end    
# end
# 
# def xt_dashboard_viewAllAlerts_statusClearedEmpty()
  # begin
    # $browser.div(:class => "col-xs-6 col-md-2 alert-tab-container").span(:text => "CLEARED").when_present.click
    # xt_assertion_text('xt_dashboard_viewAllAlerts_statusClearedEmpty',"Grid of cleared alerts coming soon")
    # xt_ScreenCapture("xt_dashboard_viewAllAlerts_statusClearedEmpty")
  # rescue 
    # xt_increment_failed("xt_dashboard_viewAllAlerts_statusClearedEmpty")
    # xt_ScreenCapture("xt_dashboard_viewAllAlerts_statusClearedEmpty_failedMethodBlock")
  # end     
# end
# 
# def xt_dashboard_viewAllAlerts_statusUncleared()
  # begin
    # $browser.div(:class => "col-xs-6 col-md-2 alert-tab-container").span(:text => "UNCLEARED").when_present.click
    # xt_assertion_text('xt_dashboard_viewAllAlerts_statusUncleared',"Drag a column header and drop it here to group by that column")
    # xt_ScreenCapture("xt_dashboard_viewAllAlerts_statusUncleared")
  # rescue 
    # xt_increment_failed("xt_dashboard_viewAllAlerts_statusUncleared")
    # xt_ScreenCapture("xt_dashboard_viewAllAlerts_statusUncleared_failedMethodBlock")
  # end    
# end
# 
# def xt_dashboard_viewAllAlerts_statusCleared()
  # begin
    # xt_assertion()
    # xt_ScreenCapture()
  # rescue 
    # xt_increment_failed()
    # xt_ScreenCapture()
  # end   
# end
# 
# def xt_dashboard_hideAllAlerts()
  # begin
    # $browser.div(:class => "show-all-alerts ng-binding").when_present.click
    # xt_assertion_passed('xt_dashboard_hideAllAlerts', 'VIEW ALL ALERTS', 'Passed', 'show-all-alerts ng-binding')
    # xt_ScreenCapture("xt_dashboard_hideAllAlerts")
  # rescue 
    # xt_increment_failed("xt_dashboard_hideAllAlerts")
    # xt_ScreenCapture("xt_dashboard_hideAllAlerts_failedMethodBlock")
  # end  
# end
# 
# def xt_dashboard_viewAllAlerts_refresh() 
  # begin
    # $browser.div(:class => "col-xs-1 col-md-1").span(:class => "xy-refresh-white glyphicon glyphicon-refresh ng-scope").when_present.click
    # xt_assertion_passed('xt_dashboard_viewAllAlerts_refresh', 'Refresh the grid with the latest information', 'Passed', 'xy-refresh-white glyphicon glyphicon-refresh ng-scope')
    # # This assertion will be valid when we are able to refresh the grid data
    # xt_ScreenCapture("xt_dashboard_viewAllAlerts_refresh")
  # rescue 
    # xt_increment_failed("xt_dashboard_viewAllAlerts_refresh")
    # xt_ScreenCapture("xt_dashboard_viewAllAlerts_refresh_failedMethodBlock")
  # end  
# end
# 
# def xt_dashboard_viewAllAlerts_groupColumns()
  # begin
    # xt_assertion()
    # xt_ScreenCapture()
  # rescue 
    # xt_increment_failed()
    # xt_ScreenCapture()
  # end   
# end
# 
# def xt_dashboard_viewAllAlerts_gridFooter_rowsPerPage25()
  # begin
    # $browser.select_list(:id,'share-ttl').when_present.select('One Month')
    # #$browser.ul(:class => 'k-list k-reset').li(:text => '25').when_present.click  
    # xt_assertion_text('xt_dashboard_viewAllAlerts_gridFooter_rowsPerPage25',"Rows 1-25")
    # xt_ScreenCapture("xt_dashboard_viewAllAlerts_gridFooter_rowsPerPage25")   
  # rescue 
    # xt_increment_failed("xt_dashboard_viewAllAlerts_gridFooter_rowsPerPage25")
    # xt_ScreenCapture("xt_dashboard_viewAllAlerts_gridFooter_rowsPerPage25_failedMethodBlock")
  # end
# end
# 
# def xt_dashboard_viewAllAlerts_gridFooter_rowsPerPage50()
  # begin
    # $browser.ul(:class => 'k-list k-reset').li(:text => '50').when_present.click  
    # xt_assertion_text('xt_dashboard_viewAllAlerts_gridFooter_rowsPerPage50',"Rows 1-50")
    # xt_ScreenCapture("xt_dashboard_viewAllAlerts_gridFooter_rowsPerPage50")   
  # rescue 
    # xt_increment_failed("xt_dashboard_viewAllAlerts_gridFooter_rowsPerPage50")
    # xt_ScreenCapture("xt_dashboard_viewAllAlerts_gridFooter_rowsPerPage50_failedMethodBlock")
  # end
# end
# 
# 
# def xt_dashboard_viewAllAlerts_gridFooter_rowsPerPage75()
  # begin
    # $browser.ul(:class => 'k-list k-reset').li(:text => '75').when_present.click  
    # xt_assertion_text('xt_dashboard_viewAllAlerts_gridFooter_rowsPerPage75',"Rows 1-75")
    # xt_ScreenCapture("xt_dashboard_viewAllAlerts_gridFooter_rowsPerPage75")   
  # rescue 
    # xt_increment_failed("xt_dashboard_viewAllAlerts_gridFooter_rowsPerPage75")
    # xt_ScreenCapture("xt_dashboard_viewAllAlerts_gridFooter_rowsPerPage75_failedMethodBlock")
  # end
# end
# 
# 
# def xt_dashboard_viewAllAlerts_gridFooter_rowsPerPage100()
  # begin
    # $browser.ul(:class => 'k-list k-reset').li(:text => '100').when_present.click  
    # xt_assertion_text('xt_dashboard_viewAllAlerts_gridFooter_rowsPerPage100',"Rows 1-100")
    # xt_ScreenCapture("xt_dashboard_viewAllAlerts_gridFooter_rowsPerPage100")   
  # rescue 
    # xt_increment_failed("xt_dashboard_viewAllAlerts_gridFooter_rowsPerPage100")
    # xt_ScreenCapture("xt_dashboard_viewAllAlerts_gridFooter_rowsPerPage100_failedMethodBlock")
  # end 
# end
# 
# 
# def xt_dashboard_viewAllAlerts_gridFooter_rowsTotal()
  # begin
    # xt_assertion()
    # xt_ScreenCapture()
  # rescue 
    # xt_increment_failed()
    # xt_ScreenCapture()
  # end   
# end
# 
# def xt_dashboard_viewAllAlerts_gridFooter_nextPrevious()
  # begin
    # xt_assertion()
    # xt_ScreenCapture()
  # rescue 
    # xt_increment_failed()
    # xt_ScreenCapture()
  # end   
# end
# 
# def xt_dashboard_viewAllAlerts_gridFooter_exportsResults()
  # begin
    # xt_assertion()
    # xt_ScreenCapture()
  # rescue 
    # xt_increment_failed()
    # xt_ScreenCapture()
  # end   
# end
# 
# def xt_dashboard_viewAllAlerts_gridSortAlerts() # Grid cells don't have options: comments and alert nums
  # begin
    # xt_assertion()
    # xt_ScreenCapture()
  # rescue 
    # xt_increment_failed()
    # xt_ScreenCapture()
  # end   
# end
# 
# def xt_dashboard_viewAllAlerts_gridSortCollections()
  # begin
    # xt_assertion()
    # xt_ScreenCapture()
  # rescue 
    # xt_increment_failed()
    # xt_ScreenCapture()
  # end   
# end
# 
# def xt_dashboard_viewAllAlerts_gridSortMonitor()
  # begin
    # xt_assertion()
    # xt_ScreenCapture()
  # rescue 
    # xt_increment_failed()
    # xt_ScreenCapture()
  # end   
# end
# 
# def xt_dashboard_viewAllAlerts_gridSortSubsystem()
  # begin
    # xt_assertion()
    # xt_ScreenCapture()
  # rescue 
    # xt_increment_failed()
    # xt_ScreenCapture()
  # end   
# end
# 
# def xt_dashboard_viewAllAlerts_gridSortMonitorType()
  # begin
    # xt_assertion()
    # xt_ScreenCapture()
  # rescue 
    # xt_increment_failed()
    # xt_ScreenCapture()
  # end   
# end
# 
# def xt_dashboard_viewAllAlerts_gridSortNode()
  # begin
    # xt_assertion()
    # xt_ScreenCapture()
  # rescue 
    # xt_increment_failed()
    # xt_ScreenCapture()
  # end   
# end
# 
# def xt_dashboard_viewAllAlerts_gridSortEntity()
  # begin
    # xt_assertion()
    # xt_ScreenCapture()
  # rescue 
    # xt_increment_failed()
    # xt_ScreenCapture()
  # end   
# end
# 
# def xt_dashboard_viewAllAlerts_gridSortAttribute()
  # begin
    # xt_assertion()
    # xt_ScreenCapture()
  # rescue 
    # xt_increment_failed()
    # xt_ScreenCapture()
  # end   
# end
# 
# def xt_dashboard_viewAllAlerts_gridSortPrevious()
  # begin
    # xt_assertion()
    # xt_ScreenCapture()
  # rescue 
    # xt_increment_failed()
    # xt_ScreenCapture()
  # end   
# end
# 
# def xt_dashboard_viewAllAlerts_gridSortCurrent()
  # begin
    # xt_assertion()
    # xt_ScreenCapture()
  # rescue 
    # xt_increment_failed()
    # xt_ScreenCapture()
  # end   
# end
# 
# def xt_dashboard_viewAllAlerts_gridMonitorCell_monitorPage()
  # begin
    # xt_assertion()
    # xt_ScreenCapture()
  # rescue 
    # xt_increment_failed()
    # xt_ScreenCapture()
  # end   
# end
# 
# def xt_dashboard_viewAllAlerts_gridDetails_attributeAlertHistory_changed()
  # begin
    # xt_assertion()
    # xt_ScreenCapture()
  # rescue 
    # xt_increment_failed()
    # xt_ScreenCapture()
  # end   
# end
# 
# def xt_dashboard_viewAllAlerts_gridDetails_attributeAlertHistory_new()
  # begin
    # xt_assertion()
    # xt_ScreenCapture()
  # rescue 
    # xt_increment_failed()
    # xt_ScreenCapture()
  # end   
# end
# 
# def xt_dashboard_viewAllAlerts_gridDetails_attributeAlertHistory_missing()
  # begin
    # xt_assertion()
    # xt_ScreenCapture()
  # rescue 
    # xt_increment_failed()
    # xt_ScreenCapture()
  # end   
# end
# 
# def xt_dashboard_viewAllAlerts_gridDetails_attributeAlertHistory_submit()
  # begin
    # xt_assertion()
    # xt_ScreenCapture()
  # rescue 
    # xt_increment_failed()
    # xt_ScreenCapture()
  # end   
# end
# 
# def xt_dashboard_viewAllAlerts_gridDetails_attributeAlertHistory_clear()
  # begin
    # xt_assertion()
    # xt_ScreenCapture()
  # rescue 
    # xt_increment_failed()
    # xt_ScreenCapture()
  # end   
# end
# 
# def xt_dashboard_viewAllAlerts_gridDetails_attributeAlertHistory_clearAll()
  # begin
    # xt_assertion()
    # xt_ScreenCapture()
  # rescue 
    # xt_increment_failed()
    # xt_ScreenCapture()
  # end   
# end
# 
# def xt_dashboard_viewAllAlerts_gridDetails_attributeAlertHistory_addComment()
  # begin
    # xt_assertion()
    # xt_ScreenCapture()
  # rescue 
    # xt_increment_failed()
    # xt_ScreenCapture()
  # end   
# end
# 
# def xt_dashboard_viewAllAlerts_gridDetails_attributeAlertHistory_close()
  # begin
    # xt_assertion()
    # xt_ScreenCapture()
  # rescue 
    # xt_increment_failed()
    # xt_ScreenCapture()
  # end   
# end
# 
# def xt_dashboard_viewAllAlerts_gridClear()
  # begin
    # xt_assertion()
    # xt_ScreenCapture()
  # rescue 
    # xt_increment_failed()
    # xt_ScreenCapture()
  # end   
# end
# 
# def xt_dashboard_viewAllAlerts_gridClear_addComment()
  # begin
    # xt_assertion()
    # xt_ScreenCapture()
  # rescue 
    # xt_increment_failed()
    # xt_ScreenCapture()
  # end   
# end
# 
# def xt_dashboard_viewAllAlerts_gridClear_cancel()
  # begin
    # xt_assertion()
    # xt_ScreenCapture()
  # rescue 
    # xt_increment_failed()
    # xt_ScreenCapture()
  # end   
# end
# 
# def xt_dashboard_viewAllAlerts_gridClear_confirmClear()
  # begin
    # xt_assertion()
    # xt_ScreenCapture()
  # rescue 
    # xt_increment_failed()
    # xt_ScreenCapture()
  # end   
# end
# 
# def xt_dashboard_viewAllAlerts_gridSystem()
  # begin
    # xt_assertion()
    # xt_ScreenCapture()
  # rescue 
    # xt_increment_failed()
    # xt_ScreenCapture()
  # end   
# end
# 
# def xt_dashboard_moveGroups()
  # begin
    # xt_assertion()
    # xt_ScreenCapture()
  # rescue 
    # xt_increment_failed()
    # xt_ScreenCapture()
  # end   
# end
# 
# def xt_dashboard_visibleGroups() # display the latest 6 groups
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
