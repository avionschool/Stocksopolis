class UsersController < ApplicationController
    def index
        @roles = Role.all
      
    end
end
