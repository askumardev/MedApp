class Patient < ApplicationRecord
	require 'csv'
	require 'activerecord-import/base'
	require 'activerecord-import/active_record/adapters/postgresql_adapter'

	def name
		"#{self.first_name}  #{self.last_name}"
	end

	def self.my_import(file)
		patients=[]
		CSV.foreach(file,liberal_parsing: true, headers: :first_row ) do |row|
			patients << Patient.new(row.to_h)
		end
		Patient.import patients, recursive: true
	end
end
