class PatientReportFile < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  belongs_to :patient_report, optional: true

  validates :avatar, presence: true
end
