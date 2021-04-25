class PortfoliosController < ApplicationController
    def index
        @portfolio = Portfolio.all
    end

    def new
        @portfolio = Portfolio.new
    end

    def create
        @portfolio = Portfolio.new(portfolio_params)
    
        if @portfolio.save
          redirect_to portfolios_path
        else
          render :new
        end
    end

    def show
        @portfolio = Portfolio.find_by(id: params[:id])
        #@ride = @attraction.rides.build(user_id: current_user.id)
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
            #TODO: ERROR MESSAGES
            redirect_to portfolios_path
        end
    end

    def destroy
        #TODO: DRY THIS UP BRO
        @portfolio = Portfolio.find_by(id: params[:id])
        @portfolio.destroy
        redirect_to portfolios_path
    end

    private
    def portfolio_params
        params.require(:portfolio).permit( :name, :description, :balance)
    end
end
