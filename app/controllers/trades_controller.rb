class TradesController < ApplicationController
    def create
        @portfolio = Portfolio.find_by_id(params[:portfolio_id])
        @trade = @portfolio.trades.build(trade_params)
        # Check balance
        @new_balance = @portfolio.current_balance - (@trade.quantity.to_i * @trade.price.to_f)
        if @new_balance > 0
            @portfolio.update(current_balance: @new_balance)
            if @trade.save
                flash[:message] = "The order has been executed successfully."
                redirect_to portfolio_path(@portfolio)
            else
                flash[:message] = "Quantity should be a number."
                redirect_to portfolio_path(@portfolio)
            end
        else
            flash[:message] = "You don't have enough buying power for this order."
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
        @trade = Trade.new
        #redirect_to new_portfolio_trade
    end

    def show
        @portfolio = Portfolio.find_by(id: params[:portfolio_id])
        @trade = @portfolio.trades.find_by(id: params[:id])
        # if Cryptocurrency.all.count > 0
        #     Cryptocurrency.refresh
        # end
        # Api.new.get_top_20_cryptocurrencies
        @coin = Cryptocurrency.find_by_id(@trade.coin_id)
    end

    def destroy
        @portfolio = Portfolio.find_by(id: params[:portfolio_id])
        current_value = params[:total_current_value]
        new_balance = @portfolio.current_balance + current_value.to_f
        @portfolio.update(current_balance: new_balance)
        @trade = Trade.find_by(id: params[:trade_id])
        @trade.destroy
        redirect_to portfolio_path(@portfolio)
    end

    private
    def trade_params
        params.require(:trade).permit(:coin_name, :coin_id, :price, :quantity, :portfolio_id, :user_id)
    end
end
