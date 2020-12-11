class PatientReportsController < ApplicationController
  before_action :set_patient_report, only: %i[edit update destroy show]

  def index
    @reports = PatientReport.all
  end

  def new
    @report = PatientReport.new
    @report_files = @report.patient_report_files.build
  end

  def create
    @report = PatientReport.new(set_patient_report_params)
    if @report.save
      if params[:patient_report_files]['avatar'].present? && !params[:patient_report_files]['avatar'].nil?
        params[:patient_report_files]['avatar'].each do |a|
          @report_files = @report.patient_report_files.create!(avatar: a, patient_report_id: @report.id,
                                                               patient_id: @report.patient_id)
        end
        redirect_to patient_reports_path, notice: 'Patient report saved successfully.'
      else
        redirect_to new_patient_report_path
      end
    else
      redirect_to new_patient_report_path
    end
  end

  def edit
    @report_files = @report.patient_report_files.build
  end

  def show
    @files = @report.patient_report_files
  end

  def destroy
    if @report.destroy
      redirect_to patient_reports_path, notice: 'Patient was successfully deleted.'
    else
      render :edit
    end
  end

  def set_patient_report
    @report = PatientReport.find(params[:id])
  end

  private

  def set_patient_report_params
    params.require(:patient_report).permit(:patient_id, :report_id, :report_status_id, :sample_collected_date,
                                           :report_date, :comments, patient_report_files_attributes: %i[id patient_id patient_report_id avatar])
  end
end
