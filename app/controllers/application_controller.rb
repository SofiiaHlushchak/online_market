class ApplicationController < ActionController::Base
  
  def render_403
    render file: 'public/403.html', status: :forbidden
  end

  def render_404
    render file: 'public/404.html'
  end 

  def admin?
    render_403 unless params[:admin]
    # render json: 'Access denied', status: :forbidden unless params[:admin]
  end
end
