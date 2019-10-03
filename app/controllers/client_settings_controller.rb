class ClientSettingsController < ApplicationController
  before_action :set_client_setting, only: [:show, :edit, :update, :destroy]

  # GET /client_settings/1
  # GET /client_settings/1.json
  def show
  end

  # GET /client_settings/1/edit
  def edit
  end

  # PATCH/PUT /client_settings/1
  # PATCH/PUT /client_settings/1.json
  def update
    respond_to do |format|
      if @client_setting.update(client_setting_params)
        format.html { redirect_to client_settings_path, notice: 'Client setting was successfully updated.' }
        format.json { render :show, status: :ok, location: @client_setting }
      else
        format.html { render :edit }
        format.json { render json: @client_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client_setting
      @client_setting = ClientSetting.first
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def client_setting_params
      params.require(:client_setting).permit(:distributor_id, :name)
    end
end
