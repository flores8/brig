class PrivateMemoriesController < ApplicationController
  before_action :set_private_memory, only: [:show, :edit, :update, :destroy]

  # GET /private_memories
  # GET /private_memories.json
  def index
    @private_memories = PrivateMemory.all
  end

  # GET /private_memories/1
  # GET /private_memories/1.json
  def show
  end

  # GET /private_memories/new
  def new
    @private_memory = PrivateMemory.new
  end

  # GET /private_memories/1/edit
  def edit
  end

  # POST /private_memories
  # POST /private_memories.json
  def create
    @private_memory = PrivateMemory.new(private_memory_params)

    respond_to do |format|
      if @private_memory.save
        format.html { redirect_to @private_memory, notice: 'Private memory was successfully created.' }
        format.json { render :show, status: :created, location: @private_memory }
      else
        format.html { render :new }
        format.json { render json: @private_memory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /private_memories/1
  # PATCH/PUT /private_memories/1.json
  def update
    respond_to do |format|
      if @private_memory.update(private_memory_params)
        format.html { redirect_to @private_memory, notice: 'Private memory was successfully updated.' }
        format.json { render :show, status: :ok, location: @private_memory }
      else
        format.html { render :edit }
        format.json { render json: @private_memory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /private_memories/1
  # DELETE /private_memories/1.json
  def destroy
    @private_memory.destroy
    respond_to do |format|
      format.html { redirect_to private_memories_url, notice: 'Private memory was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_private_memory
      @private_memory = PrivateMemory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def private_memory_params
      params.require(:private_memory).permit(:body, :name)
    end
end
