class StaticController < ApplicationController
  def new
  end

  def home
    if logged_in?
      if Cryptocurrency.all.count > 0
        Cryptocurrency.refresh
      end
      Api.new.get_top_20_cryptocurrencies
      @cryptocurrencies = Cryptocurrency.all
    else
      redirect_to signup_path
    end       
  end
end
