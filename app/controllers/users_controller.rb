class UsersController < ApplicationController
    before_action :authenticate_user!
    before_action :load_api
    
    require 'net/http'

    def index
        @roles = Role.all
        @role_name = current_user.role.role_name
       
    end


    def search
        if params[:search].blank?  
            redirect_to(root_path, alert: "Empty field!") and return   
    else  
        @parameter = params[:search].upcase  
        @quote = @client.quote(@parameter).latest_price
      end  
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


