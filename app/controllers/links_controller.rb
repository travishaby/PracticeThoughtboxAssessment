class LinksController < ApplicationController
  def index
    @links = Link.all
  end

  def create
    @link = Link.new(link_params)
    unless @link.save
      flash.now[:error] = "Link creation unsuccessful: #{@link.errors}"
    end
    redirect_to links_path
  end

  private

  def link_params
    params.require(:link).permit(:url,
                                 :title)
  end
end
