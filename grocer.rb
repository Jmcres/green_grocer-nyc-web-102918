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


def apply_coupons(cart:[], coupons:[])
  coupons.each do |coupon|
    if cart.has_key?(coupon[:item]) && cart[coupon[:item]][:count]/coupon[:num] > 0
      cart["#{coupon[:item]} W/COUPON"] = {}
      cart["#{coupon[:item]} W/COUPON"][:price] = coupon[:cost]
      cart["#{coupon[:item]} W/COUPON"][:clearance] = cart[coupon[:item]][:clearance]
      cart["#{coupon[:item]} W/COUPON"][:count] = cart[coupon[:item]][:count]/coupon[:num]

      #if cart[coupon[:item]][:count]%coupon[:num] == 0
        #cart.delete(coupon[:item])
      #else
        cart[coupon[:item]][:count] = cart[coupon[:item]][:count]%coupon[:num]
      #end
    end
  end
  cart
end


def apply_clearance(cart)
 	
end

def checkout(cart, coupons)
  # code here
end
