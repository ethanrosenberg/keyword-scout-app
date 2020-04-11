require 'ruby-graphviz'
require 'json'

class TestController < ApplicationController

  def start

    ##working start
    base_keyword = "best glock"
    data_hash = Hash.new
    #keywords = Crawler::Worker.new("best glock", 'a', data_hash).start
    #write_output(data_hash)
    #render json: { response_data: data_hash, keywords: keywords }
    render json: { response_data: data_hash, keywords: [] }
    ##working end




    #clear files for testing purposes before each new run
    #File.truncate('starts_with_base.txt', 0)
    #File.truncate('doesnt_start_with_base.txt', 0)
    # Create a new graph
  #  graph = GraphViz.new( :G, :type => :digraph )




    #File.write('keywords.yml', final.to_yaml)



    #file = File.read('keywords_test.json')

     #bodyJson = JSON.parse(file)



       #byebug


       #byebug


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

  def beta


    base_keyword = "best glock"
    keyword = "best glock adjustable sights"
    raw = "best glock adjustable sights"
    #res = Crawler::Beta.new(base_keyword, keyword, raw).start
    #write_output(res)
    #render json: { beta_data: res }

    render json: { starting_keyword: keyword, beta_data: ["test keyword"] }

  end

  def write_output(data_hash)
    File.open("output/kewyords.json","w") do |f|
      f.write(JSON.pretty_generate(data_hash))
    end
  end



  def test_prox
    ip = Instant::Request.new("https://api.ipify.org?format=json").test_reques
  end
end
