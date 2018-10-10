class Api::V1::DaysController < ApplicationController

    def show

        child = Child.find(params[:id])
        day = Day.find_by(date: params[:date])
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
                start: nap.nap_start, 
                end: nap.nap_end,
                duration: nap.nap_duration
            }},
            note: day.daily_note
        }
    end 


end
