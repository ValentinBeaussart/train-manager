# frozen_string_literal: true

class ApplicationController < ActionController::API # rubocop:disable Style/Documentation
  before_action :clear_expired_blocked_station_platforms

  private

  def clear_expired_blocked_station_platforms
    return unless session[:blocked_station_platforms]

    now = Time.now
    session[:blocked_station_platforms].delete_if { |_station_platform, blocked_until| blocked_until <= now }
  end
end
