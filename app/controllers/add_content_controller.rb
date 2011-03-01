class AddContentController < ApplicationController
 layout :determine_layout 

  def start 
     session[:add_content_step] = 'start'
     session[:add_content_data] = Hash.new
  end

  def step1 
     if session[:add_content_step] != 'start'
        redirect_to :action => 'start'
     else
        @add_content_step1_command = AddContentStep1Command.new
     end
  end

  def step1_complete
     @add_content_step1_command = AddContentStep1Command.new(params[:add_content_step1_command])
     if @add_content_step1_command.valid? 
       session[:add_content_data][:step1] = @add_content_step1_command 
       move_to_step 'step2'
     else 
       render  :action => 'step1'
     end
  end

end
