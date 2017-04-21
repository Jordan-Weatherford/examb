class UsersController < ApplicationController
    def index
    end

    def register
        new_user = User.create(user_params)
        if new_user.valid?
            new_user.save
            session[:user_id] = new_user.id
            redirect_to '/bright_ideas'
        else
            flash[:registration_errors] = new_user.errors.full_messages
            redirect_to :back
        end
    end

    def login
        user = User.where(email: params[:email]).first
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to '/bright_ideas'
        else
            flash[:login_errors] = ['invalid login information']
            redirect_to :back
        end
    end

    def logout
        session[:user_id] = nil
        redirect_to '/'
    end

    def user_info
        @user = User.find(session[:user_id])
    end


    private
        def user_params
            params.require(:user).permit(:name, :alias, :email, :password, :password_confirmation)
        end
end
