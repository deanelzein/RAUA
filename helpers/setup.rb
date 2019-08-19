require 'rubygems'
require 'helpers/helperMethods.rb'

def execute_setup()  
# ############################   Server setup
  $os = 'Mac'
  $app = 'Tesla'
  $useGrid = false  
  $headless = false

  # ############################   ENV setup
  #$env = 'dev'
  $env = 'qa'
  #$env = 'prod'
  # ############################   User setup
  $user = 'devUser'
  #$user = 'QAUser'
  #$user = 'prodUser'

  # ############################   UI Suite 
  #$suiteName = 'demo()'
  #$suiteName = 'regression()'
  $suiteName = 'smoke_ui()'
  #$suiteName = 'suite_api()'

# # ############################   API setup
  $testApis = false
  $apiEnv = 'apiDev'
  #$env = 'apiQA'  
  #$env = 'apiProd'  
 setup_api_skeleton()
  setup_ui_skeleton() # This will execute the UI test cases 
  if $testApis
    setup_api_skeleton() # this will execute the API test cases
  end  
end
