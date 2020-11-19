class CreateReportTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :report_types do |t|
      t.string :report_type,null: false
      t.string :extension,null: false
      t.belongs_to :report

      t.timestamps
    end
  end
end
