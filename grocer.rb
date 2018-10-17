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
  
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
