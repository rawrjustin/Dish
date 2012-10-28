module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /the home\s?page/
      '/'

    when /the sign up page/
      '/users/sign_up'

    when /the sign in page/
      '/users/sign_in'

    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    when /the browse large group menus page/
      '/large/menus'

    when /the small group recipes page/
      '/small/recipes'

    when /the admin page/
      '/admin'

    when /the admin sign in page/
      '/admin/sign_in'

    when /the add a large group menu page/
      '/admin/menus/new'

    when /the details page for "(.*)"/
      recipe_path(Recipe.find_by_name($1))

    when /the details page for the large group menu "(.*)"/
      menu_path(Recipe.find_by_name($1))

    when /the add a recipe page/
      '/recipes/new'

    when /the details page for "(.*)"/
      recipe_path(Recipe.find_by_name($1))

    else
      begin
        page_name =~ /the (.*) page/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue Object => e
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
