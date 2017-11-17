function [fire, transition] = tMoving2_pre(transition)

tokID = tokenAny('pGoto2',1);
granted = request(transition.name, {'robot2',1});
transition.selected_tokens = tokID;
if tokID    
    colors = get_color('pGoto2',tokID);
    transition.override=1;
    transition.new_color={};
    j=1;
    for i=1:length(colors)
        if(not(strcmp(colors{i}(1:4),'goto')))
            transition.new_color{1,j}=colors{i};
            j=j+1;
        else
            order=split(colors{i},'_');
            distance=str2num(order{4}(2:end));
            if(distance>0)
                distance=distance-100;
                transition.new_color{1,j}=strcat('goto_',order{2},'_',order{3},'_D',num2str(distance));
                j=j+1;
            else
                tokID=0;
            end
        end
    end
    fire = (tokID)&&(granted);
end
