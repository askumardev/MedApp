class PatientReport < ApplicationRecord
	has_many :patient_report_files
	accepts_nested_attributes_for :patient_report_files, allow_destroy: true
end
