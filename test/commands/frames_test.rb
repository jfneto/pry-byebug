# frozen_string_literal: true

require "test_helper"
require "stringio"

#
# Tests for pry-byebug frame commands.
#
class FramesTest < Minitest::Spec
  let(:output) { StringIO.new }

  after { clean_remove_const(:FramesExample) }

  describe "Down command" do
    let(:input) { InputTester.new("up", "down") }

    before do
      redirect_pry_io(input, output) { load test_file("frames") }
    end

    it "shows current line" do
      _(output.string).must_match(/=> \s*13: \s*end/)
    end
  end

  describe "Frame command" do
    before do
      redirect_pry_io(input, output) { load test_file("frames") }
    end

    describe "jump to frame 1" do
      let(:input) { InputTester.new("frame 1", "frame 0") }

      it "shows current line" do
        _(output.string).must_match(/=> \s*8: \s*method_b/)
      end
    end

    describe "jump to current frame" do
      let(:input) { InputTester.new("frame 0") }

      it "shows current line" do
        _(output.string).must_match(/=> \s*13: \s*end/)
      end
    end
  end
end
