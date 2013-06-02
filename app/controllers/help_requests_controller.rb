class HelpRequestsController < ApplicationController
  before_action :set_help_request, only: [:show, :edit, :update, :destroy]

  # GET /help_requests
  # GET /help_requests.json
  def index
    @help_requests = HelpRequest.all
  end

  # GET /help_requests/1
  # GET /help_requests/1.json
  def show
    respond_to do |format|
      format.html { render action: 'show', layout: 'maps'}
    end
  end

  # GET /help_requests/new
  def new
    @help_request = HelpRequest.new
  end

  # GET /help_requests/1/edit
  def edit
  end

  # POST /help_requests
  # POST /help_requests.json
  def create
    @help_request = HelpRequest.new(help_request_params)

    respond_to do |format|
      if @help_request.save
        format.html { redirect_to @help_request, notice: 'Help request was successfully created.' }
        format.json { render action: 'show', status: :created, location: @help_request }
      else
        format.html { render action: 'new' }
        format.json { render json: @help_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /help_requests/1
  # PATCH/PUT /help_requests/1.json
  def update
    respond_to do |format|
      if @help_request.update(help_request_params)
        format.html { redirect_to @help_request, notice: 'Help request was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @help_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /help_requests/1
  # DELETE /help_requests/1.json
  def destroy
    @help_request.destroy
    respond_to do |format|
      format.html { redirect_to help_requests_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_help_request
      @help_request = HelpRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def help_request_params
      params[:help_request]
    end
end
