# frozen_string_literal: true

class PropertiesController < ApplicationController
  before_action :set_property, only: %i[show edit update destroy]

  def index
    @properties = Property.all
  end

  def show; end

  def new
    @property = Property.new
  end

  def create
    @property = current_user.properties.new(property_params)

    respond_to do |format|
      if @property.save
        format.html { redirect_to(property_url(@property), notice: 'Property was successfully created.') }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    authorize @property
    respond_to do |format|
      if @property.update(property_params)
        format.html { redirect_to(property_url(@property), notice: 'Property was successfully updated.') }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    authorize @property
    @property.destroy

    respond_to do |format|
      format.html { redirect_to(properties_url, notice: 'Property was successfully destroyed.') }
    end
  end

  private

    def set_property
      @property = Property.find(params[:id])
    end

    def property_params
      params.require(:property).permit(:property_type, :amount, images: [])
    end
end
