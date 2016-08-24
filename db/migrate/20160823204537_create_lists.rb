class CreateLists < ActiveRecord::Migration[5.0]
  def change
    create_table :lists do |t|
      t.string :name, null: false
      t.string :description
      t.string :status, default: 'Not started'
      t.belongs_to :list

      t.timestamps
    end
  end
end
