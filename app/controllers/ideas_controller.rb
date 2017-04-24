class IdeasController < ApplicationController
    def ideas
        @user = User.find(session[:user_id])
        @ideas = Idea.all.sort{ |a,b| b.likes.count <=> a.likes.count }
        render 'all_ideas'
    end

    def new
        Idea.create(content: params[:idea], user_id: session[:user_id])
        redirect_to :back
    end

    def like
        if not Like.where(user_id: session[:user_id], idea_id: params[:idea_id]).exists?
            Like.create(user_id: session[:user_id], idea_id: params[:idea_id])
        end
        redirect_to :back
    end

    def destroy
        Idea.find(params[:idea_id]).destroy
        redirect_to :back
    end

    def show
        @idea = Idea.find(params[:idea_id])
        @likers = @idea.likes
        render 'specific_idea'
    end
end
