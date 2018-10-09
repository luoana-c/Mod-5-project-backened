class Day < ApplicationRecord
    belongs_to :child
    has_many :naps
    has_many :foods
    has_many :nappy_potties
end
