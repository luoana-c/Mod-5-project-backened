class Api::V1::NappyPottiesController < ApplicationController
    def create 
        day = Day.find(params[:day_id])
        nappy_potty = NappyPotty.create(day: day)
        render json: nappy_potty
    end 

    def update
        nappy_potty = NappyPotty.find(params[:id])
        if params[:wet]
            nappy_potty.update(wet: params[:wet])
        elsif params[:bm_normal]
            nappy_potty.update(bm_normal: params[:bm_normal])
        elsif params[:bm_runny]
            nappy_potty.update(bm_runny: params[:bm_runny])
        elsif params[:bm_hard]
            nappy_potty.update(bm_hard: params[:bm_hard])
        end
        render json: nappy_potty
    end 
end
