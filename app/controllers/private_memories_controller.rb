class PrivateMemoriesController < ApplicationController
  before_action :set_private_memory, only: [:show, :edit, :update, :destroy]

  # GET /private_memories
  # GET /private_memories.json
  def index
    @private_memories = PrivateMemory.all
    authorize @private_memories
  end

  # GET /private_memories/1
  # GET /private_memories/1.json
  def show
  end

  # GET /private_memories/new
  def new
    @private_memory = PrivateMemory.new
    authorize @private_memory 
  end

  # GET /private_memories/1/edit
  def edit
  end

  # POST /private_memories
  # POST /private_memories.json
  def create
    @private_memory = PrivateMemory.new(private_memory_params)
    authorize @private_memory
    if verify_recaptcha(:model => @private_memory, :message => "Are you a robot? If you are indeed human, please verify below. :)")
      respond_to do |format|
        if @private_memory.save
          format.html { redirect_to @private_memory, notice: 'Thank you for sharing your memory of Brig!' }
          format.json { render :show, status: :created, location: @private_memory }
        else
          format.html { render :new }
          format.json { render json: @private_memory.errors, status: :unprocessable_entity }
        end
      end
    else
      render :new
    end
  end

  # PATCH/PUT /private_memories/1
  # PATCH/PUT /private_memories/1.json
  def update
    respond_to do |format|
      if @private_memory.update(private_memory_params)
        format.html { redirect_to @private_memory, notice: 'Your memory has been updated successfully.' }
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
    authorize @private_memory
    respond_to do |format|
      format.html { redirect_to private_memories_path, notice: 'Your memory has been deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_private_memory
      @private_memory = PrivateMemory.find(params[:id])
      authorize @private_memory
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def private_memory_params
      params.require(:private_memory).permit(:body, :name, :relationship, :image)
    end
end
