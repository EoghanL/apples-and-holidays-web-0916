require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  holiday_hash[:winter].each { |key, value| value << supply }
end


def add_supply_to_memorial_day(holiday_hash, supply)
  holiday_hash[:spring][:memorial_day] << supply
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  holiday_hash.each do |key, value|
    if season == key
      holiday_hash[season][holiday_name] = supply_array
    end
  end
end

def all_winter_holiday_supplies(holiday_hash)
  return_arr = []
  holiday_hash[:winter].values.collect { |supply| return_arr << supply }
  return_arr.flatten
end

def all_supplies_in_holidays(holiday_hash)
  holiday_hash.each do |key, value|
    puts "#{key.to_s.capitalize}:"
      value.each do |k_1, v_1|
        if k_1.to_s.include?("_")
          k_1_arr = k_1.to_s.split "_"
          k_1_arr.each { |str| str.capitalize! }
          puts "  #{k_1_arr.join(" ")}: #{v_1.join(", ")}"
        else
          puts "  #{k_1.capitalize}: #{v_1.join(", ")}"
        end
      end
    end
end

def all_holidays_with_bbq(holiday_hash)
  bbq_hols = []
  holiday_hash.values.collect do |key, value|
    key.each do |k, v|
      bbq_hols << k if v.any? { |va| va == "BBQ" }
    end
  end
  bbq_hols
end
