require 'uri'
require 'net/http'
require 'json'
require 'pry'
require 'rest-client'

class Client
    def initialize(url)
        @request = RestClient.get url, { accept: :json }
    end

    def fetch_from_api
        result = []
        @next_page = JSON.parse(@request.body)['_links']['next']['href']
        @second_request = NextClient.new(@next_page).second_request if @next_page
        result.push(JSON.parse(@request.body), JSON.parse(@second_request))
    end
end