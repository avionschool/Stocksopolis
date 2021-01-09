class TransactionsController < ApplicationController
    before_action :authenticate_user!
    before_action :load_api

    def new
        @transaction = Transaction.new
        
    end
 

    def create
        @user = current_user
        @transaction = Transaction.new(transaction_params)
        @transaction.user_id = @user.id
        # byebug
        @transaction.save
        redirect_to root_path
    end 

 

    private
    def load_api
        @client = IEX::Api::Client.new(
            publishable_token: 'pk_78fe637629224f02af0d9b556b31dc04',
            secret_token: 'sk_4d962b86775541f497caa3315aae5794',
            endpoint:'https://cloud.iexapis.com/v1'
            )
    end

    
    
    def transaction_params
        params.permit(:user_id, :quantity, :stock_code, :price)
    end
end