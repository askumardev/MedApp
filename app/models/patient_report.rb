class PatientReport < ApplicationRecord
  has_many :patient_report_files, dependent: :delete_all
  accepts_nested_attributes_for :patient_report_files, allow_destroy: true

  validates_presence_of :patient_id, :report_id, :report_status_id, :comments
end
