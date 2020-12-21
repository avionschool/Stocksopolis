class UsersController < ApplicationController
    before_action :authenticate_user!
    def index
        @roles = Role.all
        @role_name = current_user.role.role_name
       
    end
end
