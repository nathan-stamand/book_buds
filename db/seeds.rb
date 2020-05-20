user1 = User.create(
    username: "trendsetter",
    password: "ihateslipknot420!", 
    email: "ts@gmail.com", 
    pages_read: 0
    )
user2 = User.create(
    username: "billyboy99", 
    password: "diaperbaby", 
    email: "depresso@aol.com", 
    pages_read: 0
    )
user3 = User.create(
    username: "speedreader5000", 
    password: "yogurt_kid", 
    email: "ts@gmail.com", 
    pages_read: 0
    )

genre1 = Genre.create(name: "Spooky Mystery")
genre2 = Genre.create(name: "Bromantic Comedy")

author1 = Author.create(name: "Ken Miller")
author2 = Author.create(name: "Finn Song-Puum")

book1 = Book.new(
    title: "Lessons in Chilling",
    page_count: 498,
    reader_count: 0
    )

book2 = Book.new(
    title: "The Take Over",
    page_count: 203,
    reader_count: 0
)

book1.genre = genre2 
book1.author = author1 
book1.save
genre2.books << book1 
genre2.save
author1.books << book1
author1.save
user2.books << book1
user2.save

book2.genre = genre1 
book2.author = author2 
book2.save 
genre1.books << book2 
genre1.save 
author2.books << book2 
author2.save
user1.books << book2
user1.save

post1 = user1.authored_posts.build(title: "Am I Alone?", content: 'This book suuuucks? Am I wrong?')
post1.book = book2
post1.save
book2.save

comment1 = post1.comments.build(content: "This is a very, very bad book. 10/10, would recommend.")
comment1.user = user1 
comment1.save
user1.save
