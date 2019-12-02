require 'spec_helper'
require "support/data_generator"

RSpec.describe ArMemoization::PrimaryMethods do
  before(:all) do
    DataGenerator.generate_prefectures
  end

  xdescribe ".find_memo" do
  end

  xdescribe ".detect_memo" do
  end

  xdescribe ".select_memos" do
  end

  xdescribe ".all_memos" do
  end

  xdescribe ".reload_memos" do
  end
end

RSpec.describe ArMemoization::ForeignMethods do
  before(:all) do
    DataGenerator.generate_prefectures
  end

  xdescribe ".belongs_to_memoized" do
  end

  xdescribe ".where_memoized" do
  end
end
