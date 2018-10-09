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
end
