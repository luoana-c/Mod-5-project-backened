class Day < ApplicationRecord
    belongs_to :child
    has_many :naps
    # has_many :foods
    # has_many :nappy_potties

    def start_t
        self.start_time.strftime("%I:%M")
    end 

    def end_t
        self.end_time.strftime("%I:%M")
    end 

    def daily_note
        Note.find_by(day_id: self.id)
    end 

    def daily_food
        Food.find_by(day_id: self.id)
    end 

    def daily_nappy_potty
        NappyPotty.find_by(day_id: self.id)
    end 
end
