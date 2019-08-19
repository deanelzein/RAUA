require "methods/methods.rb"
def xt_utr_1610() #Will need to do research on possibility of automating this UTR
  begin
    xt_goToDashboard()
    xt_assertion()
    xt_ScreenCapture()
  rescue 
    xt_increment_failed()
    xt_ScreenCapture()
  end   
end

def xt_utr_1614() 
  begin
    xt_goToDashboard()
    xt_dashboard_viewAllAlerts()
    $browser.a(:class => 'xy-details-link').when_present.click
    $browser.textarea(:class => 'form-control comment-add-input ng-pristine ng-valid').set '_ ~ Þ'
    $browser.button(:text => 'ADD COMMENT').when_present.click
    $browser.div(:class => 'closebtn pull-right').when_present.click
    xt_assertElementExists('xt_utr_1614', 'INTEGRITY CHECK SUMMARY')
    xt_ScreenCapture('xt_utr_1614')
  rescue 
    xt_increment_failed('xt_utr_1614')
    xt_ScreenCapture('xt_utr_1614_failedMethodBlock')
  end   
end

def xt_utr_1615() #No way to reset filters at the moment so saving this for later
  begin
    xt_goToDashboard()
    xt_goToMonitor()
    xt_assertion()
    xt_ScreenCapture()
  rescue 
    xt_increment_failed()
    xt_ScreenCapture()
  end   
end

def xt_utr_1616() #Hover does not work as understood need to do more research to automate this UTR
  begin
    xt_goToDashboard()
    xt_goToMonitor()
    $browser.a(:text => 'RESULTS').when_present.click
    $browser.a(:text => 'ALERTS').when_present.click
    $browser.span(:class => 'k-widget k-dropdown k-header').when_present.click
    $browser.span(:class => 'k-widget k-dropdown k-header k-state-border-up').hover
    sleep 5
    #xt_assertion()
    #xt_ScreenCapture()
  rescue 
    #xt_increment_failed()
    #xt_ScreenCapture()
  end   
end

def xt_utr_1617() 
  begin
    xt_goToDashboard()
    xt_goToMonitor()
    $browser.a(:text => 'RESULTS').when_present.click
    $browser.a(:text => 'ALERTS').when_present.click
    $browser.send_keys :space
    $browser.span(:class => 'k-icon k-i-arrow-e').when_present.click
    xt_assertElementExists('xt_utr_1617', 'SAVE AS')
    xt_ScreenCapture('xt_utr_1617')
  rescue 
    xt_increment_failed('xt_utr_1617')
    xt_ScreenCapture('xt_utr_1617_failedMethodBlock')
  end   
end

def xt_utr_1618() #This UTR describes a function that is not present in the current build, however some automation may be possible
  begin
    xt_goToMonitor()
    xt_monitors_definition_node_addNameFilter()
    xt_assertion()
    xt_ScreenCapture()
  rescue 
    xt_increment_failed()
    xt_ScreenCapture()
  end   
end

def xt_utr_1619() 
  begin
    xt_goToDashboard()
    xt_goToMonitor()
    $browser.a(:text => 'RESULTS').when_present.click
    $browser.a(:text => 'ALERTS').when_present.click
    $browser.div(:text =>'Cake').when_present.click
    $browser.a(:class => 'xy-details-link').when_present.click
    xt_assertElementDoesntExists('xt_utr_1619', 'There are no alerts (cleared or uncleared) for this')
    xt_ScreenCapture('xt_utr_1619')
  rescue 
    xt_increment_failed('xt_utr_1619')
    xt_ScreenCapture('xt_utr_1619_failedMethodBlock')
  end   
end

def xt_utr_1620() #Fixed but can still automate
  begin
    xt_goToMonitor()
   puts $browser.div(:class => 'ng-scope ng-binding xy-monitor-list-item-name').text
    # xt_assertion()
    # xt_ScreenCapture()
  rescue 
    # xt_increment_failed()
    # xt_ScreenCapture()
  end   
end

def xt_utr_1621() #Closed, automation may be possible but this UTR is about a function that is not present in the current build
  begin
    xt_assertion()
    xt_ScreenCapture()
  rescue 
    xt_increment_failed()
    xt_ScreenCapture()
  end   
end

def xt_utr_1622() 
  begin
    xt_assertion()
    xt_ScreenCapture()
  rescue 
    xt_increment_failed()
    xt_ScreenCapture()
  end   
end

def xt_utr_1623() #Not a UTR that can be checked
  begin
    xt_assertion()
    xt_ScreenCapture()
  rescue 
    xt_increment_failed()
    xt_ScreenCapture()
  end   
end

def xt_utr_1624() 
  begin
    xt_assertion()
    xt_ScreenCapture()
  rescue 
    xt_increment_failed()
    xt_ScreenCapture()
  end   
end

def xt_utr_1628() 
  begin
    xt_assertion()
    xt_ScreenCapture()
  rescue 
    xt_increment_failed()
    xt_ScreenCapture()
  end   
end

def xt_utr_1631() #Hover research necessary to automate this UTR
  begin
    xt_assertion()
    xt_ScreenCapture()
  rescue 
    xt_increment_failed()
    xt_ScreenCapture()
  end   
end

def xt_utr_1633() 
  begin
    xt_goToDashboard()
    xt_goToMonitor()
    $browser.a(:text => 'RESULTS').when_present.click
    $browser.a(:text => 'User').when_present.click
    $browser.button(:text => 'OK').when_present.click
    sleep 1
    $browser.div(:id => 'clickItem').when_present.click
    xt_assertElementDoesntExists('xt_utr_1633', 'LOAD ALL GRID')
    xt_ScreenCapture('xt_utr_1633')
  rescue 
    xt_increment_failed('xt_utr_1633')
    xt_ScreenCapture('xt_utr_1633_failedMethodBlock')
  end   
end

def xt_utr_1641() #Fixed last message states waiting on push to dev, unsure if this occured.
  begin
    xt_assertion()
    xt_ScreenCapture()
  rescue 
    xt_increment_failed()
    xt_ScreenCapture()
  end   
end

def xt_utr_16() 
  begin
    xt_assertion()
    xt_ScreenCapture()
  rescue 
    xt_increment_failed()
    xt_ScreenCapture()
  end   
end

def xt_utr_1643() #Cannot Reproduce
  begin
    xt_assertion()
    xt_ScreenCapture()
  rescue 
    xt_increment_failed()
    xt_ScreenCapture()
  end   
end

def xt_utr_1644() 
  begin
    xt_assertion()
    xt_ScreenCapture()
  rescue 
    xt_increment_failed()
    xt_ScreenCapture()
  end   
end

def xt_utr_1645() 
  begin
    xt_assertion()
    xt_ScreenCapture()
  rescue 
    xt_increment_failed()
    xt_ScreenCapture()
  end   
end

def xt_utr_1646() #Closed: Behavior as designed
  begin
    xt_assertion()
    xt_ScreenCapture()
  rescue 
    xt_increment_failed()
    xt_ScreenCapture()
  end   
end

def xt_utr_1647() 
  begin
    xt_goToMonitor()
    xt_monitors_group_create()
    # xt_assertion()
    # xt_ScreenCapture()
  rescue 
    # xt_increment_failed()
    # xt_ScreenCapture()
  end   
end

def xt_utr_1650() 
  begin
    xt_goToDashboard()
    xt_dashboard_viewAllAlerts()
    puts $browser.span(:class => 'k-pager-info k-label').text
    # xt_assertion()
    # xt_ScreenCapture()
  rescue 
    # xt_increment_failed()
    # xt_ScreenCapture()
  end   
end

def xt_utr_1653() #Cannot be tested through automation.
  begin
    xt_assertion()
    xt_ScreenCapture()
  rescue 
    xt_increment_failed()
    xt_ScreenCapture()
  end   
end

def xt_utr_1654() #Fixed cannot be tested through automation
  begin
    xt_assertion()
    xt_ScreenCapture()
  rescue 
    xt_increment_failed()
    xt_ScreenCapture()
  end   
end

def xt_utr_1665() #Cannot be automated
  begin
    xt_assertion()
    xt_ScreenCapture()
  rescue 
    xt_increment_failed()
    xt_ScreenCapture()
  end   
end

def xt_utr_1675() 
  begin
    xt_goToDashboard()
    sleep 1
    $browser.div(:class => 'tile-header-label-small').when_present.click
    $browser.div(:class => 'tile-header-dropdown-caret-container pull-right ng-scope').when_present.click
    myList = $browser.ul(:class => 'dropdown-menu xy-dropdown-menu ng-scope')
    puts myList.lis.collect {|li | li.text}
    puts myList.lis.length {|li | li.text}
    # xt_assertion()
    # xt_ScreenCapture()
  rescue 
    # xt_increment_failed()
    # xt_ScreenCapture()
  end   
end

def xt_utr_1678() #Cannot be automated
  begin
    xt_assertion()
    xt_ScreenCapture()
  rescue 
    xt_increment_failed()
    xt_ScreenCapture()
  end   
end

def xt_utr_1679() 
  begin
    xt_assertion()
    xt_ScreenCapture()
  rescue 
    xt_increment_failed()
    xt_ScreenCapture()
  end   
end

def xt_utr_1688() 
  begin
    xt_goToDashboard()
    xt_dashboard_viewAllAlerts()
    $browser.span(:xpath, "//span[@class='k-input ng-scope']").click
    xt_assertion()
    xt_ScreenCapture()
  rescue 
    xt_increment_failed()
    xt_ScreenCapture()
  end   
end

def xt_utr_1696() 
  begin
    xt_goToMonitor()
    sleep 1
    monitorName = "New_Monitor_" + SecureRandom.hex(3)
    $browser.a(:text => "NEW MONITOR").when_present.click
    $browser.text_field(:xpath, "//input[@placeholder='Enter Monitor Name']").when_present.set(monitorName)
    $browser.div(:class => "modal-footer xy-clear-both ng-scope").button(:text => 'CREATE MONITOR').when_present.click
    # xt_assertion()
    # xt_ScreenCapture()
  rescue 
    # xt_increment_failed()
    # xt_ScreenCapture()
  end   
end

def xt_utr_1697() 
  begin
    xt_goToMonitor()
    xt_monitors_createMonitor_device()
    puts $browser.div(:class => "col-lg-12 col-xl-8 xy-no-side-padding top-panel-monitor-name ng-binding").text
    # xt_assertion()
    # xt_ScreenCapture()
  rescue 
    # xt_increment_failed()
    # xt_ScreenCapture()
  end   
end

def xt_utr_1699() 
  begin
    xt_assertion()
    xt_ScreenCapture()
  rescue 
    xt_increment_failed()
    xt_ScreenCapture()
  end   
end

def xt_utr_1700() #redundant UTR
  begin
    xt_assertion()
    xt_ScreenCapture()
  rescue 
    xt_increment_failed()
    xt_ScreenCapture()
  end   
end

def xt_utr_1701() 
  begin
    xt_assertion()
    xt_ScreenCapture()
  rescue 
    xt_increment_failed()
    xt_ScreenCapture()
  end   
end

def xt_utr_1702() 
  begin
    xt_assertion()
    xt_ScreenCapture()
  rescue 
    xt_increment_failed()
    xt_ScreenCapture()
  end   
end

def xt_utr_1704() 
  begin
    xt_assertion()
    xt_ScreenCapture()
  rescue 
    xt_increment_failed()
    xt_ScreenCapture()
  end   
end

def xt_utr_1745() 
  begin
    xt_assertion()
    xt_ScreenCapture()
  rescue 
    xt_increment_failed()
    xt_ScreenCapture()
  end   
end

def xt_utr_1748() 
  begin
    xt_assertion()
    xt_ScreenCapture()
  rescue 
    xt_increment_failed()
    xt_ScreenCapture()
  end   
end