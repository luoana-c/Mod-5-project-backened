class Api::V1::NappyPottiesController < ApplicationController
    def create 
        day = Day.find(params[:day_id])
        nappy_potty = NappyPotty.create(day: day)
        Pusher.trigger('my-channel', 'my-event', {
            message: {
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
            }.to_json
        })
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

    def update
        nappy_potty = NappyPotty.find(params[:id])
        day = Day.find(nappy_potty.day_id)
        if params[:wet]
            nappy_potty.update(wet: params[:wet])
        elsif params[:bm_normal]
            nappy_potty.update(bm_normal: params[:bm_normal])
        elsif params[:bm_runny]
            nappy_potty.update(bm_runny: params[:bm_runny])
        elsif params[:bm_hard]
            nappy_potty.update(bm_hard: params[:bm_hard])
        end
        Pusher.trigger('my-channel', 'my-event', {
            message: {
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
            }.to_json
        })
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
end
