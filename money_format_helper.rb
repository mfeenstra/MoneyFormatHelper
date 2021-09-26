#!/usr/bin/env ruby
# matt.a.feenstra@gmail.com
# Licensed under GPLv3, all rights reserved.

class MoneyFormatHelper

  # with_commas() -> requires a large float or int and returns the same with commas as
  #                  a string,
  #                    ie: MoneyFormatHelper::with_commas(-10000.00) = "-10,000.00"

  def self.with_commas(big_number)
    big_number = big_number.to_s.tr(',','')
    if big_number =~ /^(-?)([0-9]+)\.([0-9]+)$/ then
      sign = $1; whole_number = $2; fraction = $3
      bignum_ary = whole_number.to_s.chars
    elsif big_number =~ /^(-?)([0-9]+)$/ then
      sign = $1
      bignum_ary = $2.to_s.chars
    else
      raise "bad value: #{big_number}"
    end
  
    new_ary = []
    bignum_ary.reverse.each.with_index(1) do |d, i|
      if (i != bignum_ary.size) && (i % 3 == 0) then
        new_ary << ",#{d}"
      else
        new_ary << d
      end
    end
  
    if sign == '-' then new_ary << '-' end
    unless fraction.nil? then
      "#{new_ary.reverse.join}.#{fraction}"
    else
      new_ary.reverse.join
    end
  
  end
  
  # zeropad() -> requires a decimal float with less than @pad_places (2) digits to the right
  #              of the period, returns a string with zeros in the desired digits. Useful for
  #              money,
  #                ie: MoneyFormatHelper::zeropad(-1.5) = "-1.50"
  
  def self.zeropad(decimal_num)
    return decimal_num unless decimal_num.to_s.match?(/\./)
  
    @pad_places = 2
    decimal_num = decimal_num.to_s.tr(',','')
    if decimal_num =~ /^(-?)([0-9]+)\.([0-9]+)$/ then
      sign = $1; whole_number = $2; decimal = $3.chars
  
      if decimal.size < @pad_places then
       decimal << '0'
      end
    else
      return decimal_num
    end
  
    "#{sign}#{whole_number}.#{decimal.join}"
  end

end # MoneyFormatHelper
