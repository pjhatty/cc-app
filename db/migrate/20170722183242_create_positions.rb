class CreatePositions < ActiveRecord::Migration[5.1]
  def change
    create_table :positions do |t|
      t.string 'placement'
      t.string 'time'
      t.boolean 'pr'
      t.string 'icon'
      t.string 'note'
      t.boolean 'medaled'
      t.belongs_to :meet, index: true
      t.belongs_to :athlete, index: true
      t.timestamps
    end
  end
end
