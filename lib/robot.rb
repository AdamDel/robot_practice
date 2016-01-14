class Robot
  attr_accessor :position, :items, :items_weight,  :health, :equipped_weapon
  def initialize
    @position = [0, 0]
    @items = []
    @items_weight = 0
    @health = 100
    @equipped_weapon = nil
  end

  def move_left
    @position[0] -= 1 
  end

  def move_right
    @position[0] += 1 
  end

  def move_up
    @position[1] += 1
  end
  def move_down
    @position[1] -= 1
  end

  def pick_up(item)

    weight = item.weight + @items_weight 
    #return false if weight > 250
    if weight <= 250
      @items << item
      @items_weight += item.weight
      
      # if item.class == BoxOfBolts 
      #   if health <= 80
      #     item.feed(self)
      #   end
      # end
      @items.each_with_index do |item, index| 
        if item.class == BoxOfBolts
          if health <= 80
            item.feed(self)
            @items.delete_at(index)
          end
      end  
    end

      # puts @items
      # if @items.include? BoxOfBolts && @health <= 80
      #   item.feed(self)
      # end

      
      if item.is_a? Weapon
         @equipped_weapon = item
      end
      
      return item
    end
    
  end

  def wound(damage)
    @health -= damage
    @health = 0 if @health < 0 
  end

  def heal(amount)
    @health += amount
    @health = 100 if @health > 100
  end

  def heal!(amount)
    if @health == 0
      raise HealException, "robot already dead"
    else
      heal(amount)
    end
  end

  def attack(robot)
    vertical_space = (self.position[1] - robot.position[1]).abs
    horizontal_space = (self.position[0] - robot.position[0]).abs
    
    if equipped_weapon.class == Grenade
      return false if vertical_space > 2 || horizontal_space > 2
      return false if vertical_space == 2 && horizontal_space ==2
    else
      return false if vertical_space > 1 || horizontal_space > 1
      return false if vertical_space == 1 && horizontal_space ==1
    end

    if @equipped_weapon
      @equipped_weapon.hit(robot)
      if @equipped_weapon.class == Grenade
        @items_weight -= @equipped_weapon.weight
        @equipped_weapon = nil
      end
    else
      robot.wound(5)
    end
  end
  def attack!(robot)
    if robot.class != Robot
      raise InvalidAttack, "not a robot"
    else
      attack(robot)
    end
  end

end

class HealException < StandardError
end


class InvalidAttack < StandardError
end





