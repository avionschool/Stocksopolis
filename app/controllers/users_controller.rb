class UsersController < ApplicationController
    before_action :authenticate_user!
    def index
        @roles = Role.all
        @role_name = Role.find(current_user.role_id).role_name
    end
end
