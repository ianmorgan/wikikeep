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
     @registration_step1_command = RegistrationStep1Command.new(params[:registration_step1_command])
     if @registration_step1_command.valid? 
       session[:registration_data][:step1] = @registration_step1_command 
       move_to_step 'step2'
     else 
       render  :action => 'step1'
     end
  end

  def step2
     if session[:registration_step] != 'step2'
        redirect_to current_step 
     else
        @registration_step2_command = RegistrationStep2Command.new()
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
        @registration_step3_command = RegistrationStep3Command.new()
     end
  end

  def step3_complete
     submitted = params[:registration_step3_command]
     @registration_step3_command = RegistrationStep3Command.new(submitted)
     if @registration_step3_command.valid? 
       session[:registration_step] = 'step3'
       session[:registration_data][:step3] = @registration_step3_command
       redirect_to :action => 'complete'
     else 
       render  :action => 'step2'
     end
  end

  def complete 
     attrs = session[:registration_data][:step1].attributes
     attrs = attrs.merge(session[:registration_data][:step2].attributes)
     attrs = attrs.symbolize_keys
     result = RegistrationService.new.create_account attrs 
     add_default_content_pages (attrs[:account_name])
  end




private 
  def current_step
    session[:registration_step] ? session[:registration_step] : 'start'
  end

  def move_to_step(step)
     session[:registration_step] = step 
     redirect_to :action => step 
  end
  
  def add_default_content_pages(account_name) 
    service = ContentService.new
    
    new_account_id = Account.find_by_name(account_name).id
    system_user_id = 4
    
    content = Hash.new
    content[:name] = 'Welcome'
    content[:content] = read_content_template('welcome')
    content[:tags] = "Wikikeep"
    result = service.add_content(new_account_id, system_user_id, content)
    
  end


end


