# frozen_string_literal: true

describe "microdata" do
  before { visit "/microdata.html" }

  it "selects microdata" do
    expect(page).to have_selector :item, "name", text: "Harry"
  end

  it "matches microdata" do
    item = page.find(:item, "name", text: "Harry")
    expect(item).to match_selector :item, "name"
  end

  it "selects microdata in a type" do
    expect(page).to have_selector :item, "age", type: "building", text: "129"
  end

  it "selects microdata in a nested types" do
    expect(page).to have_selector :item, "age", type: %w[building person], text: "222"
  end
end
