class CreateActors < ActiveRecord::Migration

  def change
    create_table :actors do |t|
      t.string :first_name, :last_name
    end
  end
end
