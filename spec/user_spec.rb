require "user"

RSpec.describe User do
  it "has the correct methods" do
    user = User.new('email': 'jack@makers.com', 'password_digest': 'Swordfish69', 'real_name': "Jack Thacker", 'username': "thackattacc")
    user.save
    users = User.all
    expect(users.size).to eq 1
    user = User.new('email': 'john@makers.com', 'password_digest': 'Blackwillow123', 'real_name': "John Doe", 'username': "jondo")
    user.save
    expect(users.size).to eq 2
    expect(users.first.email).to eq 'jack@makers.com'
    expect(users.first.password_digest).to eq 'Swordfish69'
    expect(users.last.real_name).to eq 'John Doe'
    expect(users.last.username).to eq 'jondo'
  end
end