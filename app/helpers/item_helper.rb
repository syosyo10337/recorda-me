module ItemHelper

  # itemを引数に取り,userがもつ何個目のitemであるかを返す。(1-origin)
  def item_num(item)
    @items.pluck(:id).find_index(item.id) + 1
  end
end
