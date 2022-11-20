class LogsController < ApplicationController
   
  def index
    @logs = Log.all
  end

  def show; 
  end
end