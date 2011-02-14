class RegistrationController < ApplicationController
  layout :determine_layout 

  def start 
     session[:registration_step] = 'start'
  end

  def step1 
     @step1 = RegistrationStep1Command.new
     @step1.name = 'test'
     if session[:registration_step] != 'start'
        redirect_to :action => 'start'
     else
     end
  end

  def step1_complete
     @step1 = RegistrationStep1Command.new(params[:registration_step1_command][:name])
     if @step1.valid? 
       session[:registration_step] != 'step2'
       redirect_to :action => 'step2'
     else 
       render :action => 'step1'
     end
  end

  def step2 
    render :text => 'this is step2'
  end

end


