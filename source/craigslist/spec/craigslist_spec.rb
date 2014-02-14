require 'spec_helper'

FactoryGirl.define do
  factory :post do
    category_id 1
    title "Test Post"
    description  "this is a test"
    price 10
    email "apple@apple.com"
  end

  factory :category do
  	id 1000
  	name "Test Category"
  end
 end

post = FactoryGirl.build(:post)
category = FactoryGirl.build(:category)

describe Post do

  subject { post } 

  it { should respond_to(:category) }
  it { should respond_to(:description) }
  it { should respond_to(:price) }
  it { should respond_to(:email) }

  it "should belong to a category" do
  	post.category.should == Category.first
  end
end

describe Category do

	it "should have a name" do
		category.should respond_to(:name)
	end
end

describe "craigslist app" do
	it "should render the homepage" do
		get '/'
		expect(last_response).to be_ok
	end

	it "should be able to show a category" do
		get "/categories/#{rand(6)}"
		expect(last_response).to be_ok
	end
end







