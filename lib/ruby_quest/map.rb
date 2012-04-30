module RubyQuest

  class Map
    require 'ruby_quest/output'

    attr_reader :output, :current

    def initialize(output = Output.new)
      @output = output
    end

    def travel place
      #if Place.find(place)
      self.current = place
      #else
      #output.error "#{place} is not a valid place. Type 'map' to list all available places"
    end

    def list
      message = ""
      places.each_with_index do |place, i|
        message << "#{i + 1}. #{place.name}"
      end
      output.action message
    end

    def add place
      places.push place
    end

    private

    def current= place
      if current == place
        message = "You already are in #{place.name}"
      elsif on_map? place
        @current = place 
        message = "You have reached the #{place.name}"
      else
        message = "#{place.name.capitalize} is not on your map. Type 'map' to list all available places"
      end
      output.action message
    end

    # In the future needs to be a tree
    def places
      @places ||= []
    end

    def on_map? place
      places.include? place
    end

  end

end
