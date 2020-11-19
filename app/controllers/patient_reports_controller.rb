class PatientReportsController < ApplicationController
  before_action :set_patient_report, only: [:edit, :update, :destroy, :show]

  def index
    @reports = PatientReport.paginate page: params[:page], per_page: 5
  end

  def new
    @report=PatientReport.new
    @report_files = @report.patient_report_files.build
    @patients=Patient.all.pluck(:first_name)
    @reports=Report.all.pluck(:report_name)
    @status=ReportStatus.all.pluck(:name)
  end

  def create
    @report = PatientReport.new(set_patient_report_params)
    if @report.save!
      params[:patient_report_files]['avatar'].each do |a|
        @report_files = @report.patient_report_files.create!(:avatar => a, :patient_report_id => @report.id,:patient_id=>@report.patient_id)
      end
			redirect_to patient_reports_path , notice: "Patient report saved successfully."
		else
			render :new
		end
  end

  def edit
    @report_files = @report.patient_report_files.build
  end

  def set_patient_report
    @report = PatientReport.find(params[:id])
  end

  private
	def set_patient_report_params
		params.require(:patient_report).permit(:patient_id, :report_id, :report_status_id, :sample_collected_date, 
			:report_date, :comments,patient_report_files_attributes: [ :id, :patient_id,:patient_report_id, :avatar ] )
	end
end

