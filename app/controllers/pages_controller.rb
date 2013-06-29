class PagesController < ApplicationController

  def landing
    @fret_board = FretBoard.new
  end

end
