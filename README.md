App Title: **MovieReviews**
By: **Zach Bohenick**

## Installation & Set Up
*To begin, I used the Rails Girls Guides: Rails Girls App Tutorial*
https://guides.railsgirls.com/app

### Tier 1

#### 1, 2. Objects

I created a movie object with three variables.

```
rails g scaffold movie title:string description:text picture:integer

rake db:migrate
```


#### 1, 2a. Picture Uploads

In order to add movie posters to my site, I followed the Rails Girls Guide to set up the gem carrierwave.
```
gem 'carrierwave' 
gem 'net-ssh'     //Added to my GemFile

bundle install   //In terminal
```

I added to the movie model

```
mount_uploader :picture, PictureUploader
```
Changed the form field
```
<%= form.file_field :picture, id: :movie_picture %>
```
And included an if statment to check if a picture is present
```
<%= image_tag movie.picture_url, width: '100%' if movie.picture.present? %>
```

#### 1, 2b. Adding Reviews
*Rails Girls Guides: Commenting for Rails Girls App*
https://guides.railsgirls.com/commenting
*FormTagHelper Methods Options*
https://api.rubyonrails.org/classes/ActionView/Helpers/FormTagHelper.html#method-i-number_field_tag

Created review object scaffold

```
rails g scaffold review review:integer headline:string body:text movie_id:integer
rake db:migrate
```
#### 1, 2c. Including Reviews on Movie Show Page

Added

```
<h3>User Reviews</h3>
<% @reviews.each do |review| %>
  <div>
    <p><%= review.review %>/10: <strong><%= review.heading %></strong></p>
    <p><%= review.body %></p>
    <p><%= link_to 'Delete', review_path(review), method: :delete, data: { confirm: 'Are you sure?' } %></p>
  </div>
<% end %>
<%= render partial: 'reviews/form', locals: { review: @review } %>
```

#### 1, 2d. Setting Min Max on Review Input

Added `:min` and `:max` options to number_field to make reviews out of 10.

```
  <div class="field">
    <%= form.label :review %>
    <%= form.number_field :review, min: 0, max: 10%>
  </div>
```
I also changed the form labels to be more descriptive.


#### 3. Adding Relations to Models

In `movie.rb` model file
```
has_many :reviews
```
In `review.rb` model file
```
belongs_to :movie
```
#### 4. The scaffold established CRUD abilities for each object.

#### 5. I posted this onto Github.

### Tier 2

#### 1. Setting Home Page

I wanted to change the route of the home page to go to the movies index page. In order to do this, I added this to the `routes.rb` file

```
root to: redirect('/movies')
```


#### 2. Including Bootsrap
*Let's Code - How to setup Bootstrap 4 on Ruby on Rails 5*
https://www.youtube.com/watch?v=ZPh19YUbC3A

1. I followed the guide to add the bootstrap gem, javascript requirements, changed the `application.css` file to `application.scss` and added `@import "bootstrap";`. I then started editing my `application.html.erb` file to include a bootstrap navigation with active links.

2. I then wrapped the `<%= yield %>` in a content div.

3. I styled my buttons on the site differently using the Bootstrap primary, secondary, info, and danger options.

4. I added columns and rows to the `show.html.erb` and `index.html.erb` files.

#### 3. Adding Validations

I added some validations to my `movie.rb` and `review.rb` files.

```
    //in movie.rb file

    validates_presence_of :title, :description
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

    //in review.rb file

    validates_presence_of :review, :headline, :body
```

I wrote these validations to make sure that the application warns the user if they try to submit a movie or review without the necessary information.

#### 4. Writitng Tests

I am still rather shaky on writing tests, but I did my best to move forward with what I understand: testing validations.

so, in my `movie_test.rb` file, I wrote:

```
require 'test_helper'

class MovieTest < ActiveSupport::TestCase
  test "should not save movie without title or description" do
    movie = Movie.new
    assert_not movie.valid?
    assert_equal [:title, :description], movie.errors.keys
  end
end
```
and in my `review_test.rb` I wrote:

```
require 'test_helper'

class ReviewTest < ActiveSupport::TestCase
  test "should not save without the necessary required validators" do
    review = Review.new
    assert_not review.valid?
    assert_equal [:review, :headline, :body], review.errors.keys
  end
end
```
#### 5. ReadMe: Here.

### Tier 3

#### 2. Add gem with added functionality

I added `gem 'carrierwave'` to my site as mentioned before.

#### 4. Clever design of HTML/CSS

I also did some form styling so that it is more comfortable to write reviews or movie descriptions. I increased the size and improved the appearance by adding this to the `application.scss` file: 

```
input[type="text"], textarea {
    width: 100%;
    max-width: 100%;
    height: 3em;
    border: 2px solid grey;
    padding: 1em;
    margin: .5em 0 2em 0;
}

textarea {
    min-height: 20em;
}

input[type="number"] {
    height: 3em;
    border: 2px solid grey;
    padding: 1em;
    margin: .5em 0 2em 0;
}
```

I added star icons: "☆" to the reviews which I think gives it a nice feeling of a review as opposed to a plain number. I did do some work to try and write a javascript function to assign "☆" icons to the review number amount, but that became too challenging. I will continue working on it on my free time however, and hopefully will include it within the week.

With the help of Bootstrap I redesigned the layout from the original table format. I used columns and rows to create a more convenient layout.