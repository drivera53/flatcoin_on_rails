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

    private
    def trade_params
        params.require(:trade).permit(:coin_name, :quantity, :portfolio_id, :user_id)
    end
end
