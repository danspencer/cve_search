require_relative "cve_search/cve"
require_relative "cve_search/version"
require_relative "cve_search/vendor"
require_relative "cve_search/database"
require 'faraday'
require 'json'

module CveSearch
  def self.database_info
      response = Faraday.get("http://cve.circl.lu/api/dbInfo")
      vendors = JSON.parse(response.body)
  end
end
