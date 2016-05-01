class CreateBrigthIdeas < ActiveRecord::Migration
  def change
    create_table :brigth_ideas do |t|
      t.text :content
      t.references :user, index: true

      t.timestamps
    end
  end
end
