module ProjectsHelper

    ##
     # This is a temporary function.
     # It will later need to modified once profiles are done
     # to take profile_id as the only parameter.
     ##
    def project (title, description)
        width1 = title.length * 1.6
        width2 = 88 - width1

        html_str = 
        '
        <div class="software" style="width: 4%;"></div>

        <span class="software" style="width:' + width1.to_s + '%; padding: 0% 3% 0% 3%;">' + 
            title + 
        '</span>
        
        <div class="software" style="width: ' + width2.to_s + '%;"></div>  

        <p class="software">' + 
            description + 
        '</p>

        <br>'

        return html_str
    end
end
