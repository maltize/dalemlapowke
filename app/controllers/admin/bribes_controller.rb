class Admin::BribesController < Admin::BaseController

  PER_PAGE = 10

  def index
    @bribes = Bribe.order('id DESC').paginate(
      :page     => params[:page],
      :per_page => PER_PAGE
    )
  end

  def validate
    @bribe = Bribe.find(params[:id])
    @bribe.valid!

    redirect_to admin_bribes_path
  end

end
