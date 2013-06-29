module ApplicationHelper

  def frets
    (0..12).map do |f|
      case f
      when 3, 5, 7, 9 then '&bull;'
      when 12 then '&bull;&bull;'
      else ''
      end
    end
  end

end
