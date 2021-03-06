class MimiController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    redirect_to new_mimus_path
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
    if params["globbed_path"]
      match_data = params["globbed_path"].match(/(\d{9,11}\b)/)
      capture = match_data&.captures&.first

      redirect_to new_mimus_path and return unless capture.present?
      @mimus = Mimus.find_by(unique_hash: capture)
    else
      @mimus = Mimus.find_by(unique_hash: (params[:id]))
    end

    render plain: @mimus.content
  end

  private

  def mimus_params
    params.require(:mimus).permit(:content)
  end
end
