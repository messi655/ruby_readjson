#!/usr/bin/ruby -w

require 'json'

class Upwork
    def readjson(jsonfile)
        readfile = File.read(jsonfile)
        JSON.parse(readfile)
    end    

    def printURL(jsonfile)
        string = ''
        readjson(jsonfile).each do |result_object|
            if result_object.key?("path") && result_object.key?("fragment")
                puts result_object["scheme"] + "://" + result_object["domain_name"] + "/" + result_object["path"] + "/" + result_object["fragment"]
                puts "==========="
            elsif result_object.key?("path") && result_object.key?("query")
                result_object["query"].each do |key, value|
                    if string != ""
                        key = "&"+ key 
                    end
                    string += key + "=" + value
                end 
                puts result_object["scheme"] + "://" + result_object["domain_name"] + "/" + result_object["path"] + "?" + string
                puts "==============="
            end 
        end
    end
end

#read = Upwork.new()
#read.printURL('json_data_ruby_in_rails.json');