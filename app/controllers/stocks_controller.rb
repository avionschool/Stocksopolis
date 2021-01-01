class StocksController < ApplicationController
    before_action :authenticate_user!
    before_action :load_api
    
    def show
        uri = URI('https://cloud.iexapis.com/stable/stock/market/list/mostactive?token=pk_78fe637629224f02af0d9b556b31dc04&listLimit=100')
        @request_api = Net::HTTP.get(uri)
        @most_active = JSON.parse(@request_api)
    end


    def load_api
        @client = IEX::Api::Client.new(
            publishable_token: ENV['SAND_BOX_KEY'],
            endpoint: 'https://cloud.iexapis.com/v1'
          )
    end


end


