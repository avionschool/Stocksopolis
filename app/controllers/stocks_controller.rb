class StocksController < ApplicationController
    before_action :authenticate_user!
    before_action :load_api

    def index
        @user = current_user.id
  
        @role_name = current_user.role.role_name
        @stocks = Stock.where(user_id: current_user.id)
        @user_stock = Stock.where(user_id: @user).exists?
        @client_index = @client
        # if @user_stock
        #     @stocks = Stock.where(user_id: current_user.id)
        # else

        # end
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
            publishable_token: ENV["IEX_TOKEN"],
            secret_token: ENV["IEX_SECRET"],
            endpoint:'https://cloud.iexapis.com/v1'
            )
    end
  


end


