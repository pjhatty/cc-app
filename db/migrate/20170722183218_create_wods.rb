class CreateWods < ActiveRecord::Migration[5.1]
  def change
    create_table :wods do |t|
      t.string 'title', null: false
      t.string 'location'
      t.datetime 'date'
      t.string 'description'
      t.string 'image'
      t.string 'icon'
      t.string 'note'
      t.boolean 'hero'
      t.timestamps
    end
  end
end
