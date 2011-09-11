class BaseStepController < ApplicationController



protected 
  def session_key
    :registration_step
  end 

  def current_step
    session[session_key] ? session[session_key] : 'start'
  end

  def move_to_step(step)
     session[session_key] = step 
     redirect_to :action => step 
  end

end


