class UserStocksController < ApplicationController
    before_action :authenticate_user!
    before_action :load_api

    def index
        @user = current_user.id
      
       
        @role_name = current_user.role.role_name
        @stocks = UserStock.where(user_id: current_user.id)
        @user_stock = UserStock.where(user_id: @user).exists?
        @client_index = @client
        # if @user_stock
        #     @stocks = Stock.where(user_id: current_user.id)
        # else

        # end
        # @client.quote(stock.symbol).latest_price*stock.stock_quantity
        # byebug


        
    end


    
    def show
        @role_name = current_user.role.role_name
        uri = URI('https://cloud.iexapis.com/stable/stock/market/list/mostactive?token=pk_545fa818ff16440985c1a0a6c9c77b0c&listLimit=100')
        @request_api = Net::HTTP.get(uri)
        @most_active = JSON.parse(@request_api)
    end

    

    private
    def load_api
        @client = IEX::Api::Client.new(
            publishable_token: ENV["IEX_TOKEN"],
            secret_token: ENV["IEX_SECRET"],
            endpoint:'https://cloud.iexapis.com/v1'
            )
    end
  


end

