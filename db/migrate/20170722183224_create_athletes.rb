class CreateAthletes < ActiveRecord::Migration[5.1]
  def change
    create_table :athletes do |t|
      t.string 'first_name', null: false
      t.string 'last_name', null: false
      t.integer 'grade'
      t.string 'image'
      t.integer 'attendance'
      t.string 'note'

      t.timestamps
    end
  end
end
