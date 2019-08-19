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
# # .............................................................................................................................Groups ...........................................................................................................
# def xt_monitors_group_cancel() 
  # begin
    # $browser.div(:class => "new-group-container").a(:text => "NEW GROUP").when_present.click
    # $browser.text_field(:class => 'form-control ng-pristine ng-valid').when_present.set("xt_monitors_group_cancel")
    # $browser.div(:class => "modal-footer ng-scope").button(:text => 'CANCEL').when_present.click
    # xt_assertion_text('xt_monitors_group_cancel',"EXPORT SETTINGS")
    # xt_ScreenCapture("xt_monitors_group_cancel")
  # rescue 
    # xt_increment_failed("xt_monitors_group_cancel")
    # xt_ScreenCapture("xt_monitors_group_cancel_failedMethodBlock")
  # end 
# end
# 
# def xt_monitors_group_create() 
  # begin
    # groupName = SecureRandom.random_number
    # $browser.div(:class => "new-group-container").a(:text => "NEW GROUP").when_present.click
    # $browser.text_field(:class => 'form-control ng-pristine ng-valid').when_present.set(groupName)
    # $browser.div(:class => "modal-footer ng-scope").button(:text => 'CREATE GROUP').when_present.click
    # xt_assertion_text('xt_monitors_group_create',"There are no monitors for this group")
    # xt_ScreenCapture("xt_monitors_group_create")
  # rescue 
    # xt_increment_failed("xt_monitors_group_create")
    # xt_ScreenCapture("xt_monitors_group_create_failedMethodBlock")
  # end 
# end
# 
# def xt_monitors_group_createBadName() 
  # begin
    # $initialGroupName = SecureRandom.base64
    # $browser.div(:class => "new-group-container").a(:text => "NEW GROUP").when_present.click
    # $browser.text_field(:class => 'form-control ng-pristine ng-valid').when_present.set($initialGroupName)
    # $browser.div(:class => "modal-footer ng-scope").button(:text => 'CREATE GROUP').when_present.click
    # xt_assertion('Name contains illegal characters (letters, numbers, \\, . and $ are allowed)', 'xt_monitors_group_createBadName', 'div', 'xpath', '//div[contains(@class,\'col-xs-12 error-message ng-scope ng-binding\')]')
    # xt_ScreenCapture("xt_monitors_group_createBadName")
    # $browser.div(:class => "modal-footer ng-scope").button(:text => 'CANCEL').when_present.click
  # rescue 
    # xt_increment_failed("xt_monitors_group_createBadName")
    # xt_ScreenCapture("xt_monitors_group_createBadName_failedMethodBlock")
  # end 
# end
# 
# def xt_monitors_group_rename() 
  # begin
    # $renamedGroupName = SecureRandom.random_number
    # $browser.div(:class => "dropdown xy-dropdown").a(:xpath, "//a[contains(@style,'visibility: visible;')]").when_present.click
    # $browser.div(:class => "dropdown xy-dropdown open").ul(:class => 'dropdown-menu xy-dropdown-menu group-dropdown-menu pull-right').li(:text => 'Rename').when_present.click
    # $browser.text_field(:xpath, "//input[@class='form-control ng-pristine ng-valid']").when_present.set($renamedGroupName)
    # $browser.button(:xpath, "//button[@class='btn btn-default button-dark pull-right']").when_present.click
    # xt_assertion_text('xt_monitors_group_rename', "#{$renamedGroupName}")
    # xt_ScreenCapture("xt_monitors_group_rename")
  # rescue 
    # xt_increment_failed("xt_monitors_group_rename")
    # xt_ScreenCapture("xt_monitors_group_rename_failedMethodBlock")
  # end 
# end
# 
# def xt_monitors_group_delete() 
  # begin
    # $browser.div(:class => "dropdown xy-dropdown").a(:xpath, "//a[contains(@style,'visibility: visible;')]").when_present.click
    # $browser.div(:class => "dropdown xy-dropdown open").ul(:class => 'dropdown-menu xy-dropdown-menu group-dropdown-menu pull-right').li(:text => 'Delete').when_present.click
    # $browser.button(:xpath, "//button[@class='btn btn-default button-dark pull-right']").when_present.click 
    # element = "$browser.div(:xpath, \"//div[@tooltip=\"#{$renamedGroupName}\"]\")"
    # xt_assertion_elementDoesntExists('xt_monitors_group_delete', element)
    # xt_ScreenCapture("xt_monitors_group_delete")
  # rescue 
    # xt_increment_failed("xt_monitors_group_delete")
    # xt_ScreenCapture("xt_monitors_group_delete_failedMethodBlock")
  # end 
# end
# 
# def xt_monitors_newGroup_createNewMonitor() 
  # begin
    # xt_assertion()
    # xt_ScreenCapture()
  # rescue 
    # xt_increment_failed()
    # xt_ScreenCapture()
  # end   
# end
# 
# def xt_monitors_newGroup_createNewMonitor_cancel() 
  # begin
    # xt_assertion()
    # xt_ScreenCapture()
  # rescue 
    # xt_increment_failed()
    # xt_ScreenCapture()
  # end   
# end
# 
# def xt_monitors_newGroup_addMonitors() 
  # begin
    # xt_assertion()
    # xt_ScreenCapture()
  # rescue 
    # xt_increment_failed()
    # xt_ScreenCapture()
  # end   
# end
# 
# def xt_monitors_groups_search() 
  # begin
    # xt_assertion()
    # xt_ScreenCapture()
  # rescue 
    # xt_increment_failed()
    # xt_ScreenCapture()
  # end   
# end
# 
# def xt_monitors_groups_allMonitors() 
  # begin
    # xt_assertion()
    # xt_ScreenCapture()
  # rescue 
    # xt_increment_failed()
    # xt_ScreenCapture()
  # end   
# end
# 
# def xt_monitors_groups_singleMonitorRename() 
  # begin
    # xt_assertion()
    # xt_ScreenCapture()
  # rescue 
    # xt_increment_failed()
    # xt_ScreenCapture()
  # end   
# end
# 
# def xt_monitors_groups_singleMonitorDelete() 
  # begin
    # xt_assertion()
    # xt_ScreenCapture()
  # rescue 
    # xt_increment_failed()
    # xt_ScreenCapture()
  # end   
# end
# 
# def xt_monitors_newMonitor() 
  # begin
    # xt_assertion()
    # xt_ScreenCapture()
  # rescue 
    # xt_increment_failed()
    # xt_ScreenCapture()
  # end   
# end
# 
# def xt_monitors_newMonitor_cancel() 
  # begin
    # xt_assertion()
    # xt_ScreenCapture()
  # rescue 
    # xt_increment_failed()
    # xt_ScreenCapture()
  # end   
# end
# 
# def xt_monitors_monitorSearch() 
  # begin
    # xt_assertion()
    # xt_ScreenCapture()
  # rescue 
    # xt_increment_failed()
    # xt_ScreenCapture()
  # end   
# end
# 
# def xt_monitors_dragMonitorToGroup() 
  # begin
    # xt_assertion()
    # xt_ScreenCapture()
  # rescue 
    # xt_increment_failed()
    # xt_ScreenCapture()
  # end   
# end