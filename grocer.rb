def consolidate_cart(cart)
  # code here
  hash = Hash.new(0)
  cart.each do |item|
    item.each do |key, value|
      hash[key] += 1 
    end
  end
  hash.each do |item, count|
    cart.each do |items|
      items.each do |key, value|
        if key == item
          value[:count] = count
        end
      end
    end
  end
  array = cart.uniq
  new_hash = {}
  array.each do |item|
    item.each do |key, value|
      new_hash[key] = value
    end
  end
  new_hash
end

def apply_coupons(cart, coupons)
  count = 0 
  count_coupon = 0 
  name = ""
  cart.each do |item, detail|
    if item == coupons[:item]
      count_coupon = detail[:count] / coupons[:num]
      count = detail[:count] % coupons[:num]
      detail[:count] = count 
      name = "#{item} W/COUPON"
      detail[:count] = count
      cart[name] = {:price => count_coupon * coupons[:cost], :clearance => true, :count => count_coupon}} 
    end
  end
  cart
  # code here
end


def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
