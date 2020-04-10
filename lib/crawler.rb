#require 'ruby-graphviz'

module Crawler

  class Worker



    def initialize(base_keyword, letter, final)
      @alphabet = ('a'..'z').to_a
      @sleeptime = rand(0.4..1.1)
      @first_keywords = []
      @keywords = []
      @base_keyword = base_keyword
      @letter = letter
      @final = final
      #@graph = graph
    end

    def start



      # Create two nodes
      #base = @graph.add_nodes( @base_keyword )

      #base_plus_letter = @graph.add_nodes( "#{@base_keyword} #{@letter}" )

      # Create an edge between the two nodes
      #@graph.add_edges( base, base_plus_letter )


      first_level_search

      second_level_search






      c = (@keywords + @first_keywords).uniq

    end

    def first_level_search

      puts "1st level: searching keyword |#{@base_keyword} #{@letter}|"
      #search base keyword + 'a' or whatever letter is passed in
        results = Instant::Request.new("#{@base_keyword} #{@letter}").get
        output = process_results(results, 'first')

        @final[:name] = "#{@base_keyword} #{@letter}"
        @final[:children] = Array.new
        output.each {|out| @final[:children] << { name: out } }


    end

    def second_level_search
      @first_keywords = @first_keywords[0..3]

     @first_keywords.each do |keyword|
        puts "- 2nd level: searching keyword |#{keyword}|"

        #item = @final[:children].select{|name| name[:name] == "best glock airsoft" }[0]
        item = @final[:children].select{|name| name[:name] == keyword }[0]
        item[:children] = Array.new
        #search each keyword + 'a', 'b', etc...
        @alphabet.each do |let|

          sleep = rand(0.2..0.5)
          puts "-- 2nd level: searching keyword |#{keyword} #{let}|"
        #search base keyword + 'a' or whatever letter is passed in
          results = Instant::Request.new("#{keyword} #{let}").get
          output = process_results(results, 'second')


          new_item = {
            name: "#{keyword} #{let}",
            children: []
          }
          output.each {|out| new_item[:children] << { name: out } }

          item[:children] <<  new_item
          #output.each {|out| item[:children] << { name: out } }

          #byebug
          #byebug




          puts "sleeping for #{sleep} seconds"
          sleep sleep
        end
      end



      puts "DONE!!! RESULTS =>"
      puts "first keywords: "
      puts @first_keywords
      puts "keywords: "
      puts @keywords
      puts "-------------------------------------------"
    end

    def process_results(results, level)
      #process results and add each unique new keyword to master array.
      output = []
      if level == 'first'
        results.each do |res|
          if !@first_keywords.include? res
            @first_keywords << res
            output << res
          end
        end
      else
        results.each do |res|
          if !@keywords.include? res
            @keywords << res
            output << res
          end
        end
      end
      output
    end



  end

end
