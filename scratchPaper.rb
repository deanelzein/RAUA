# Random scripts to access DB, test rest API, compare files

# #!/usr/bin/env ruby
# $LOAD_PATH.unshift(File.expand_path(File.dirname(__FILE__))) unless $LOAD_PATH.include?(File.expand_path(File.dirname(__FILE__)))

# require "rubygems" 
# require 'rest_client' 
# require 'roo'
# require 'roo-xls'
# require 'dbi'
# # require 'activerecord-sqlserver-adapter'
# require 'securerandom'
# require 'ODBC'

#AWS creds
#host: livenation-qa-cluster.cluster-ceciz740oxzc.us-east-1.rds.amazonaws.com
#pass: jRleHhEaMyd2fnIx




################################################################ API iterator and runner - REST script #################################################

# def apiIterator()
#   run = Time.now 
#   puts ".............................................................api suite start time: #{run}"
#   oo = Roo::Excelx.new("./input/apis.xlsx")
#   lastRow = oo.last_row 
#   30.upto(36) do |line|
#     $apiName      = oo.cell(line,'A')
#     $apiMethod    = oo.cell(line,'B')
#     $apiPath      = oo.cell(line,'C')
#     $apiRequest   = oo.cell(line,'D')
#     $apiHeader    = oo.cell(line,'E')
#     $apiResponse  = oo.cell(line,'F')
#     run_apis()
#   end
# end

# def run_apis()
#   begin
#     $uri = $apiEnvURL + $apiPath
#     if ($apiMethod.include? "post")
#       $apiResponse = RestClient.post $uri, $apiRequest, {:content_type => 'application/json'}
#       $apiResponseObject = JSON.parse($apiResponse)['error']['num']
#       xt_apiAssertion()
#     elsif ($apiMethod.include? "put")
#       $apiResponse = RestClient.put $uri, $apiRequest, {:content_type => 'application/json'}
#       $apiResponseObject = JSON.parse($apiResponse)['error']['num']
#       xt_apiAssertion()
#     elsif ($apiMethod.include? "get")
#       $apiResponse = RestClient.get "#{$uri}", {:content_type => 'application/json'}
#       $apiResponseObject = JSON.parse($apiResponse)['error']['num']
#       xt_apiAssertion()
#     else       
#       puts "api call method not get, post or put"
#     end         
#   rescue => e   
#     api_increment_failed()
#   end
# end  
#puts $access_token = JSON.parse(token)['access_token']




################################################################ Mysql DB access script#######################################################

# puts random_string = SecureRandom.base64
#  #select statements or statements that return results...........................................................
#  def run_select_query(query)

#   connection = nil
#   @host = "jdbc:sqlserver://livenation-qa-cluster.cluster-ceciz740oxzc.us-east-1.rds.amazonaws.com"
#   @username = "deamelzein"
#   @password = "jRleHhEaMyd2fnIx"
#   @dbname = ""

#   begin
#     connection = DBI.connect("DBI:ADO:Provider=SQLOLEDB;Data Source=#{@host};Initial Catalog=#{@dbname};User ID=#{@username};Password=#{@password}")
#   rescue DBI::DatabaseError => e

#     puts "An error occurred"
#     puts "Error code:    #{e.err}"
#     puts "Error message: #{e.errstr}"
#   end
# # 
#   dataset = connection.execute(query).fetch_all
#   connection.disconnect

#   return dataset
# end

#  #statements that dont return results like update...........................................................
# def run_update_query(query)

#   connection = nil
#   @host = Environment.db_host
#   @username = Environment.db_username
#   @password = Environment.db_password
#   @dbname = Environment.db_name
# # # 
#   begin
#     connection = DBI.connect("DBI:ADO:Provider=SQLOLEDB;Data Source=#{@host};Initial Catalog=#{@dbname};User ID=#{@username};Password=#{@password}")
#   rescue DBI::DatabaseError => e
#      puts "An error occurred"
#      puts "Error code:    #{e.err}"
#      puts "Error message: #{e.errstr}"
#   end

#   connection.do(query)
#   connection.commit
#   connection.disconnect

# end

# run_update_query("insert into testdatabase(id,name) values (1,'test_name')")






################################################################ Compare script#######################################################

# def LNReadfirstFile()
#   #puts Dir.pwd
#   oo = Roo::Excelx.new("standalone_scripts/1.xlsx", file_warning: :ignore)
#   firstRow = oo.first_row 
#   lastRow = oo.last_row 
#   firstRow.upto(lastRow) do |line|
#     $num1         = oo.cell(line,'A')
#     $description1 = oo.cell(line,'B')
#     $details1     = oo.cell(line,'C')
#     $result1      = oo.cell(line,'D')
#     compare()
#   end
# end

# def LNReadSecondFile()
#   oo = Roo::Excelx.new("standalone_scripts/2.xlsx", file_warning: :ignore)
#   $num1.to_i.upto($num1.to_i) do |line|
#     $num2         = oo.cell(line,'A')
#     $description2 = oo.cell(line,'B')
#     $details2     = oo.cell(line,'C')
#     $result2      = oo.cell(line,'D')
#   end  
# end

# def compare()
#   qtpReadSecondFile()
#   if $description1 == $description2
#     File.open( "standalone_scripts/matched.txt", "a+" ) do |the_file|
#     the_file.puts "Line #{$num1}: Description Matched"
#     end 
#   else
#     puts "Line #{$num1}: Description didn't Match"
#     File.open( "standalone_scripts/didntMatch.txt", "a+" ) do |the_file|
#     the_file.puts "Line #{$num1}: Description Didnt Match"
#     end 
#   end
#   if $details1 == $details2
#     File.open( "standalone_scripts/matched.txt", "a+" ) do |the_file|
#     the_file.puts "Line #{$num1}: Details Matched"
#     end      
#   else
#     puts "Line #{$num1}: Details didn't Match"
#     File.open( "standalone_scripts/didntMatch.txt", "a+" ) do |the_file|
#     the_file.puts "Line #{$num1}: Details Didnt Match"
#     end 
#   end
#   if $result1 == $result2
#     File.open( "standalone_scripts/matched.txt", "a+" ) do |the_file|
#     the_file.puts "Line #{$num1}: Results Matched"
#     end       
#   else
#     puts "Line #{$num1}: Results didn't Match"
#     File.open( "standalone_scripts/didntMatch.txt", "a+" ) do |the_file|
#     the_file.puts "Line #{$num1}: Results Didnt Match"
#     end 
#   end    
# end

# LNReadfirstFile()