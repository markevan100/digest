Currently, I am trying to get functionality so that when a user creates a new discussion
they can attach categories through radio buttons. When I submit to create my discussion,
I get an error that says "Categories is invalid" in the UI.

So, what is going on?

Let's try tracing the data from the form where I submit it back to the db and see if we
can figure out where things go wrong.

1) `_form.html.erb` in my app/views/discussions is the first place to start. This page is rendered
as a partial through my `new.html.erb` page (which is the actual page that is being served up).
The form partial has a form group for collection_check_boxes which I assume is working.
(I just copied the tutorial on how to make those, so it's hard for me to be sure, but based on the
info below, it looks like they are.) Let's pry in.

If I try to create a new discussion with boxes 2 and 3 checked, my pry session shows
`discussion_params` of: `"category_ids"=>["", "2", "3"]`. If I try to do the same thing without
clicking any of the boxes, I get `discussion_params` of: `"category_ids"=>[""]`.

Why is there an empty string in there? Does that matter? Is that what is preventing the
`category_ids` from being saved?

2) From views, the info is being sent to my discussion_controller. I think this happens through the
line in my `new.html.erb` that says: `discussion: @discussion` but I'm also not 100% clear on that. My
controler is taking in the `params` (are these the strong params?) and using a method to create `discussion_params`. Those I can read in my pry session. Next, it tries to extract them and set them
equal to what they need to be in the create method. This is where the setting for the `category_ids` is failing.
Why won't it save? Let's head to the model.

3) So, my model has validations, but doesn't have any for categories (yet). It has associations, that seems
like it might be where I'm messing up. I'm trying to feed `category_ids` but my associations are with
categories and through discussion_categories. Not sure I fully understand that. So, going to pry in more.

Looking at my Discussion.all list, NONE of them show anything for category or category_ids. This seems to be a problem. I just hard-coded a new discussion with a category_ids value of `["2"]`. That allowed the
discussion to be saved to the db... but when I call that discussion up through the console, it doesn't show
and category attributes. When I call that `discussion.categories` it returns `<ActiveRecord::Associations::CollectionProxy []>`. So, my discussion does have the association, but nothing
is in the array and it isn't displaying.

So, I have solved nothing. But potentially identified some places where my error is coming from?

1) Why is a blank string getting saved into my category_ids array?
2) What is the relationship between my category_ids and my many-to-many associations?
3) Why is my category_ids array empty even if I hardcode a value into my create action?
4) Why does my discussion seem to have a category_ids param when directly called but not show it in
the index of my console?
