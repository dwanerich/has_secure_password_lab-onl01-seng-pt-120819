class SessionsController < ApplicationController

    def new
    end

    def create

        @user = User.find_by(name: params[:user][:name])
        @user = @user.try(:authenticate, params[:user][:password])
        return redirect_to(controller: 'sessions', action: 'new') unless @user
        session[:user_id] = @user.id
        redirect_to user_path(@user)
    end

    def destroy
        session.delete :name
    end
end