class PatientsController < ApplicationController
  def index
    @patients = Patient.paginate page: params[:page], per_page: 5
  end

  def new
    @patient = Patient.new
  end

  def edit
    @patient = Patient.find(params[:id])
  end

  def show
    @patient = Patient.find(params[:id])
  end
  def import
    @p = Patient.my_import(params[:file].path)
    redirect_to patients_path,notice: "Imported successfully"
  end
end
