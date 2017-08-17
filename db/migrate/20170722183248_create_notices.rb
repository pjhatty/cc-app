class CreateNotices < ActiveRecord::Migration[5.1]
  def change
    create_table :notices do |t|
      t.string 'title', null: false
      t.string 'content'
      t.timestamps
    end
  end
end
