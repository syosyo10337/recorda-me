module ItemHelper
  COLORS = %w[#D896AD #ECA2A3 #F1B996 #F6D699 #E3DE9A #A6D29A #93C7B7 #92BFC7 #90B0CA #B5A4C7 #B5A4C7 #C59DBB]

  # itemを引数に取り, userがもつ何個目のitemであるかを返す。(1-based index)
  def item_num(item)
    user_items = item.user.items.get_fixed_order
    user_items.pluck(:id).find_index(item.id) + 1
  end

  def item_color(item)
    item_number = item_num(item)
    COLORS[item_number - 1]
  end
end
