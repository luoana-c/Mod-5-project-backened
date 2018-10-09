class Api::V1::UsersController < ApplicationController
    def index
        # should delete this method, should not be able to access data for all users
        @users = User.all
        render json: @users.map { |user| 
            {
                name: user.name,
                children: user.childminder_or_parent_children
            }
        }
    end

    def show
        # user = current_user
        user = User.find(params[:id])
        # if user

            render json: {
                user_info: user,
                children: user.childminder_or_parent_children
            }
        # else
        #     render json: {error: 'You are not signed in.'}, status: 400
        # end
        
    end 
end
