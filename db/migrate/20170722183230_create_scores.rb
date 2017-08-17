class CreateScores < ActiveRecord::Migration[5.1]
  def change
    create_table :scores do |t|
      t.string 'level'
      t.string 'reps'
      t.string 'rounds'
      t.string 'time'
      t.boolean 'pr'
      t.string 'placement'
      t.string 'icon'
      t.belongs_to :wod, index: true
      t.belongs_to :athlete, index: true
      t.timestamps
    end
  end
end
