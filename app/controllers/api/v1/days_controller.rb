class Api::V1::DaysController < ApplicationController

    def show

        kid = Kid.find(params[:id])
        day = Day.find_by(date: params[:date], kid_id: kid.id )
    
        render json: {
            id: day.id, 
            date: day.date,
            start_time: day.start_t, 
            end_time: day.end_t,
            food: day.daily_food,
            nappy_potty: day.daily_nappy_potty,
            naps: day.naps.map{|nap| {
                id: nap.id,
                day_id: nap.day_id,
                start: nap.start, 
                end: nap.end,
                duration: nap.nap_duration
            }},
            note: day.daily_note
        }
    end 

    def create
        kid = Kid.find(params[:kid_id])
        day = Day.find_or_create_by(kid: kid, date: params[:date])

        render json: day
    end 
end
