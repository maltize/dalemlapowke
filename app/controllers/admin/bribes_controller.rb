class Admin::BribesController < Admin::BaseController

  PER_PAGE = 10

  def valid
    @bribes = Bribe.valid.order('id DESC').paginate(
      :page     => params[:page],
      :per_page => PER_PAGE
    )

    render :index
  end

  def not_valid
    @bribes = Bribe.not_valid.order('id DESC').paginate(
      :page     => params[:page],
      :per_page => PER_PAGE
    )
    render :index
  end

  def index
    @bribes =  Bribe.order('id DESC').paginate(
      :page     => params[:page],
      :per_page => PER_PAGE
    )
  end

  def update
     @bribe = Bribe.find params[:id]

    respond_to do |format|
      if @bribe.update_attributes(params[:bribe])
        format.html { redirect_to(@bribe, :notice => 'Zmiany zapisane pomyslnie!') }
        format.json { respond_with_bip(@bribe) }
      else
        format.html { render :action => "edit" }
        format.json { respond_with_bip(@bribe) }
      end
    end
  end

  def perform
    @bribe = Bribe.find(params[:id])
    params[:v].present? ? @bribe.valid! : @bribe.unvalid!

    redirect_to :back
  end

end
