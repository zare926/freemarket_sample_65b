class ChangeDataPrefectureToItems < ActiveRecord::Migration[5.2]
  def change
    cange_column :items, :data, :integer
  end
end
