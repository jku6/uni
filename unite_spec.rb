require_relative 'unite'

describe Parser do
  describe '#format_whole' do
    subject { Parser.new().format_whole }

    context "test correct output" do
      it { is_expected.to eq(["All Opportunities",
        "Title: Assistant to the Regional Manager, Organization: IBM, Location: Scranton, PA, Pay: 10-15",
        "Title: Associate Tattoo Artist, Organization: Tit 4 Tat, Location: Brooklyn, NY, Pay: 250-275",
        "Title: Lead Chef, Organization: Chipotle, Location: Denver, CO, Pay: 10-15",
        "Title: Lead Guitarist, Organization: Philharmonic, Location: Woodstock, NY, Pay: 100-200",
        "Title: Manager of Fun, Organization: IBM, Location: Albany, NY, Pay: 30-40",
        "Title: Stunt Double, Organization: Equity, Location: Los Angeles, CA, Pay: 15-25"]
        ) 
      }
    end
  end

  describe '#format_line' do
    subject { Parser.new().format_line(line) }

    context "test correct line output" do
      let(:line) { "Assistant to the Regional Manager, IBM, Scranton, PA, 10, 15" }
      it { is_expected.to eq("Title: Assistant to the Regional Manager, Organization: IBM, Location: Scranton, PA, Pay: 10-15") }
    end
  end

  describe '#order_by_title' do
    subject { Parser.new().order_by_title(arr) }

    context "test correct order" do
      let(:arr) { ["Lead Chef, Chipotle, Denver, CO, 10, 15",
        "Stunt Double, Equity, Los Angeles, CA, 15, 25",
        "Manager of Fun, IBM, Albany, NY, 30, 40",
        "Associate Tattoo Artist, Tit 4 Tat, Brooklyn, NY, 250, 275",
        "Assistant to the Regional Manager, IBM, Scranton, PA, 10, 15",
        "Lead Guitarist, Philharmonic, Woodstock, NY, 100, 200"]
      }

      it { is_expected.to eq(["Assistant to the Regional Manager, IBM, Scranton, PA, 10, 15",
        "Associate Tattoo Artist, Tit 4 Tat, Brooklyn, NY, 250, 275",
        "Lead Chef, Chipotle, Denver, CO, 10, 15",
        "Lead Guitarist, Philharmonic, Woodstock, NY, 100, 200",
        "Manager of Fun, IBM, Albany, NY, 30, 40",
        "Stunt Double, Equity, Los Angeles, CA, 15, 25"]) 
      }
    end
  end
end
