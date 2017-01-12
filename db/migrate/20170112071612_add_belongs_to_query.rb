class AddBelongsToQuery < ActiveRecord::Migration
  def change
    add_reference :emotions, :query, index: true, foreign_key: true
  end
end
