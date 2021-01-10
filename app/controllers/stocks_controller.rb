class StocksController < ApplicationController
    before_action :authenticate_user!
    before_action :load_api

    def index
        @user = current_user.id
        @role_name = current_user.role.role_name
        @stocks = Stock.all
        @client_index = @client
        
        # @stock_code = @transaction.all.where(stock_code: "MSFT").pluck(:stock_code)
        # @stock = @transaction.select([:stock_code]).group_by(:stock_code,:price).having("count(stock_code)>= 1").all.size
        # @transaction.where(stock_code:@stock.keys).pluck(:quantity)
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
            publishable_token: 'pk_78fe637629224f02af0d9b556b31dc04',
            secret_token: 'sk_4d962b86775541f497caa3315aae5794',
            endpoint:'https://cloud.iexapis.com/v1'
            )
    end
  


end


