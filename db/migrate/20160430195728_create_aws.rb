class CreateAws < ActiveRecord::Migration
  def change
    create_table :aws do |t|
      t.string :file

      t.timestamps null: false
    end
  end
end
