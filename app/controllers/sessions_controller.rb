class SessionsController < ApplicationController
  def switch_color
    session[:color_scheme] =case session[:color_scheme]
                            when :dark then :light
                            when :light then :dark
                            else :dark
                            end
    render :json => true
  end

end
