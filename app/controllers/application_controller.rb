# encoding: UTF-8
class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :page_title

private

  def page_title
    "Dałem Łapówkę - dalemlapowke.pl"
  end

end
