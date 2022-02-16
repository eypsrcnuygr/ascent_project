require 'uri'
require 'net/http'
require 'json'
require 'pry'
require 'rest-client'

class NextClient
    attr_reader :second_request
    def initialize(url)
        @second_request = RestClient.get url, { accept: :json }
    end

    # def second_request
    #     @second_request.body
    # end
end