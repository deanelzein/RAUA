require 'aws-sdk-s3'
require 'rubygems'
require 'roo'
require 'roo-xls'
require 'dbi'
host = 'livenation-qa-cluster.cluster-ceciz740oxzc.us-east-1.rds.amazonaws.com'
pass = 'jRleHhEaMyd2fnIx'

# Script to 
# access S3 > get object Parse it
# Iterate through it > if condition <doesnt exists> save it to 'Missing.xls'
# Access record in MysQL via DiscoID > Save it > Compare vs 'Missing.xls'





def getBuckets()
    {
        s3 = Aws::S3::Client.new
        response = s3.list_buckets
        response.buckets.each do |bucket|
        puts "#{bucket.creation_date} #{bucket.name}"
        File.open( "output/buckets.xls", "a" ) do | response |
            response.puts <<EOF

            # Parse the venue details and fields 
        EOF
          end
    }

def iterateParser()
    {

    }