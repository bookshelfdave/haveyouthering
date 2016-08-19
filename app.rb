require 'sinatra'
require 'json'
require 'pp'

giant_array = []

set :public_folder, File.dirname(__FILE__) + '/static'

get '/' do
    "Array length = #{giant_array.length}"
end

post '/data' do
    begin
        data = JSON.parse request.body.string
        giant_array << data
    rescue => e
        puts "FAILURE: #{e}"
    end
end

