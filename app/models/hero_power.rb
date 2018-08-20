class HeroPower < ApplicationRecord
    belongs_to :power 
    belongs_to :heroine
end
