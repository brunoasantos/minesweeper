module ApplicationHelper
  def print_cell(cell, x, y)
    case cell
    when 0
      '-'
    when 'mine'
      button_tag ' ', value: "#{x},#{y}", name: :xy
    when nil
      button_tag ' ', value: "#{x},#{y}", name: :xy
    else
      cell
    end
  end
end
