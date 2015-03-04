class Api::V1::CsrfController < ApplicationController
  def index
    puts "HELLO HELLO"
    puts "HELLO HELLO"
    puts "HELLO HELLO"
    render json: { request_forgery_protection_token => form_authenticity_token }.to_json
  end
end
