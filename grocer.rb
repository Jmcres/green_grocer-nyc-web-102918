def consolidate_cart(cart)
 newHash = {}
  cart.each do |food, info|
      food.each do |a,b|
        if newHash[a]== nil
          newHash[a]={price: b[:price], clearance: b[:clearance], count: 1}
        else
          newHash[a][:count]+=1
        end
      end
  end
  return newHash
end


def apply_coupons(cart, coupons)
    coupons.each do |coupon_hash|
    fruit_name = coupon_hash[:item]
    new_coupon_hash = {
      :price => coupon_hash[:cost],
      :clearance => "true",
      :count => coupon_hash[:num]
    }
    
     if cart.key?(fruit_name)
      new_coupon_hash[:clearance] = cart[fruit_name][:clearance]
      if cart[fruit_name][:count]>= new_coupon_hash[:count]
        new_coupon_hash[:count] = (cart[fruit_name][:count]/new_coupon_hash[:count]).floor
        cart[fruit_name][:count] = (coupon_hash[:num])%(cart[fruit_name][:count])
      end
      cart[fruit_name + " W/COUPON"] = new_coupon_hash 
    end
    end
  return cart
end


def apply_clearance(cart)
 	cart.reject{|hash,info| info[:clearance]==false}.collect{|hash,info| info[:price]=((info[:price]*1.8)-info[:price]).round(1)}
  return cart
end

def checkout(cart, coupons)
  # code here
end
