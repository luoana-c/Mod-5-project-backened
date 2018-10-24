class Api::V1::FoodsController < ApplicationController
    def create
        day = Day.find(params[:day_id])
        food = Food.create(day: day)
        Pusher.trigger('my-channel', 'create-food', {
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

    # naps: day.naps.map{|nap| {
    #             id: nap.id,
    #             day_id: nap.day_id,
    #             start: nap.start, 
    #             end: nap.end,
    #             duration: nap.nap_duration
    #         }},

    def update 
        food = Food.find(params[:id])
        day = Day.find(food.day_id)
        
        if params[:breakfast_items]
            food.update(breakfast_items: params[:breakfast_items])
        elsif params[:breakfast_had]
            food.update(breakfast_had: params[:breakfast_had])
        elsif params[:am_snack_items]
            food.update(am_snack_items: params[:am_snack_items])
        elsif params[:am_snack_had]
            food.update(am_snack_had: params[:am_snack_had])
        elsif params[:lunch_items]
            food.update(lunch_items: params[:lunch_items])
        elsif params[:lunch_had]
            food.update(lunch_had: params[:lunch_had])
        elsif params[:pm_snack_items]
            food.update(pm_snack_items: params[:pm_snack_items])
        elsif params[:pm_snack_had]
            food.update(pm_snack_had: params[:pm_snack_had])
        elsif params[:dinner_tea_items]
            food.update(dinner_tea_items: params[:dinner_tea_items])
        elsif params[:dinner_tea_had]
            food.update(dinner_tea_had: params[:dinner_tea_had])
        end
        Pusher.trigger('my-channel', 'change-food', {
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
