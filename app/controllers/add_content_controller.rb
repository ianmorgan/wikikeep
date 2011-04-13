class AddContentController < BaseStepController
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


  def step2
     if session[:add_content_step] != 'step2'
        redirect_to current_step 
     else
        @add_content_step2_command = AddContentStep2Command.new()
     end
  end

  def step2_complete
     submitted = params[:add_content_step2_command]
     @add_content_step2_command = AddContentStep2Command.new(submitted)
     if @add_content_step2_command.valid? 
       session[:add_content_step] = 'step3'
       session[:add_content_data][:step2] = @add_content_step2_command
       redirect_to :action => 'step3'
     else 
       render  :action => 'step2'
     end
  end

  def step3
     if session[:add_content_step] != 'step3'
        redirect_to current_step 
     else
        @add_content_step3_command = AddContentStep3Command.new()
     end
  end

  def step3_complete
     submitted = params[:add_content_step3_command]
     @add_content_step3_command = AddContentStep3Command.new(submitted)
     if @add_content_step3_command.valid? 
       session[:add_content_step] = 'step3'
       session[:add_content_data][:step3] = @add_content_step3_command
       redirect_to :action => 'complete'
     else 
       render  :action => 'step2'
     end
  end

  def complete 
     attrs = session[:add_content_data][:step1].attributes
     attrs = attrs.merge(session[:add_content_data][:step2].attributes)
     attrs = attrs.merge(session[:add_content_data][:step3].attributes)
     attrs = attrs.symbolize_keys    	
     service = ContentService.new
     result = service.add_content(account_id, user_id, attrs)
     redirect_to  :account_name => account_name, :controller => 'content', :action => 'view', :id => result
#     else
#	render :action => "add" 
#     end
#     result = RegistrationService.new.create_account attrs 
  end

protected
  def session_key
    :add_content_step
  end 


end
