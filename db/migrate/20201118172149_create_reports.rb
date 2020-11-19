class CreateReports < ActiveRecord::Migration[5.0]
  def change
    create_table :reports do |t|
      t.string :report_name,null: false
      t.references :report_type

      t.timestamps
    end
  end
end
