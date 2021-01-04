class TransactionsController < ApplicationController
    before_action :authenticate_user!
    before_action :load_api

    def create
        @user = current_user
        stock_price = @client.quote(params[:transaction][:stock_attributes][:symbol]).latest_price
        total_price = stock_price * params[:transaction][:quantity].to_i

        if current_user.balance > total_price
            @transaction = Transaction.create(transaction_params)
            @transaction.purchase_price = total_price
            @transaction.purchase_date = DateTime.now
            @transaction.save
            @user.calc_total_balance(total_price)
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

        params.require(:transaction).permit(:user_id, :quantity, :stock_id,
        :stock_attributes => [:symbol])
    end
end