class HelpRequestsController < ApplicationController
  before_action :set_help_request, only: [:show]

  before_filter lambda { @body_class = 'help_requests' }

  # GET /help_requests/1
  # GET /help_requests/1.json
  def show
    respond_to do |format|
      format.html { render action: 'show', layout: 'maps'}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_help_request
      # @help_request = HelpRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def help_request_params
      params[:help_request]
    end
end
