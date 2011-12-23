class HomeController < ApplicationController
  def index
     if client_signed_in?
      redirect_to works_path
    elsif worker_signed_in?
      redirect_to tasks_path
    end
  end
end
