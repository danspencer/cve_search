require_relative "cve_search/version"
require_relative "cve_search/vendor"
require 'faraday'
require 'json'

module CveSearch
  def self.database_info
      response = Faraday.get("http://cve.circl.lu/api/dbInfo")
      vendors = JSON.parse(response.body)
  end
end
