class UsersController < ApplicationController

    # Sign up - Create a new user
    def new
        @user = User.new
        #binding.pry
    end

    def create
        #binding.pry
        @user = User.new(user_params)
        if @user.save
            flash[:message] = "Successfully signed up."
            session[:user_id] = @user.id
            redirect_to portfolios_path
        else
            render :new
        end
    end

    private
    def user_params
        params.require(:user).permit(:name, :password, :email )
    end
end
