class SizeGroupController < ApplicationController
  def show
    @sizes = Size.where(size_group: params[:id])
  end
end
