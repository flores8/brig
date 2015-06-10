class MemoriesController < ApplicationController
  before_action :set_memory, only: [:show, :edit, :update, :destroy]

  def index
    @memories = Memory.paginate(page: params[:page], per_page: 5).order('created_at DESC')
    @memory = Memory.new
    authorize @memories
  end

  # GET /memories/1
  # GET /memories/1.json
  def show
  end

  # GET /memories/new
  def new
    @memory = Memory.new
    authorize @memory
  end

  # GET /memories/1/edit
  def edit
  end

  # POST /memories
  # POST /memories.json
  def create
    @memory = Memory.new(memory_params)
    authorize @memory
    respond_to do |format|
      if @memory.save
        format.html { redirect_to memories_path, notice: 'Thank you for sharing your memory of Brig!' }
        format.json { render :show, status: :created, location: memories_path }
      else
        format.html { render :new }
        format.json { render json: @memory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /memories/1
  # PATCH/PUT /memories/1.json
  def update
    respond_to do |format|
      if @memory.update(memory_params)
        format.html { redirect_to memories_path, notice: 'Your memory has been updated successfully.' }
        format.json { render :show, status: :ok, location: memories_path }
      else
        format.html { render :edit }
        format.json { render json: @memory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /memories/1
  # DELETE /memories/1.json
  def destroy
    @memory.destroy
    respond_to do |format|
      format.html { redirect_to memories_url, notice: 'Your memory has been deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_memory
      @memory = Memory.find(params[:id])
      authorize @memory
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def memory_params
      params.require(:memory).permit(:post, :name, :relationship, :image)
    end
end
