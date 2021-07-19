require 'csv'
require_relative '../models/meal'
require_relative 'base_repository'

class MealRepository < BaseRepository
  def build_instance(row)
    row[:id] = row[:id].to_i
    row[:price] = row[:price].to_i
    @elements << Meal.new(row)
  end

  def store_infos(csv)
    csv << ['id', 'name', 'price']
    @elements.each{|meal| csv << [meal.id, meal.name, meal.price]}
  end
end
