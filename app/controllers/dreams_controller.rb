class DreamsController < ApplicationController

  before_filter :authenticate_user!

  # GET /dreams
  # GET /dreams.json
  def index
    @dreams = current_user.dreams

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @dreams }
    end
  end

  # GET /dreams/1
  # GET /dreams/1.json
  def show
    @dream = Dream.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @dream }
    end
  end

  # GET /dreams/new
  # GET /dreams/new.json
  def new
    @dream = Dream.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @dream }
    end
  end

  # POST /dreams
  # POST /dreams.json
  def create
    @dream = Dream.new(params[:dream], user: current_user)

    respond_to do |format|
      if @dream.save
        current_user.dreams << @dream
        format.html { redirect_to @dream, notice: 'Dream was successfully created.' }
        format.json { render json: @dream, status: :created, location: @dream }
      else
        format.html { render action: "new" }
        format.json { render json: @dream.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dreams/1
  # DELETE /dreams/1.json
  def destroy
    @dream = current_user.dreams.where(id: params[:id]).first
    if @dream.nil?
       render(status: 401, text: "Unauthorized") && return
    end

    @dream.destroy
    respond_to do |format|
      format.html { redirect_to dreams_url }
      format.json { head :no_content }
    end
  end

  def find_dream
  end
end
