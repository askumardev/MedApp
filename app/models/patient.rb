class Patient < ApplicationRecord
  require 'csv'
  require 'activerecord-import/base'
  require 'activerecord-import/active_record/adapters/postgresql_adapter'

  validates_presence_of :first_name, :last_name, :email, :mobile_number, :address_line1, :address_line2,
                        :city, :state, :country, :zip

  validates :mobile_number, length: { is: 10 }

  def name
    "#{first_name}  #{last_name}"
  end

  def self.my_import(file)
    patients = []
    CSV.foreach(file, liberal_parsing: true, headers: :first_row) do |row|
      patients << Patient.new(row.to_h)
    end
    Patient.import patients, recursive: true
  end
end
