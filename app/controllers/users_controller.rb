class UsersController < ApplicationController

    def new
    end

    def show
        @user = User.find(params[:id])
    end

    def create
            @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            return redirect_to(controller: 'users', action: "new")
        end
    end


    private
 
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end