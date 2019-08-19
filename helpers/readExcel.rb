require 'rubygems'
require 'watir'
require 'roo'
require 'headless'
require 'helpers/setup.rb'
require 'helpers/helperMethods.rb'
require "methods/apis.rb"

def apiIterator()
  run = Time.now 
  puts ".............................................................api suite start time: #{run}"
  oo = Roo::Excelx.new("./input/apis.xlsx")
  lastRow = oo.last_row 
  30.upto(36) do |line|
    $apiName      = oo.cell(line,'A')
    $apiMethod    = oo.cell(line,'B')
    $apiPath      = oo.cell(line,'C')
    $apiRequest   = oo.cell(line,'D')
    $apiHeader    = oo.cell(line,'E')
    $apiResponse  = oo.cell(line,'F')
    run_apis()
  end
end

def readBrowserAndLaunch()
  oo = Roo::Excelx.new("./input/browser.xlsx")
  oo.default_sheet = oo.sheets.first
  2.upto(2) do |line|
    $browserVersion = oo.cell(line,'A')
    $browserName = oo.cell(line,'B')
    case $useGrid
    when true
      puts "Don't launch any browser, since it's the Grid"
    when false
      launch_browser()
    end
  end
end

def launch_browser()
  run = Time.now
  if $headless
  headless = Headless.new
  headless.start  
  end
   
  if $browserName.include? "Firefox"
    if $headless
      puts "....................................................Headless FireFox browser start time: #{run}"
      $browser = Watir::Browser.start
    else
      puts ".............................................................FireFox browser start time: #{run}"
      $browser = Watir::Browser.new(:firefox) 
    end    
  elsif $browserName.include? "IE"
    if $headless
      puts "........................................................Headless IE browser start time: #{run}"
      $browser = Watir::Browser.start
    else
      puts ".................................................................IE browser start time: #{run}"
      $browser = Watir::Browser.new(:ie) 
    end 
  elsif $browserName.include? "Chrome"
    if $headless
      puts "...................................................Headless Chrome browser start time: #{run}"
      $browser = Watir::Browser.start
    else
      puts "............................................................Chrome browser start time: #{run}"
      $browser = Watir::Browser.new(:chrome) 
    end 
  elsif $browserName.include? "Safari"
    if $headless
      puts "..................................................Headless Safari browser start time: #{run}"
      $browser = Watir::Browser.start
    else
      puts "............................................................Safari browser start time: #{run}"
      $browser = Watir::Browser.new(:safari) 
    end
  end
  $browser.driver.manage.timeouts.implicit_wait=30
  $browser.goto $envURL
  if $headless == false
    $browser.window.move_to(-0, 0)
    $browser.window.resize_to(1600, 1200) 
  end
  # $browser.window.move_to(-1400, 0) # this is the demo setting
  # $browser.window.resize_to(1160, 1200)
  eval($suiteName)
end

def loginReadExcel()
  case $user
  when 'devUser'
    rowNum = 2
  when 'QAUser'
    rowNum = 3    
  when 'prodUser'
    rowNum = 4
  end
  oo = Roo::Excelx.new("./input/logins.xlsx")
  oo.default_sheet = oo.sheets.first
  rowNum.upto(rowNum) do |line|
    $userEnv      = oo.cell(line,'A')
    $userName      = oo.cell(line,'B')
    $password      = oo.cell(line,'C')
    $firstName     = oo.cell(line,'D')
    $lastName      = oo.cell(line,'E')
  end
end

def envReadExcel()
  oo = Roo::Excelx.new("./input/env.xlsx")
  case $env
  when 'dev'
    rowNum = 2
  when 'qa'
    rowNum = 3    
  when 'prod'
    rowNum = 4
  end
  rowNum.upto(rowNum) do |line|
    $env      = oo.cell(line,'A')
    $envURL   = oo.cell(line,'B')
    $envHome  = oo.cell(line,'C')
  end
end

def apiEnvReadExcel()
  oo = Roo::Excelx.new("./input/apiEnv.xlsx")
  case $apiEnv
  when 'apiDev'
    rowNum = 2
  when 'apiQA'
    rowNum = 3    
  when 'apiProd'
    rowNum = 4
  end
  rowNum.upto(rowNum) do |line|
    $apiEnv      = oo.cell(line,'A')
    $apiEnvURL   = oo.cell(line,'B')
  end
end

