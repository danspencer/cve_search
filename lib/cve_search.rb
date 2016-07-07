require_relative "cve_search/version"
require_relative "cve_search/vendor"
require 'faraday'
require 'json'

API_URL = "http://cve.circl.lu/api/dbInfo"

module CveSearch
  def self.database_info
      response = Faraday.get("#{API_URL}")
      vendors = JSON.parse(response.body)
  end
end
