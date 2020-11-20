class HomeController < ApplicationController
  def index
  end
  def dashboard
  end
  def download_pdf
    @file = PatientReportFile.find(params[:id])
    send_file @file.avatar.path, :disposition => 'attachment', :type => "multipart/related"
    redirect_to patient_reports_path
  end
end
