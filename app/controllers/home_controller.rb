class HomeController < ApplicationController
  require "prawn"

  def index
  end

  def generate_cube
    Prawn::Document.generate("hello.pdf") do
      text "Hello World!"
    end
  end
end
