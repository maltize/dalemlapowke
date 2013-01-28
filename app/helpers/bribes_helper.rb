module BribesHelper

  def options_for(empty_title, what)
    options_for_select(
      [[empty_title, 0]] + what.humanize.constantize.options,
      instance_variable_get("@#{what}").try(:id)
    )
  end

end
