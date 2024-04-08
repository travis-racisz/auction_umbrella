import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :auction_web, AuctionWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "k9Nz2js7TeFchuTqD3/MWQsIyLG8X/wEdyuExWSKJLwNyD/7Fb+VcATmQp1awm/9",
  server: false
