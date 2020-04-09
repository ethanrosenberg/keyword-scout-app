require 'ruby-graphviz'
require 'json'

class TestController < ApplicationController

  def start

    #clear files for testing purposes before each new run
    #File.truncate('starts_with_base.txt', 0)
    #File.truncate('doesnt_start_with_base.txt', 0)
    # Create a new graph
  #  graph = GraphViz.new( :G, :type => :digraph )



    base_keyword = "best glock"
    final = {
      #base: base_keyword
    #

    }
    #keywords = Crawler::Worker.new("best glock", 'a', final).start

    #File.write('keywords.yml', final.to_yaml)

    #File.open("kewyords2.json","w") do |f|
    #  f.write(JSON.pretty_generate(final))
    #end

    file = File.read('keywords5.json')

     #bodyJson = JSON.parse(file)
     byebug
    render json: file
      # Generate output image
      #graph.output( :png => "hello_world.png" )









    #keywords = File.readlines('second_level_a.txt')

    #start_with = File.open("starts_with_base.txt", "w")
    #doesnt_start = File.open("doesnt_start_with_base.txt", "w")

    #keywords.each do |kw|
    #  if kw.starts_with? base_keyword
    #    start_with.puts kw
    #  else
    #    doesnt_start.puts kw
    #  end
    #end


    #start_with.close
    #doesnt_start.close










    #searches_completed = []

    #test_call


    #

  end



  def test_prox
    ip = Instant::Request.new("https://api.ipify.org?format=json").test_reques
  end
end
