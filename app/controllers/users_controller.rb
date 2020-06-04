class UsersController < ApplicationController


    def new
    end

    def show
        @user = User.find(params[:id])
    end

    def create
            @user = User.create(user_params)
            return head(:forbidden) unless @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)

        if !@user.authenticate(params[:password])
            render :login
        end
    end


    private
 
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end