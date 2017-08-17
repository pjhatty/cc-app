class CreateMeets < ActiveRecord::Migration[5.1]
  def change
    create_table :meets do |t|
      t.string 'title', null: false
      t.string 'location'
      t.datetime 'date'
      t.string 'terrain'
      t.string 'description'
      t.string 'image'
      t.string 'icon'
      t.string 'weather'
      t.string 'note'
      t.timestamps
    end
  end
end
