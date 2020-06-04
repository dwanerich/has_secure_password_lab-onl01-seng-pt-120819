class SessionsController < ApplicationController

    def new
        render :'/users/new'
    end

    def create
        @user = User.find_by(name: params[:name])
        return head(:forbidden) unless @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to user_path(@user)
    end

    def destroy
        session.delete
    end
end