class AccountActivationsController < ApplicationController

   def edit
    user = User.find_by(email: params[:email])
    if user && !user.activated? && user.authenticated?(:activation, params[:id])
      user.activate
      log_in user
      flash[:success] = "Account activated!"
      redirect_to user
    else
      flash[:danger] = "Invalid activation link"
      redirect_to root_url
    end
  end

end


##https://u1710474.ct.sendgrid.net/wf/click?upn=7PQ-2FD02qOrPNMCYvxIPi2XEhwKMnXugbtNMRS-2BCQK6bNCxpsJXuS5k-2FtVBHaP7ea5o-2FjOigEwtwzOQnPV6Ia5zu0tXMeEPNxiyin1j1-2BX1MZ8VO4Y-2FNf2s-2FIBM7bRukHJsGzknm-2Fy73jdW63ds7JkZEciLPs2ramWgEQvpfMMcP3GUGIrcDtiubtYaPezPRZ_KaJ3w6ElH-2BIMEUzMjyek76ZKGPSXObBjfPEPvGG50SZNpRdX1hIP-2FQclTf-2BmztlKnaTrVlLqkHrXzvpmiYXJwa9Owkgs-2F5K-2F4UdFKJpRXuBVPuFzAdNtThmDxNZ2eN6RFxagezRZtB5Xzg7Zjf8AZCRjZTuQMHuCtI5WEDQ-2B1ZySFUh0EOyLIxm26647n5UzXukuIt4kBbAWR-2B0H6hZCPqYvDzkki0jx4Cvs0sSGZ88-3D
