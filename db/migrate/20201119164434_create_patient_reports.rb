class CreatePatientReports < ActiveRecord::Migration[5.0]
  def change
    create_table :patient_reports do |t|
      t.string :report_name
      t.integer :patient_id
      t.integer :report_id
      t.integer :report_status_id
      t.date :sample_collected_date
      t.date :report_date
      t.text :comments
      t.timestamps
    end
  end
end
