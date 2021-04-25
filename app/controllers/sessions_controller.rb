class SessionsController < ApplicationController
    def new

    end

    def create
        @user = User.find_by_email(params[:user][:email])

        if @user && @user.authenticate(params[:user][:password])
            flash[:message] = "Succesful sign in"
            session[:user_id] = @user.id
            redirect_to portfolios_path
        else
            flash[:message] = "Invalid Credentials"
            render :new
        end
    end

    def logout
        session.clear
        redirect_to login_path
    end
end
