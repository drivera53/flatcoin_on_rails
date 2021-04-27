class TradesController < ApplicationController
    def create
        @portfolio = Portfolio.find_by_id(params[:portfolio_id])
        @trade = @portfolio.trades.build(trade_params)
        if @trade.save
            flash[:message] = "YOU JUST TRADED"
            redirect_to portfolio_path(@portfolio)
        else
            flash[:message] = "BRO DIDNT WORK"
            redirect_to portfolio_path(@portfolio)
        end

    end

    def new_portfolio_trade
    end
    
    def create_portfolio_trade
        @coin_id = params[:coin_id]
        @portfolio_id = params[:portfolio_id]
        @coin = Cryptocurrency.find_by_id(params[:coin_id])
        #@coin.Portfolio.find_by(params[:coin_id])
        @portfolio = Portfolio.find_by_id(params[:portfolio_id])
        #redirect_to new_portfolio_trade
    end

    private
    def trade_params
        params.require(:trade).permit(:coin_name, :quantity, :portfolio_id, :user_id)
    end
end
