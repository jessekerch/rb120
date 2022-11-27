class Minilang
  attr_accessor :stack, :register, :program
  OPERANDS = {'ADD' => :+, 'SUB' => :-, 'MULT' => :*, 'DIV' => :/, 'MOD' => :%}

  def initialize(program)
    @program = program.split
    @register = 0
    @stack = []
  end
  
  def eval
    program.each do |command|
      case
      when command.to_i.to_s == command
        @register = command.to_i
      when %w(ADD SUB MULT DIV MOD).include?(command)
        calculate(command)
      when command == 'PUSH'
        push_register
      when command == 'POP'
        pop_stack
      when command == 'PRINT'
        print_register
      else
        invalid_token_error(command)
      end
    end
  end
  
  private
  
  def calculate(operand)
    self.register = [register, stack.pop].reduce(OPERANDS[operand])
  end
  
  def push_register
    @stack << register
  end
  
  def pop_stack
    unless stack.empty?
      self.register = stack.pop
    else
      puts "Empty stack!"
      return
    end
  end
  
  def print_register
    p register
  end
  
  def invalid_token_error(command)
    puts "Invalid token: #{command}"
    return
  end
end
  

# Minilang.new('PRINT').eval
# # 0

# Minilang.new('5 PUSH 3 MULT PRINT').eval
# # 15

# Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval
# # 5
# # 3
# # 8

# Minilang.new('5 PUSH 10 PRINT POP PRINT').eval
# # 10
# # 5

# Minilang.new('5 PUSH POP POP PRINT').eval
# # # Empty stack!

# Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
# # # 6

# Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
# # # 12

Minilang.new('-3 PUSH 5 XSUB PRINT').eval
# # Invalid token: XSUB

# Minilang.new('-3 PUSH 5 SUB PRINT').eval
# # 8

# Minilang.new('6 PUSH').eval
# # # (nothing printed; no PRINT commands)