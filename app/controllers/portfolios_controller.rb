class PortfoliosController < ApplicationController
    before_action :redirect_if_not_logged_in, only: [:new, :create, :edit, :update]

    def index
        @portfolio = Portfolio.all   
    end

    def my_portfolios    
    end

    def search
        @portfolio = Portfolio.search(params[:title])
        render :index
    end

    def new
        @portfolio = Portfolio.new
        #@portfolio = @user.portfolios.build
    end

    def create
        @portfolio = Portfolio.new(portfolio_params)
        # Set initial_balance = to current_balance
        @portfolio.current_balance = @portfolio.initial_balance
        if @portfolio.save      
          redirect_to portfolio_path(@portfolio)
        else
          render :new
        end
    end

    def show
        @portfolio = Portfolio.find_by(id: params[:id])
        @portfolio_creator = User.find_by(id: @portfolio.user_id)
        @comments = @portfolio.comments
        @comment = Comment.new
        @trades = @portfolio.trades
        @trade = Trade.new
        if Cryptocurrency.all.count > 0
            Cryptocurrency.refresh
        end
        Api.new.get_top_20_cryptocurrencies
        @cryptocurrencies = Cryptocurrency.all
    end

    def edit
        @portfolio = Portfolio.find_by(id: params[:id])
        #@ride = @attraction.rides.build(user_id: current_user.id)
        #redirect_to edit_portfolio_path
    end

    def update
        @portfolio = Portfolio.find_by(id: params[:id])
        @portfolio.update(portfolio_params)

        if @portfolio.valid?
            redirect_to portfolio_path(@portfolio)
        else
            redirect_to portfolios_path
        end
    end

    def destroy
        @portfolio = Portfolio.find_by(id: params[:id])
        @portfolio.destroy
        redirect_to portfolios_path
    end

    private
    def portfolio_params
        params.require(:portfolio).permit(:name, :description, :initial_balance, :user_id)
    end
end

