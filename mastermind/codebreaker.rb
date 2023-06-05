class CodeBreaker
    attr_accessor :name, :guess_history
    def initialize(input_name)
        @guess_history = []
        @name = input_name
    end
end
