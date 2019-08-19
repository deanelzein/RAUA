require 'watirgrid'
require 'watir'
require 'socket'

#Get ip address of Controller
puts hostname = Socket.gethostname
puts controllerIpAddress = Socket.ip_address_list.find { |ai| ai.ipv4? && !ai.ipv4_loopback? }.ip_address
puts controllerUri = "druby://#{controllerIpAddress}:11235"

# # Start a Controller using defaults
# controller = Controller.new(:controller_uri => controllerUri)
# controller.start
# 
# # Start 2 Providers with WebDriver
# provider = Provider.new(:controller_uri => 'druby://10.1.1.24:11235')
# provider.start
#    

# Control the Providers via the Grid
Watir::Grid.control(:controller_uri => 'druby://10.1.1.24:11235') do |browser, index|
  browser.goto "http://google.com"
  browser.close
end  






# 
# def suiteWatirgrid(controllerIP) # watirgrid experiment suite
  # drubyControllerIPAndPort = 'druby://' + controllerIP +  ':11235'
  # Watir::Grid.control(:controller_uri => drubyControllerIPAndPort) do |browser, id|
    # $browser_type = browser.driver.browser
    # $os = 'Mac'
    # $app = 'WS'
    # ci_Setup('WS', 'QA')
    # browser.close
  # end
# end
# 
# def set_browser_os()
    # # browsers = Array['chrome']
    # $os = 'Mac'
    # if (RUBY_PLATFORM =~ /w32/) # windows
     # $os = 'Windows'
     # # browsers = Array['chrome','firefox']
    # elsif (RUBY_PLATFORM =~ /darwin/) # mac
     # $os = 'Mac'
     # # browsers = Array['chrome','safari']
    # end
# end
   
# 1.upto(2) do
 # provider = Provider.new(:driver => 'webdriver')
 # provider.start
# end
