require 'faraday'
require 'json'

module CveSearch
  class Database
    attr_accessor :blA, :capecA, :vendorA, :dbSize, :cveA, :cpeA, :wlA, :d2secA, :vfeedU, :d2secU, :capecU, :vendorU, :cpeOtherA, :cpeU, :cveU, :vfeedA, :dbOnDisk, :dbName, :cpeOtherU

    def initialize(attributes)
      #@dbName = attributes['dbName']
      attributes.each {|k,v| public_send("#{k}=",v) }
    end

    def self.version
      response = Faraday.get("https://cve.circl.lu/api/dbInfo")
      attributes = JSON.parse(response.body)
      new(attributes)
      #binding.pry
    end
  end
end
