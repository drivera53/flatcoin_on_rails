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

    def github_omniauth
        @user = User.find_or_create_by(uid: auth[:uid]) do |u|
          u.name = auth[:info][:name]
          u.email = auth[:info][:email]
          u.uid = auth[:uid]
          u.provider = auth[:provider]
          u.password = SecureRandom.hex(10)
        end

        if @user.valid?
            flash[:messsage] = "Signed IN with GitHub"
            session[:user_id] = @user.id
            redirect_to portfolios_path
        else
            flash[:message] = "Credential error"
            redirect_to login_path
        end
    end
    
    private

    def auth
        request.env['omniauth.auth']
    end
end
