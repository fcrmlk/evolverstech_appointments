class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]

  def index
    @appointments = Appointment.all
  end

  def show
  end

  def new
    @appointment = Appointment.new
  end

  def edit
  end

  def create
    @appointment = Appointment.new(appointment_params)
    # time = make_time_from_params(appointment_params)
    respond_to do |format|
      if @appointment.save
        format.html { redirect_to @appointment, notice: 'Appointment was successfully created.' }
        # format.json { render :show, status: :created, location: @appointment }
      else
        format.html { render :new }
        # format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @appointment.update(appointment_params)
        format.html { redirect_to @appointment, notice: 'Appointment was successfully updated.' }
        # format.json { render :show, status: :ok, location: @appointment }
      else
        format.html { render :edit }
        # format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @appointment.destroy
    respond_to do |format|
      format.html { redirect_to appointments_url, notice: 'Appointment was successfully destroyed.' }
      # format.json { head :no_content }
    end
  end

  private
    def set_appointment
      @appointment = Appointment.find(params[:id])
    end
  #   def make_time_from_params(params)
  #     byebug
  #   Time.new(params[:appointment]['time(1i)'], params[:appointment]['time(2i)'], params[:appointment]['time(3i)'], params[:appointment]['time(4i)'], params[:appointment]['time(5i)'])
  # end
    def appointment_params
      params.require(:appointment).permit(:app_date, :start_time, :end_time, :doctor_id)
    end
end
