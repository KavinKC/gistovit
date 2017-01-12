class ChangeDisgustToSurpriseColumn < ActiveRecord::Migration
  def change
    remove_column :emotions, :disgust
    add_column :emotions, :surprise, :string
  end
end
