class User < ActiveRecord::Base

  has_many :friendships_requested, class_name: "Friendship", foreign_key: :user_id
  has_many :friendees, through: :friendships_requested, source: :friendee

  has_many :friendships_received, class_name: "Friendship", foreign_key: :friendee_id
  has_many :frienders, through: :friendships_received, source: :user

  has_many :lists
  has_many :list_items, through: :lists

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def accepted_friendships
    friendships_requested.confirmed + friendships_received.confirmed
  end

  def friends
    accepted_friendships.inject([ ]) { |friends_array, friendship| friends_array << friendship.find_friend_of(self) }
  end

  def find_friendship_by_friend_id(id)
    friendships_received.where("user_id = ?", id) + friendships_requested.where("friendee_id = ?", id)
  end

  def items
    lists.current.inject([ ]) { |items_array, list| items_array + list.list_items }
  end

  def friend_items
    friends.inject([ ]) { |items_array, friend| items_array + friend.items  }
  end

  def total_items
    items + friend_items
  end

  def total_items_summed
    item_hash = { }
    total_items.each do |item|
      if item_hash.has_key?(item.food.name)
        item_hash[item.food.name][:item_list] << item
        item_hash[item.food.name][:total_amount] += item.amount
      else
        item_hash[item.food.name] = { }
        item_hash[item.food.name][:item_list] = [item]
        item_hash[item.food.name][:total_amount] = item.amount
      end
    end

    item_hash
  end

  def total_items_with_bulk
    item_hash = total_items_summed

    item_hash.each do |item_name, item_attributes|
      food = Food.find_by( name: item_name )
      bulk = Bulk.find_by(food: food)
      item_hash[item_name][:bulk_amount] = bulk.amount
      item_hash[item_name][:bulk_price]  = bulk.price
      item_hash[item_name][:bulk_total_amount] = ((item_hash[item_name][:total_amount]/bulk.amount) + 1).to_i
      item_hash[item_name][:bulk_total_price] = bulk.price * item_hash[item_name][:bulk_total_amount]
    end

    item_hash
  end

  def items_aggregated_json
    item_hash = total_items_with_bulk

    binding.pry

    item_hash.each do |item_name, item_attributes|
      item_attributes[:item_list].map { |item| item.as_json }
    end

    item_hash
  end

  def recommendations
    item_hash = total_items_with_bulk

    item_hash.each do |item_name, item_attributes|
      item_attributes[:item_list].each do |item|
        item.portion = (item.amount.to_f / item_attributes[:total_amount]).to_f

        item.share = item.portion * item_attributes[:bulk_total_amount] * item_attributes[:bulk_amount]

        item.contribution = item.portion * item_attributes[:bulk_total_price]
      end
    end

    item_hash
  end

end
