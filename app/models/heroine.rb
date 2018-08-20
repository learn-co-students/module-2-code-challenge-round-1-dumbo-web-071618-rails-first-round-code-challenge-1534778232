
class Heroine < ApplicationRecord
  belongs_to :power
  #validates :name, :uniquness => true
  #I know i have to make a validate.rb file in initializers and then make a class where I inherit the ActiveRecord::Validator, but when I try it I am getting errors when I make a path to the file itself so that's why I am commeniting ut the validates line
end
