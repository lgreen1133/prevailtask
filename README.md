## Prevail Health

**This repo should provide the following:**

* One Rails application

* Content served for two domains (students.com and professors.com)

* Authentication via Devise

### Notes on progress

* Devise was successfully installed which handles authentication for all users
* Bootstrap installed

#### Two Domains

To handle two different domains, I looked into using namespace. Upon reading more, it seems like DomainConstraints would accomplish this. In my routes I included them like so:

```ruby
constraints DomainConstraint.new([:professors_domain]) do
  resources :professors, controller: "professors/professors"
  get '/' => 'professors#index'
end

constraints DomainConstraint.new([:students_domain]) do
  resources :students, controller: "students/students"
  get '/' => 'students#index'
end
```

To be able to test locally, I installed [Pow](http://pow.cx/). This allowed me to be able to launch and test on each domain respectively. I included this in my settings.yml file:

```ruby
development:
  professors_domain: professors.dev
  students_domain: students.dev
```

If this was launched to production, we could include the actual domains in that same file. View is able to determine if the user is a student or professor and welcomes them accordingly.

#### Different Users

Since we have two different types of users (Students and Professors), I thought about building a model for each. The association between them would be simpler. However, since we want both of them to be able to sign up via Devise (one user account) I opted for roles.

I added a role to the User model, and opted for enum roles, where the role is saved as an integer in the users table. I included this in the `registration#new` form, allowing the user that is signing up to choose his or her role. See screenshots at the end.

### Associations

Since I only have one User model with different roles, I overrode the class name for the association, like so:

```ruby
belongs_to :professor, :class_name => "User", :foreign_key => 'user_id'
belongs_to :student, :class_name => "User", :foreign_key => 'user_id'
```

The subject currently has only one association and that's that it `belongs_to :user`. Testing in the Rails console reveals the association is present:

```
2.2.1 :002 > u.subjects
  Subject Load (15.8ms)  SELECT "subjects".* FROM "subjects" WHERE "subjects"."user_id" = ?  [["user_id", 1]]
 => #<ActiveRecord::Associations::CollectionProxy []>
```

#### Thoughts on Where to Take This

This is just barebones on where to take this. I'm unable to decide and execute a design pattern at this time, but these are my thoughts:

* If we have the user select the Subject when registering, we'd need to differentiate the options for the user based on role
* The number of subjects varies (opted for the term subject to avoid using class)
* I think it would be best to have a list of available subjects, user chooses from list
* I would probably like to have a predefined list of subjects already associated with professors. Students just pick their subjects and that would trickle down to the view (Professors see all students they have through subjects, Students see all other students that picked the same subject)

#### Screenshots

![Professor](http://i.imgur.com/w5yYtAC.png)

![Student](http://i.imgur.com/tq9LvCn.png)

![Signup](http://i.imgur.com/JehAhkY.png)
