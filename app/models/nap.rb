class Nap < ApplicationRecord
    belongs_to :day

    def nap_duration
        Time.at(self.end - self.start).utc.strftime("%H:%M") if (self.start && self.end)
      
    end 

    def nap_start
        self.start.strftime("%H:%M") if self.start
    end 

    def nap_end 
        self.end.strftime("%H:%M") if self.end
    end 
end
