function to_group = find_groups(classes,parameters,link,coefficient_of_variation)
to_group = link(1);
if length(link)>1
    i = 1;
    while true
        i = i+1;
        if i <= length(link)
            to_check = [parameters(to_group,:);classes(link(i),2)];
            to_check = vertcat(to_check{:});   
            variation = std(to_check,0,1)./mean(to_check,1);
            if any(variation>coefficient_of_variation)
                break
            else
                to_group = link(1:i);
            end
        else
            break
        end
    end
end
end