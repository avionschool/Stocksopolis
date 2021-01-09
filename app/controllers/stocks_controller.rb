class StocksController < ApplicationController
    before_action :authenticate_user!
    before_action :load_api

    def index
        @user = current_user.id
        @role_name = current_user.role.role_name
        @transaction = Transaction.all
        @stock = @transaction.select([:stock_code,:price]).group(:stock_code,:price).having("count(stock_code)>= 1").all.size
        # byebug
    end
    
    def show
        uri = URI('https://cloud.iexapis.com/stable/stock/market/list/mostactive?token=pk_78fe637629224f02af0d9b556b31dc04&listLimit=100')
        @request_api = Net::HTTP.get(uri)
        @most_active = JSON.parse(@request_api)
    end

    

    private
    def load_api
        @client = IEX::Api::Client.new(
            publishable_token: ENV['SAND_BOX_KEY'],
            endpoint: 'https://cloud.iexapis.com/v1'
          )
    end


end


