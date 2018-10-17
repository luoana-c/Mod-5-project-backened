class Api::V1::NapsController < ApplicationController

    def show
        # TODO: might not need a show method for naps, as we only do posts and patches
        nap = Nap.find(params[:id])
        render json: nap
    end

    def index
         # TODO: might not need a index method for naps, as we only do posts and patches
    end

    def create
        day = Day.find(params[:day_id])
        # what happens if I click again on start nap after the time was changed?
        # as I am finding or creating by start as well...
        nap = Nap.create(day: day)
    
        Pusher.trigger('my-channel', 'my-event', {
            message: nap.to_json
        })

        render json: nap
    end 

    def update
        nap = Nap.find(params[:id])
        
        if params[:start]
            nap.update(start: params[:start])
        elsif params[:end]
            nap.update(end: params[:end])
        end
        Pusher.trigger('my-channel', 'my-event', {
            message: nap.to_json
        })
        render json: nap
    end 

    def destroy
        nap = Nap.find(params[:id])
        Pusher.trigger('my-channel', 'delete-nap', {
            message: nap.to_json
        })
        nap.destroy
        
        render json: {message: "nap was deleted"}
    end 

    # def nap_params(*args)
    #     params.require(:nap).permit(*args)
    # end 
end
