# frozen_string_literal: true

class LeasesController < ApplicationController
  before_action :set_lease, only: %i[show edit update destroy]

  def index
    @leases = Lease.all
    @leases = LeasePolicy::Scope.new(current_user, @leases).resolve
    authorize @leases
  end

  def show
    @lease_property = @lease.property
    @lease_user = @lease.user
    authorize @lease
  end

  def new
    @lease = Lease.new
    @users = User.all
    @properties = Property.all
  end

  def create
    @lease = Lease.new(lease_params)
    authorize @lease
    respond_to do |format|
      if @lease.save
        format.html { redirect_to(lease_url(@lease), notice: 'Contract was successfully created.') }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    authorize @lease
    respond_to do |format|
      if @lease.update(end_date: Time.zone.today)
        format.html { redirect_to(leases_url, notice: 'Lease was successfully updated.') }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    authorize @lease
    @lease.destroy
    respond_to do |format|
      format.html { redirect_to(leases_url, notice: 'Lease was successfully destroyed.') }
    end
  end

  private

    def set_lease
      @lease = Lease.find(params[:id])
    end

    def lease_params
      params.require(:lease).permit(:property_id, :user_id)
    end
end
