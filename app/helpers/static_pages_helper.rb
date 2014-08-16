module StaticPagesHelper

    #
    # Creates an unordered list <ul> with a series of list items <li>
    # by calling the li function. This function takes a ruby hash containing
    # text/url pairs to use for the list items.
    #
    def ul (list)
        str = ''

        list.each_key do |i|
            str += li i, list[i]
        end

        return '<ul>' + str + '</ul>'

    end


    #
    # Creates a list item <li> and containing anchor tag <a href>.
    #
    def li (text, url)
        return '<li><a href=\'' + url + '\'>' + text + '</a></li>'
    end


end
