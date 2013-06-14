class CreateBeats < ActiveRecord::Migration
  def change
    create_table :beats do |t|
      t.string :title

      t.timestamps
    end
  end
end
