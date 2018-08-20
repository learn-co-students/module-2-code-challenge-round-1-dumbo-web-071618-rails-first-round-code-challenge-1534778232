class RemoveHeroineIdFromPowers < ActiveRecord::Migration[5.1]
  def change
    remove_column :powers, :heroine_id
  end
end
