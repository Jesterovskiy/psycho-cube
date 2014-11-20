class HomeController < ApplicationController
  require "prawn"

  def index
  end

  def generate_cube
    name = 'public/Cube_' + SecureRandom.hex(4).to_s + '.pdf'
    path = Rails.root.join('public').to_s + view_context.image_path('Cube_pattern.jpg').to_s
    cube = params[:cube]

    Prawn::Document.generate(name) do
      image path, :scale => 0.23
      text_box(cube[:field1],
        :at => [230, 670], :height => 100, :width => 100
      )
      text_box(cube[:field2],
        :at => [230, 500], :height => 100, :width => 100
      )
      text_box(cube[:field3],
        :at => [230, 320], :height => 100, :width => 100
      )
      text_box(cube[:field4],
        :at => [70, 250], :rotate => 90, :height => 100, :width => 100
      )
      text_box(cube[:field5],
        :at => [480, 350], :rotate => 270, :height => 100, :width => 100
      )
      text_box(cube[:field6],
        :at => [320, 100], :rotate => 180, :height => 100, :width => 100
      )
    end

    send_file Rails.root.join(name)
  end
end
