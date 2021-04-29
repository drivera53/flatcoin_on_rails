class CommentsController < ApplicationController
    def create
        @portfolio = Portfolio.find_by_id(params[:portfolio_id])
        @comment = @portfolio.comments.build(comment_params)
        if @comment.save
            flash[:message] = "YOU JUST COMMENTED"
            redirect_to portfolio_path(@portfolio)
        else
            flash[:message] = "You comment can't be blank."
            redirect_to portfolio_path(@portfolio)
        end

    end

    private
    def comment_params
        params.require(:comment).permit(:content, :portfolio_id, :user_id)
    end
end
