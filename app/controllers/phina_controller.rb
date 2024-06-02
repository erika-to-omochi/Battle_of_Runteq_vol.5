class PhinaController < ApplicationController
  skip_before_action :require_login
  def js
    send_file Rails.root.join('app', 'assets', 'javascripts', 'phina.js'), type: 'application/javascript', disposition: 'inline'
  end
end
