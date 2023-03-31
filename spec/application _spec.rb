require "spec_helper"
require "rack/test"
require_relative "../app"

describe Application do
  include Rack::Test::Methods

  let(:app) { Application.new }
  context "GET /" do
    it "lists the peeps in the database" do
      user_1 =
        User.new(
          email: "jack@makers.com",
          password_digest: "Swordfish69",
          real_name: "Jack Thacker",
          username: "thackattacc",
        )
      user_1.save
      user_2 =
        User.new(
          email: "john@makers.com",
          password_digest: "Blackwillow123",
          real_name: "John Doe",
          username: "jondo",
        )
      user_2.save
      post = Post.new(text: "My first peep", user_id: 1)
      post.save
      post = Post.new(text: "Ed Balls", user_id: 2)
      post.save
      res = Rack::MockRequest.new(app).get("/")
      expect(res.status).to eq 200
      expect(res.body).to include("<body>")
      expect(res.body).to include("My first peep")
      expect(res.body).to include("Ed Balls")
    end

    it "list user information for each peep" do
      user_1 =
        User.new(
          email: "jack@makers.com",
          password_digest: "Swordfish69",
          real_name: "Jack Thacker",
          username: "thackattacc",
        )
      user_1.save
      user_2 =
        User.new(
          email: "john@makers.com",
          password_digest: "Blackwillow123",
          real_name: "John Doe",
          username: "jondo",
        )
      user_2.save
      post = Post.new(text: "My first peep", user_id: 1)
      post.save
      post = Post.new(text: "Ed Balls", user_id: 2)
      post.save
      res = Rack::MockRequest.new(app).get("/")
      expect(res.status).to eq 200
      expect(res.body).to include("Jack Thacker")
      expect(res.body).to include("thackattacc")
    end
  end

  context "GET /sign-up" do
    it "provides forms for user to sign up with" do
      res = Rack::MockRequest.new(app).get("/sign-up")
      expect(res.status).to eq 200
      expect(res.body).to include("<html>")
      expect(res.body).to include("<body>")
      expect(res.body).to include("<form")
      expect(res.body).to include("<body>")
    end
  end

  context "POST users" do
    it "posts a user to the database" do
      res =
        Rack::MockRequest.new(app).post(
          "/users",
          email: "jose@makers.com",
          password: "CookingHero123",
          real_name: "Jose Lopez Guererro",
          username: "apprentice_jedi",
        )
      expect(res.status).to eq 200
      # post = Post.new("text": "It's Friyay!", "user_id": 1)
      # post.save
      res = Rack::MockRequest.new(app).get("/")
      expect(res.status).to eq 200
      users = User.all
      expect(users.size).to eq 1
      expect(users.first.username).to eq "apprentice_jedi"
      # expect(res.body).to include('apprentice_jedi')
    end
  end
end
