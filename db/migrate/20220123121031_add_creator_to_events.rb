class AddCreatorToEvents < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :creator_id, :string, null: false, foreign_key: true
  end
end
