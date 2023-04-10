# frozen_string_literal: true

class AppointmentsController < ApplicationController
  before_action :set_appointments, only: %i[show update destroy]

  def index
    @appointments = current_user.appointments.all
  end

  def show; end

  def create
    @appointment = current_user.appointments.new(appointment_params)

    respond_to do |format|
      if @appointment.save
        format.html { redirect_to(appointment_url(@appointment), notice: 'Appointment successfully booked') }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @appointment.update(property_params)
        format.html { redirect_to(property_url(@appointment), notice: 'Appointement was successfully updated.') }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @appointment.destroy
    respond_to do |format|
      format.html { redirect_to(properties_url, notice: 'Appointment was successfully destroyed.') }
    end
  end

  private

    def set_appointments
      @appointment = Appointment.find(params[:id])
    end

    def appointment_params
      params.permit(:property_id)
    end
end
