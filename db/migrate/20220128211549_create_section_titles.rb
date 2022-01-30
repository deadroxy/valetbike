class CreateSectionTitles < ActiveRecord::Migration[6.1]
  def change
    create_table :section_titles do |t|
      t.string :identifier

      t.timestamps
    end
  end
end
