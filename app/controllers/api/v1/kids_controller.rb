class Api::V1::KidsController < ApplicationController
    def show
        kid = Kid.find(params[:id])
        render json: {
            kid_info: kid,
            age_years: kid.age_years,
            age_months: kid.age_months,
            parents: kid.kid_parents
        }
        # render json: kid
        
    end 

    def days
        kid = Kid.find(params[:id])
        render json: kid.days.map{|day|
            {   
                id: day.id,
                date: day.date,
                naps: day.naps,
                food: day.daily_food,
                nappy_potty: day.daily_nappy_potty,
                note: day.daily_note

            }
    }
    end
    
    def create
        childminder = User.find(params[:user_id])
        kid = Kid.create(first_name: params[:first_name], last_name: params[:last_name])
        UserKid.create(user: childminder, kid: kid)
        render json: kid
    end 

    def update
    end 

    def destroy 
        # TODO: careful with deleting children; extra MVP: make them inactive instead
    end 
end
