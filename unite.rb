require 'pry'

class Parser
	def initialize
    @csv_input = ['Lead Chef, Chipotle, Denver, CO, 10, 15',
      'Stunt Double, Equity, Los Angeles, CA, 15, 25',
      'Manager of Fun, IBM, Albany, NY, 30, 40',
      'Associate Tattoo Artist, Tit 4 Tat, Brooklyn, NY, 250, 275',
      'Assistant to the Regional Manager, IBM, Scranton, PA, 10, 15',
      'Lead Guitarist, Philharmonic, Woodstock, NY, 100, 200'].join("\n") + "\n"
	end

	def format_whole
    @csv_input = order_by_title(@csv_input.split("\n"))
    @csv_input = @csv_input.map { |line| format_line(line) }
    @csv_input.unshift('All Opportunities')
    puts @csv_input.join("\n") + "\n"
    @csv_input
	end

	def format_line line
    line = line.split(', ')
    line_object = {
      "Title" => line[0],
      "Organization" => line[1],
      "Location" => line[2] + ', ' + line[3],
      "Pay" => line[4] + '-' + line[5]
    }
    line_object.map{|k,v| k + ': ' + v }.join(", ")
	end

	def order_by_title arr
    arr.sort_by{ |line| line.split(', ')[0]}
	end
end

Parser.new().format_whole