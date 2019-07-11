class CreateImageUrls < ActiveRecord::Migration[5.1]
  def change
    create_table :image_urls do |t|
      t.integer :subject_id, :null => false
      t.string :url

      t.timestamps
    end
  end
end
