class Computer
    attr_accessor :sol_range
    def initialize
        @sol_range = (1111..6666).to_a
        @sol_range = sol_range - fltr_arr_with_num([7,8,9,0])
    end

    def generate_combination
        sol_range.sample
    end

    def fltr_arr_with_num(num_arr)
        filtered_arr = []
        num_arr.each do |num|
            arr_with_num = sol_range.select do |sol|
                sol.to_s.split("").map(&:to_i).any? {|sol_int| sol_int == num}
            end
            filtered_arr += arr_with_num
        end
        filtered_arr.uniq
    end
end

comp = Computer.new

puts comp.sol_range.length
