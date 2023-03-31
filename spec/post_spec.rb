require "post"

RSpec.describe Post do
  it "has the correct methods" do
    user = User.new('email': 'jack@makers.com', 'password_digest': 'Swordfish68', 'real_name': "Jack Thacker", 'username': "thackattacc")
    user.save
    user = User.new('email': 'john@makers.com', 'password_digest': 'Blackwillow123', 'real_name': "John Doe", 'username': "jondo")
    user.save
    post = Post.new("text": 'My first peep', "user_id": 1)
    post.save
    post = Post.new("text": 'Ed Balls', "user_id": 2)
    post.save
    posts = Post.all
    expect(posts.size).to eq 2
    expect(posts.first.text).to eq 'My first peep'
    expect(posts.last.user_id).to eq 2
    end
end