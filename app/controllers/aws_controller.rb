class AwsController < ApplicationController
  before_action :set_aw, only: [:show, :edit, :update, :destroy]

  # GET /aws
  # GET /aws.json
  def index
    @aws = Aw.all
  end

  # GET /aws/1
  # GET /aws/1.json
  def show
  end

  # GET /aws/new
  def new
    @aw = Aw.new
  end

  # GET /aws/1/edit
  def edit
  end

  # POST /aws
  # POST /aws.json
  def create
    file_info = aw_params[:file]

    # file_directory = '/Users/ironyard/crg/aws/public/craig/'
    # new_file_path = file_directory + file_info.original_filename
    # File.open(new_file_path, "wb")  do |f|
    #   f.write(file_info.tempfile.read)
    # end



    @aw = Aw.new(aw_params)
    #@aw.update_attribute(:file, new_file_path)

    respond_to do |format|
      if @aw.save
        format.html { redirect_to @aw, notice: 'Aw was successfully created.' }
        format.json { render :show, status: :created, location: @aw }
      else
        format.html { render :new }
        format.json { render json: @aw.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /aws/1
  # PATCH/PUT /aws/1.json
  def update
    respond_to do |format|
      if @aw.update(aw_params)
        format.html { redirect_to @aw, notice: 'Aw was successfully updated.' }
        format.json { render :show, status: :ok, location: @aw }
      else
        format.html { render :edit }
        format.json { render json: @aw.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /aws/1
  # DELETE /aws/1.json
  def destroy
    @aw.destroy
    respond_to do |format|
      format.html { redirect_to aws_url, notice: 'Aw was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def download
    aws_file = Aw.find(params[:id])
    aws_downloaded_file = Paperclip.io_adapters.for(aws_file.uploaded_file)

    File.open(aws_downloaded_file.path, 'r') do |f|
      send_data(f.read,
                                                              :type => aws_file.uploaded_file_content_type,
                                                              :disposition => "inline",
                                                              :filename => aws_file.uploaded_file_file_name)
    end


    if File.exists?(aws_downloaded_file.path)
      File.delete(aws_downloaded_file.path)
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_aw
      @aw = Aw.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def aw_params
      params.require(:aw).permit(:file, :uploaded_file)
    end
end
