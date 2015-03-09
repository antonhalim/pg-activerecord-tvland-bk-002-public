class AddActorsToShows < ActiveRecord::Migration
  def change
    add_column :actors, :show_id, :integer
    add_column :shows, :actor_id, :integer
  end
end
