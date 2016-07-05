require 'faraday'
require 'json'

API_URL = "https://cve.circl.lu/api/browse"

module CveSearch
  class Vendor
    attr_reader :name, :products

    def initialize(attributes)
      @name = attributes["vendor"]
      @products = attributes["product"]
    end

    def self.find(name)
      response = Faraday.get("#{API_URL}/#{name}")
      attributes = JSON.parse(response.body)
      new(attributes)
    end
  end
end