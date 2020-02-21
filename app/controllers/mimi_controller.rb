class MimiController < ApplicationController
  def index
    @mimi = Mimus.all
  end

  def new
    @mimus = Mimus.new
  end

  def create
    @mimus = Mimus.new(mimus_params)

    @mimus.save

    if "Unique hash has already been taken".in? @mimus.errors.full_messages
      @mimus = Mimus.find_by(unique_hash: @mimus.unique_hash)
    end

    redirect_to @mimus
  end

  def show
    @mimus = Mimus.find_by(unique_hash: (params[:id]))

    render plain: @mimus.content
    #respond_to do |format|
      #format.html { render json: @mimus.content }
      #format.json { render json: @mimus.content }
    #end
  end

  private

  def mimus_params
    params.require(:mimus).permit(:content)
  end
end
