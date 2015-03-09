require_relative 'spec_helper'

describe "Actor" do
  #TODO: implement the tests as described in the it blocks,
  #      and implement the class and migrations required to pass them

  # HINTS: look at show_spec.rb and network_spec.rb and character_spec.rb for guidance
  let(:actor) { Actor.create(:first_name => "Leonardo", :last_name => "Dicaprio")}
  it "has a first and last name" do
      actor.first_name.should eq("Leonardo")
      actor.last_name.should eq("Dicaprio")
  end

  it "has associated characters in an array" do
    # Hint: think about what migration you'll need to write so that an actor can have many characters.
    # Where will the association foreign key go?
    characters = [
      Character.new(:name => "Cobb"),
      Character.new(:name => "Roger Ferris"),
      Character.new(:name => "Jay Gatsby")
      ]
      actor.characters << characters
      actor.save
      actor.characters.count.should eq(3)
      actor.characters.collect{|a| a.name }.should include("Roger Ferris")
  end

  it "can build its associated characters" do
    actor = Actor.new(:first_name =>"Paul", :last_name =>"walker")
    actor.characters.build(:name => "Brian O'Conner")
    actor.save
    actor.characters.count.should eq(1)
  end

  it "can build its associated shows through its characters" do
    furious = actor.characters.build(:name => "Brian O'Conner").build_show(:name => "Furious 7")
    actor.shows << furious
    actor.shows.first.name.should eq("Furious 7")
  end

  it "can list its full name" do
    expect(actor.full_name.should).to eq("#{actor.first_name} #{actor.last_name}")
  end

  it "can list all of its shows and characters" do
     "create a list_roles method"
    # TODO: build a method on actor that will return a string in the form of
    # character name - show name\n and test the results
    actor = Actor.create(:first_name => "Vin", :last_name => "Diesel")
    actor.save
    xxx = actor.characters.build(:name => "Xander Cage").build_show(:name => "xXx")
    furious = actor.characters.build(:name => "Dominic Toretto").build_show(:name => "Furious 7")
    actor.shows << xxx
    actor.shows << furious
    actor.save
    expect(actor.list_roles).to eq("Xander Cage - xXx\nDominic Toretto - Furious 7\n")
  end
end
