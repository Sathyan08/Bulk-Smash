class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #1 Generate models for: Grocery_lists, Foods, Grocery_list_item

#2 Grocery lists
  # user_id
  # grocery_list_item_id
  # date comes later

#3 Foods
  # name
  # category comes later
  # life-span comes later

#4 Grocery_List_item
  # food_id
  # quantity
  # units

#5 define a user method "list_items" to pull the grocery list for a particular user

  def list_items
    grocery_list.grocery_list_items
  end

#6 define a method to get all friends grocery list items

  def friends_items
    items = []

    friends.each do |friend|
      friend.list_items.each do |item|
        items << item
      end
    end
  end

#7 define a method to compare to match each list items
  def match_items
    matches = []

    list_items.each do |item|
      match = []

      friends_items.each do |friend_item|
        if friend_item.name == item.name
          match << friend_item
        end
      end

      match << item
      matches << match
    end

    matches
  end

#8 write a method for aggregating the items

  def aggregate
    aggregated = []

    match_items.each do |match|
      summed = {}
      summed[:name] = match[0].name
      summed[:total] = match.inject { |sum, n| sum + n.quanta }
      summed[:proportions] = []

        match.each do |item|
          share = {}
          share[:user] = item.user
          share[:proportion] = item.quanta.to_f/summed[:total].to_f
          summed[:proportions] << share
        end

      aggregated << summed
    end

    aggregated
  end

#9 create model for possible bulk purchasing quanta

  #Bulk
    #food_id
    #bulk_quanta
    #bulk_price

#10 find bulk purchase totals

  def bulk_purchases_total
    summed_up = aggregated #self.aggregated?

    summed_up.each do |summed|
      food = Food.find_by(name: summed[:name]
      bulk = Bulk.find_by(food_id: food.id)
      summed[:bulks] = ((summed[:total].to_f/bulk.bulk_quanta.to_f) + .5).to_i # rounds the number
      summed[:bulk_price] = bulk.price
      summed[:proportions].each_do |share|
        share[:contribution] = share[:proportion] * summed[:bulk_price] * summed[:bulks]
      end
    end

    summed_up
  end

  #11 make actual recommendations

  def recommendations
    bulk_purchases_total[:proportions]
  end
end
