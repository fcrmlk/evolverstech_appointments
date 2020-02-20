class DoctorsController < ApplicationController
  before_action :set_doctor, only: [:show, :edit, :update, :destroy]

  def index
    @doctors = Doctor.all
  end

  def search
  end

  def available
    date = Date.civil(params[:appointment]["date(1i)"].to_i,params[:appointment]["date(2i)"].to_i,params[:appointment]["date(3i)"].to_i)
    time = make_time_from_params(params).to_time
    Appointment.where(doctor_id: params[:appointment][:doctor_id], app_date: date).each do |appointment|
      @availablity = false if (appointment.start_time.to_time..appointment.end_time.to_time).include?(time.to_time)
    end

  end

  def show
  end

  def new
    @doctor = Doctor.new
  end

  def edit
  end

  def create
    @doctor = Doctor.new(doctor_params)

    respond_to do |format|
      if @doctor.save
        format.html { redirect_to @doctor, notice: 'Doctor was successfully created.' }
        # format.json { render :show, status: :created, location: @doctor }
      else
        format.html { render :new }
        # format.json { render json: @doctor.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @doctor.update(doctor_params)
        format.html { redirect_to @doctor, notice: 'Doctor was successfully updated.' }
        # format.json { render :show, status: :ok, location: @doctor }
      else
        format.html { render :edit }
        # format.json { render json: @doctor.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @doctor.destroy
    respond_to do |format|
      format.html { redirect_to doctors_url, notice: 'Doctor was successfully destroyed.' }
      # format.json { head :no_content }
    end
  end

  private

    def make_time_from_params(params)
      byebug
      Time.new(params[:appointment]['time(1i)'], params[:appointment]['time(2i)'], params[:appointment]['time(3i)'], params[:appointment]['time(4i)'], params[:appointment]['time(5i)'])
    end

    def set_doctor
      @doctor = Doctor.find(params[:id])
    end

    def doctor_params
      params.require(:doctor).permit(:name)
    end
end
