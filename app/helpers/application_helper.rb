module ApplicationHelper

  def format_description(text, expanded)
    expanded ? text : truncate(text, :length => 80, :separator => ' ').html_safe
  end

  def render_chart_js(name, what)
    render :partial => 'chart/pie',
           :locals => { :name => name, :what => what }
  end

  def current_uri
    "#{request.protocol}#{request.host_with_port}#{request.fullpath}"
  end

end
