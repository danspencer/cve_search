require 'faraday'
require 'json'

module CveSearch
  API_URL = "https://cve.circl.lu/api/browse"

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

    def self.all
      response = Faraday.get("#{API_URL}/")
      vendors = JSON.parse(response.body)
      vendors['vendor'].map { |name| new(Hash["vendor" => name]) }
    end

    def self.products_by(vendor)
      response = Faraday.get("#{API_URL}/#{vendor}")
      products = JSON.parse(response.body)
      products['product'].map { |name| new(Hash["vendor" => name]) }
    end
  end
end
