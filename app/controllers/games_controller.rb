class GamesController < ApplicationController
  skip_before_action :require_login, only: [:shooting, :prologue, :index]
  before_action :set_phina_js, only: [:shooting, :prologue]

  def index
  end

  def shooting
  end

  def prologue
  end

  private

  def set_phina_js
    @use_phina_js = true
  end
end