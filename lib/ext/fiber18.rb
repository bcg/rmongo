# Poor Man's Fiber (API compatible Thread based Fiber implementation for Ruby 1.8)
# (c) 2008 Aman Gupta (tmm1)

unless defined? Fiber
  require 'thread'

  class FiberError < StandardError; end

  class Fiber
    def initialize
      raise ArgumentError, 'new Fiber requires a block' unless block_given?

      @yield = Queue.new
      @resume = Queue.new

      @thread = Thread.new{ @yield.push [ *yield(*@resume.pop) ] }
      @thread.abort_on_exception = true
      @thread[:fiber] = self
    end
    attr_reader :thread

    def resume *args
      raise FiberError, 'dead fiber called' unless @thread.alive?
      @resume.push(args)
      result = @yield.pop
      result.size > 1 ? result : result.first
    end
    
    def yield *args
      @yield.push(args)
      result = @resume.pop
      result.size > 1 ? result : result.first
    end
    
    def self.yield *args
      raise FiberError, "can't yield from root fiber" unless fiber = Thread.current[:fiber]
      fiber.yield(*args)
    end

    def self.current
      Thread.current[:fiber] or raise FiberError, 'not inside a fiber'
    end

    def inspect
      "#<#{self.class}:0x#{self.object_id.to_s(16)}>"
    end
  end
end

if __FILE__ == $0
  f = Fiber.new{ puts 'hi'; p Fiber.yield(1); puts 'bye'; :done }
  p f.resume
  p f.resume(2)
end

__END__

$ ruby fbr.rb 
hi
1
2
bye
:done

$ ruby1.9 fbr.rb 
hi
1
2
bye
:done
