class Api::V1::UsersController < ApplicationController
    def index
        # should delete this method, should not be able to access data for all users
        @users = User.all
        render json: @users.map { |user| 
            {
                name: user.name,
                kids: user.childminder_or_parent_kids
            }
        }
    end

    # def login
    #     user = User.find_or_create_by(email: params[:email])
    #     render json: user
    # end 

    def signin
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
            render json: {email: user.email, token: issue_token({id: user.id}), id: user.id, childminder: user.childminder}
        else 
            render json: {error: 'Invalid email or password.'}, status: 400
        end
    end 
    
    # def validate
    #     user = current_user
    #     if user
    #         render json: {username: user.username, token: token}
    #     else
    #         render json: {error: 'Validation failed.'}, status: 400
    #     end
    # end

    # def create
    #     user = User.new(user_params)
    #     if user.valid?
    #         user.save
    #         render json: user 
    #     else 
    #         render json: user.errors
    #     end
    # end 

    # def update
    #     user = User.find(params[:id])
    #     user.update(user_params)
    #     if user.save
    #         render json: user 
    #     else 
    #         render json: user.errors
    #     end
    # end 

    def signup
        user = User.new(email: params[:email], password: params[:password])
        if user.save
            render json: {email: user.email, token: issue_token({id: user.id}), id: user.id, childminder: user.childminder}, status: :created
        else
            render json: {error: 'Failed to create user.'}, status: :not_acceptable
        end 
    end 

    def update
        user = User.find(params[:id])
        user.update(user_params)
        if user.save
            render json: user
        else 
            render json: user.errors
        end
    end 

    def show
        # user = current_user
        user = User.find(params[:id])
        # if user

            render json: {
                user_info: user,
                kids: user.childminder_or_parent_kids.map{|kid|
                    {
                        id: kid.id, 
                        gender: kid.gender,
                        first_name: kid.first_name, 
                        last_name: kid.last_name, 
                        date_of_birth: kid.date_of_birth,
                        age_years: kid.age_years,
                        age_months: kid.age_months
                    }
              }
            }
        # else
        #     render json: {error: 'You are not signed in.'}, status: 400
        # end
        
    end 

    private

    def user_params
        params.permit(:name, :email, :childminder, :phone, :address)
        # permit all params?
    end 
end
