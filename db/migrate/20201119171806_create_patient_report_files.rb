class CreatePatientReportFiles < ActiveRecord::Migration[5.0]
  def change
    create_table :patient_report_files do |t|
      t.string :name
      t.string :avatar

      t.timestamps
    end
  end
end