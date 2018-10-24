class Api::V1::KidsController < ApplicationController
    def show
        kid = Kid.find(params[:id])
        render json: {
            kid_info: kid,
            age_years: kid.age_years,
            age_months: kid.age_months,
            parents: kid.kid_parents.map{|parent| {
                id: parent.id,
                name: parent.name,
                phone_number: parent.phone_number, 
                address: parent.address,
                email: parent.email
            }}
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
        kid = Kid.create(first_name: params[:first_name], last_name: params[:last_name], gender: params[:gender], date_of_birth: params[:date_of_birth])
        UserKid.create(user: childminder, kid: kid)
        render json: {
            id: kid.id, 
            gender: kid.gender,
            first_name: kid.first_name, 
            last_name: kid.last_name, 
            date_of_birth: kid.date_of_birth,
            age_years: kid.age_years,
            age_months: kid.age_months,
            parents: kid.kid_parents.map{|parent| {
                id: parent.id,
                name: parent.name,
                phone_number: parent.phone_number, 
                address: parent.address,
                email: parent.email
            }}
        }
    end 

    def update
        kid = Kid.find(params[:id])
        kid.update(kid_params)
        if kid.save
            render json: {
            id: kid.id, 
            gender: kid.gender,
            first_name: kid.first_name, 
            last_name: kid.last_name, 
            date_of_birth: kid.date_of_birth,
            age_years: kid.age_years,
            age_months: kid.age_months,
            parents: kid.kid_parents.map{|parent| {
                id: parent.id,
                name: parent.name,
                phone_number: parent.phone_number, 
                address: parent.address,
                email: parent.email
            }}
        }
        else
            render json: kid.errors 
        end 

    end 

    def add_parent
        kid = Kid.find(params[:id])
        parent = User.new(email: params[:email], password: params[:password], childminder: false, name: params[:name], phone_number: params[:phone_number], address: params[:address])
        if parent.save
            UserKid.create(kid: kid, user: parent)
            render json: {
                id: kid.id, 
                gender: kid.gender,
                first_name: kid.first_name, 
                last_name: kid.last_name, 
                date_of_birth: kid.date_of_birth,
                age_years: kid.age_years,
                age_months: kid.age_months,
                parents: kid.kid_parents.map{|parent| {
                id: parent.id,
                name: parent.name,
                phone_number: parent.phone_number, 
                address: parent.address,
                email: parent.email
            }}
            }
        else
            render json: parent.errors
        end
    end 
    
    # TODO: need to create possibility to select from existing parents to add to several kids (front and back)

    def delete_parent
        kid = Kid.find(params[:id])
        parent = User.find_by(email: params[:email])
        user_kid = UserKid.find_by(kid: kid, user: parent)
        user_kid.destroy
        parent.destroy
        render json: {message: "nap was deleted"}
    end 

    def destroy 
        # TODO: careful with deleting children; extra MVP: make them inactive instead
    end 

    private 

    def kid_params
        params.permit(:first_name, :last_name, :date_of_birth, :gender)
        # permit all params?
    end 
    
end
