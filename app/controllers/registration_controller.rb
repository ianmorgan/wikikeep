class RegistrationController < ApplicationController
  layout :determine_layout 

  def start 
     session[:registration_step] = 'start'
  end

  def step1 
     @registration_step1_command = RegistrationStep1Command.new
     if session[:registration_step] != 'start'
        redirect_to :action => 'start'
     else
     end
  end

  def step1_complete
     @registration_step1_command = RegistrationStep1Command.new(params[:registration_step1_command][:name])
     if @registration_step1_command.valid? 
       session[:registration_step] != 'step2'
       redirect_to :action => 'step2'
     else 
       render  :action => 'step1'
     end
  end

  def step2 
    render :text => 'this is step2'
  end

end


