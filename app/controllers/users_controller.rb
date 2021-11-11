class UsersController < ApplicationController
    before_action :find_user, only:[:show, :edit, :update, :destroy]

    def index 
      if params[:query]
        users = User.where('username LIKE ?', "%#{params[:query]}%")
      else 
        users = User.all
      end 
      render json: users
    end


    def show 
        #user = User.find(params(:id))
        render json: params
    end


    def new 
        @user = User.new
    end


    def edit 
        #user = User.find(params(:id))
    end
    

    def create 
        user = User.new(user_params)
        if user.save!
            render json: user
        else 
            render json: user.errors.full_messages, status: :unprocessable_entity
        end
    end


    def update 
        #user = User.find(params(:id))
        if user.update_attributes(user_params)
            render json: user
        else 
            render json: user.errors.full_messages, status: :unprocessable_entity
        end
    end


    def destroy 
        #user = User.find(params(:id))
        user.destroy
		render json: user
    end

    

    private 
    #this action locates the user instance in the database
    def find_user
        user = User.find(params(:id))
    end


    #this action only permits the following attributes to be entered in by the user, called whitelisting
    def user_params
        params.require(:user).permit(:name, :email)
    end

end