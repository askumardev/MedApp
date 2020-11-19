class AddPatientToFiles < ActiveRecord::Migration[5.0]
  def change
    add_column :patient_report_files, :patient_id, :integer
    add_column :patient_report_files, :patient_report_id, :integer
  end
end
