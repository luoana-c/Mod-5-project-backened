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
                date: day.date,
                naps: day.naps,
                food: day.daily_food,
                nappy_potty: day.daily_nappy_potty,
                note: day.daily_note

            }
    }
    
    end 
end
