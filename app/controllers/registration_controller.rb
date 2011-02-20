class RegistrationController < ApplicationController
  layout :determine_layout 

  def start 
     session[:registration_step] = 'start'
     session[:registration_data] = Hash.new
  end

  def step1 
     if session[:registration_step] != 'start'
        redirect_to :action => 'start'
     else
        @registration_step1_command = RegistrationStep1Command.new
     end
  end

  def step1_complete
     @registration_step1_command = RegistrationStep1Command.new(params[:registration_step1_command][:account_name])
     if @registration_step1_command.valid? 
       session[:registration_step] = 'step2'
       session[:registration_data][:step1] = @registration_step1_command 
       redirect_to :action => 'step2'
     else 
       render  :action => 'step1'
     end
  end

  def step2
     if session[:registration_step] != 'step2'
        redirect_to current_step 
     else
        @registration_step2_command = RegistrationStep2Command.new('test')
     end
  end

  def step2_complete
     submitted = params[:registration_step2_command]
     @registration_step2_command = RegistrationStep2Command.new(submitted)
     if @registration_step2_command.valid? 
       session[:registration_step] = 'step3'
       session[:registration_data][:step2] = @registration_step2_command
       redirect_to :action => 'step3'
     else 
       render  :action => 'step2'
     end
  end

  def step3
     if session[:registration_step] != 'step3'
        redirect_to current_step 
     else
        @registration_step3_command = RegistrationStep2Command.new('test')
     end
  end



private 
  def current_step
    session[:registration_step] ? session[:registration_step] : 'start'
  end


end


