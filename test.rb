
sol_range = (1111..6666).to_a

arr_with_num = sol_range.select do |sol|
    sol.to_s.split("").map(&:to_i).any? {|sol_int| sol_int == 7 or sol_int == 8 or sol_int == 9 or sol_int == 0}
end

puts (sol_range - arr_with_num.uniq).length
