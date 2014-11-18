class HomeController < ApplicationController
  require "prawn"

  def index
  end

  def generate_cube
    name = 'public/Cube_' + SecureRandom.hex(4).to_s + '.pdf'
    path = view_context.image_path('Cube_pattern.jpg')
    Prawn::Document.generate(name) do
      image path
    end
    send_file Rails.root.join(name)
  end
end
