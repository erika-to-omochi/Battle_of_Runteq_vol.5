class PhinaController < ApplicationController
  skip_before_action :require_login
  def js
  end
end
