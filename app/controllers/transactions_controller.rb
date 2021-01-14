class TransactionsController < ApplicationController
    before_action :authenticate_user!
    before_action :load_api

    def index
        # @users = User.where(name: )
        # byebug
        @role_name = current_user.role.role_name
       
        if current_user.role.role_name === "Admin"
            @transactions = Transaction.all
        else
            @user_transaction = Transaction.where(user_id: current_user.id)
        end
    end

    def new
        @transaction = Transaction.new 
        
    end
 

    def create
        @user = current_user
        
        @transaction = Transaction.new(transaction_params)
        @transaction.user_id = @user.id
        # byebug
        @transaction.save
        
        if Stock.where(user_id: current_user.id).exists?(symbol: @transaction.stock_code) 
            @quantity = Stock.where(user_id: current_user.id).where(symbol: @transaction.stock_code)[0].stock_quantity
            @total = @quantity + @transaction.quantity
            @stock = Stock.where(user_id: current_user.id).where(symbol: @transaction.stock_code)[0]
            @stock.stock_quantity = @total
            @stock.save
          
            # byebug
        #     redirect_to(stocks_path)  and return

        else
          
        @stock_db = Stock.new(symbol:@transaction.stock_code, price: @transaction.price, stock_quantity: @transaction.quantity, user_id:@transaction.user_id)
        @stock_db.save
        # byebug
        end
        
        # redirect_to root_path
        redirect_to(stocks_path)
    end 

 
    private
    def load_api
        @client = IEX::Api::Client.new(
            publishable_token: ENV["IEX_TOKEN"],
            secret_token: ENV["IEX_SECRET"],
            endpoint:'https://cloud.iexapis.com/v1'
            )
    end

    
    
    def transaction_params
        params.permit(:user_id, :quantity, :stock_code, :price)
    end
end   
