module MembersHelper

    ##
     # This is a temporary function.
     # It will later need to modified once profiles are done
     # to take profile_id as the only parameter.
     ##
    def mini_profile (first, last, position, grad, major)
        name = first + ' ' + last

        html_str = 
        '<span style="width: 20%;">
            <img src="" width="90%" height="160px" style="display: inline-block;"/>
        </span>
        <span  style="float: right; width: 78%;">
            <h2 class="profile">
                <a href="#">
                    ' + name + '
                </a>
            </h2>
            <h3>' + position + '</h3>

            
            <br>
            <p class="profile">
                <b>Class of \'' + grad + '</b> ' + major + '&nbsp' * 3 +
                '<a href="#" target="_blank" class="resume"> View ' + first+ '\'s Resume</a>
            </p>
            <p class="bio">
                <b>Bio: </b> EWB-USA is a nonprofit humanitarian organization 
                established to support community-driven development programs 
                worldwide through partnerships that design and implement 
                sustainable engineering projects, while creating transformative 
                experiences that enrich global perspectives and create 
                responsible leaders.
                <font style="color: #095aa6"> ... </font>
                <a href="#" class="resume">read more</a>
            </p>   
        </span>'

        return html_str
    end
end
