module ApplicationHelper

  def format_description(text, bribe, expanded)
    if expanded
      text
    else
      link = link_to('... (czytaj)', bribe_path(bribe))
      truncate(text, :length => 110, :separator => ' ', :omission => link).html_safe
    end
  end

  def render_chart_js(name, what)
    render :partial => 'chart/pie',
           :locals => { :name => name, :what => what }
  end

end
