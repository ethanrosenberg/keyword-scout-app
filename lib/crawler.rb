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
      @first_keywords = @first_keywords[0..7]

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

  class Beta

    def initialize(base_keyword, keyword, raw_keyword)
      @base = base_keyword
      @raw = raw_keyword
      @keyword = keyword

      @beta_results = []


    end

    def start

      breakdown_response = breakdown_keyword
      byebug
      breakdown_response[:search_terms].each do |request|

        instant_response = Instant::Request.new(request).get
        @beta_results.push(*instant_response)

        sleep rand(0.3..0.7)
      end

      byebug
    end

    def breakdown_keyword

      if @keyword.start_with?(@base)
        alphabet = ('a'..'z').to_a
        terms = []
        stripped_keyword = @keyword
        stripped_keyword.slice! @base
        stripped_keyword.strip!
        stripped_keyword_words = stripped_keyword.split(" ")
        keyword_words = @keyword.split(" ")

        builder = ''
        stripped_keyword_words.each_with_index do |word,index|
          builder = "#{builder} #{stripped_keyword_words[index]}"

          #add each letter of the alphabet to keyword
          alphabet.each do |letter|
            term = "#{@base} #{builder} #{letter}"
            terms << term.gsub("  ", " ")
          end

        end

        result = { base: @base, raw_keyword: @raw, words: stripped_keyword_words, search_terms: terms}
      end

    end




  end

end
