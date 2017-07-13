class TimeRegistrationsController < ApplicationController
  before_action :set_time_registration, only: [:show, :edit, :update, :destroy]
  before_action :find_or_create_time_registration, only: [:green, :white]

  # GET /time_registrations
  # GET /time_registrations.json
  def index
    @time_registrations = TimeRegistration.all
  end

  # GET /time_registrations/1
  # GET /time_registrations/1.json
  def show
  end

  # GET /time_registrations/new
  def new
    @time_registration = TimeRegistration.new
  end

  # GET /time_registrations/1/edit
  def edit
  end

  # POST /time_registrations
  # POST /time_registrations.json
  def create
    @time_registration = TimeRegistration.create(time_registration_params)
    respond_to do |format|
      if @time_registration.save
        format.json { render :show, status: :created, location: @time_registration }
      else
        format.json { render json: @time_registration.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /time_registrations/green
  def green
    if (params[:prestation] =~ /([a-zA-Z]+)/)
      @time_registration.hours = nil
      @time_registration.pay_code = params[:prestation]
      puts @time_registration.inspect
    else
      @time_registration.pay_code = "W"
      @time_registration.hours = params[:prestation].to_f
      puts @time_registration.inspect
    end

    if @time_registration.save
      render json: {}, status: :created, location: @time_registration
    else
      render json: @time_registration.errors, status: :unprocessable_entity
    end
  end

  # POST /time_registrations/white
  def white
    @time_registration.extra = params[:extra].to_f

    respond_to do |format|
      if @time_registration.save
        format.json { render :show, status: :created, location: @time_registration }
      else
        format.json { render json: @time_registration.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /time_registrations/1
  # PATCH/PUT /time_registrations/1.json
  def update
    respond_to do |format|
      if @time_registration.update(time_registration_params)
        format.html { redirect_to @time_registration, notice: 'Time registration was successfully updated.' }
        format.json { render :show, status: :ok, location: @time_registration }
      else
        format.html { render :edit }
        format.json { render json: @time_registration.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /time_registrations/1
  # DELETE /time_registrations/1.json
  def destroy
    @time_registration.destroy
    respond_to do |format|
      format.html { redirect_to time_registrations_url, notice: 'Time registration was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def find_or_create_time_registration
      @time_registration = TimeRegistration.find_or_create_by(
        employee_id: params[:employee_id],
        work_order_id: params[:work_order_id],
        prestation_date: params[:date]
      )
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_time_registration
      @time_registration = TimeRegistration.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def time_registration_params
      params.fetch(:time_registration, {}).permit(:employee_id, :prestation, :date, :work_order_id, :extra)
    end
end
