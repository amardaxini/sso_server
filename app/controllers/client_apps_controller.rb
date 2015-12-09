class ClientAppsController < ApplicationController
  before_action :set_client_app, only: [:show, :edit, :update, :destroy]

  # GET /client_apps
  # GET /client_apps.json
  def index
    @client_apps = ClientApp.all
  end

  # GET /client_apps/1
  # GET /client_apps/1.json
  def show
  end

  # GET /client_apps/new
  def new
    @client_app = ClientApp.new
  end

  # GET /client_apps/1/edit
  def edit
  end

  # POST /client_apps
  # POST /client_apps.json
  def create
    @client_app = ClientApp.new(client_app_params)

    respond_to do |format|
      if @client_app.save
        format.html { redirect_to @client_app, notice: 'Client app was successfully created.' }
        format.json { render :show, status: :created, location: @client_app }
      else
        format.html { render :new }
        format.json { render json: @client_app.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /client_apps/1
  # PATCH/PUT /client_apps/1.json
  def update
    respond_to do |format|
      if @client_app.update(client_app_params)
        format.html { redirect_to @client_app, notice: 'Client app was successfully updated.' }
        format.json { render :show, status: :ok, location: @client_app }
      else
        format.html { render :edit }
        format.json { render json: @client_app.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /client_apps/1
  # DELETE /client_apps/1.json
  def destroy
    @client_app.destroy
    respond_to do |format|
      format.html { redirect_to client_apps_url, notice: 'Client app was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client_app
      @client_app = ClientApp.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def client_app_params
      params.require(:client_app).permit(:name, :subdomain, :tenant_name)
    end
end
