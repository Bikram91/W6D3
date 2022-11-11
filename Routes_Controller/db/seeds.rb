# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.destroy_all
Artwork.destroy_all
ArtworkShare.destroy_all


u1 = User.create!(username: 'Saleh123')
u2 = User.create!(username: 'soccerfan24')
u3 = User.create!(username: 'nbaleague')

a1 = Artwork.create!(title: 'Mona lisa', image_url: 'monallisa.com', artist_id: u1.id)
a2 = Artwork.create!(title: 'the last supper', image_url: 'thelastsupper.com', artist_id: u3.id)
a3 = Artwork.create!(title: 'greek statue', image_url: 'greekstatue.com', artist_id: u1.id)

as1 = ArtworkShare.create!(artwork_id: a1.id, viewer_id: u2.id)
as2 = ArtworkShare.create!(artwork_id: a2.id, viewer_id: u1.id)

c1 = Comment.create!(author_id: u3.id, artwork_id: a1.id, body: 'nice work!!!')
c2 = Comment.create!(author_id: u1.id, artwork_id: a2.id, body: 'Wow this is expensiv!!!')
