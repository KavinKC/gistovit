class CreateEmotions < ActiveRecord::Migration
  def change
    create_table :emotions do |t|
      t.float :joy
      t.float :disgust
      t.float :anger
      t.float :sad
      t.float :fear

      t.timestamps null: false
    end
  end
end
