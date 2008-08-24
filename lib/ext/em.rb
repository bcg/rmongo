begin
  require 'eventmachine'
rescue LoadError
  require 'rubygems'
  require 'eventmachine'
end

# copied from EM trunk, will be removed when 0.12.1 is released
if EM::VERSION < '0.12.1'
    
  def EventMachine::run blk=nil, tail=nil, &block
    @tails ||= []
    tail and @tails.unshift(tail)

    if reactor_running?
      (b = blk || block) and b.call # next_tick(b)
    else
      @conns = {}
      @acceptors = {}
      @timers = {}
      begin
        @reactor_running = true
        initialize_event_machine
        (b = blk || block) and add_timer(0, b)
        run_machine
      ensure
        release_machine
        @reactor_running = false
      end

      until @tails.empty?
        @tails.pop.call
      end
    end
  end

end