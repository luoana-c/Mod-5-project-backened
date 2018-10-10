class Api::V1::ChildrenController < ApplicationController
    def show
        child = Child.find(params[:id])
        render json: {
            child_info: child,
            age_years: child.age_years,
            age_months: child.age_months,
            parents: child.child_parents
        }
        # render json: child
        
    end 

    def days
        child = Child.find(params[:id])
        render json: child.days.map{|day|
            {   
                date: day.date,
                naps: day.naps,
                food: day.foods,
                nappy_potty: day.nappy_potties

            }
    }
    
    end 
end
