require "rubygems" 
require "templates/blueGreen/apiTemplate.rb"
require 'active_support'  
require 'rest_client' 
require "suites/suites.rb"
require 'helpers/readExcel.rb'
require 'helpers/helperMethods.rb'
require 'roo' 
require 'ap' 

def run_apis()
    begin
      $uri = $apiEnvURL + $apiPath
      if ($apiMethod.include? "post")
        $apiResponse = RestClient.post $uri, $apiRequest, {:content_type => 'application/json'}
        $apiResponseObject = JSON.parse($apiResponse)['error']['num']
        xt_apiAssertion()
      elsif ($apiMethod.include? "put")
        $apiResponse = RestClient.put $uri, $apiRequest, {:content_type => 'application/json'}
        $apiResponseObject = JSON.parse($apiResponse)['error']['num']
        xt_apiAssertion()
      elsif ($apiMethod.include? "get")
        $apiResponse = RestClient.get "#{$uri}", {:content_type => 'application/json'}
        $apiResponseObject = JSON.parse($apiResponse)['error']['num']
        xt_apiAssertion()
      else       
        puts "api call method not get, post or put"
      end         
    rescue => e   
      api_increment_failed()
    end
end  
#puts $access_token = JSON.parse(token)['access_token']