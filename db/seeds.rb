# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(email: 'admin@eisai.com', password: '123456', password_confirmation: '123456')

ReportStatus.create(name: 'New')
ReportStatus.create(name: 'Sample Collected')
ReportStatus.create(name: 'Test In Progress')
ReportStatus.create(name: 'Report Ready')
ReportStatus.create(name: 'Report given to patient')

ReportType.create(report_type: 'Document', extension: 'Document/pdf')
ReportType.create(report_type: 'Scan ', extension: 'Image')
ReportType.create(report_type: 'XRay ', extension: 'XRay')

Report.create(report_name: 'Consultation report', report_type_id: 1)
Report.create(report_name: 'Discharge report', report_type_id: 1)
Report.create(report_name: 'Blood test report', report_type_id: 1)
Report.create(report_name: 'CT scan report', report_type_id: 2)
Report.create(report_name: 'Coronary angiogram report', report_type_id: 2)
Report.create(report_name: 'Emphysema report', report_type_id: 3)
Report.create(report_name: 'Ortho report', report_type_id: 3)
