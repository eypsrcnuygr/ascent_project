class ServiceController < ApplicationController
    # before_action Client.new unless @request
    def index(url = 'https://api.edamam.com/api/recipes/v2?type=public&q=chicken&app_id=7d00fbca&app_key=aff00390c873981b10c794bc3c3f1756%09')
        request = Client.new(url)
        @response_body = request.fetch_from_api

        respond_to do |format|
            format.html
            if @response_body
                format.json{
                    render :json => @response_body
                  }
            else
                format.json {
                    render :json => @response_body.errors, status: :unprocessable_entity
                }
            end
          end
    end

    def next_call
        request = Client.new(params[:url])
        @response_body = request.fetch_from_api
        
        respond_to do |format|
            format.html
            if @response_body
                format.json{
                    render :json => @response_body
                  }
            else
                format.json {
                    render :json => @response_body.errors, status: :unprocessable_entity
                }
            end
          end
    end
end