class PatientsController < ApplicationController
  before_action :set_patient, only: [:edit, :update, :destroy, :show]

  def index
    @patients = Patient.paginate page: params[:page], per_page: 5
  end

  def new
    @patient = Patient.new
  end

  def create
		@patient = Patient.new(set_patient_params)
    if @patient.save
			redirect_to patients_path , notice: "Patient '#{@patient.name}' saved successfully."
		else
			render :new
		end
	end

  def edit
  end

  def show
  end

	def update
    if @patient.update(set_patient_params)
      redirect_to @patient, notice: 'Patient was successfully updated.'            
    else
      render :edit 
    end
	end

  def destroy
		if @patient.delete
        redirect_to patients_path, notice: 'Patient was successfully deleted.'            
    else
      render :edit 
    end
  end
  
  def import
    @p = Patient.my_import(params[:file].path)
    redirect_to patients_path,notice: "Imported successfully"
  end

  def set_patient
    @patient = Patient.find(params[:id])
  end

  private
	def set_patient_params
		params.require(:patient).permit(:first_name, :last_name, :email, :mobile_number, 
			:address_line1, :address_line2, :city, :state, :country, :zip )
	end
end
