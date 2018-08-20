class Heroine < ApplicationRecord
  belongs_to :power
  validates :super_name, uniqueness: true

  def power
    power = Power.find(self.power_id)
    power.name
  end
end
