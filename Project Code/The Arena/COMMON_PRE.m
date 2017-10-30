function [fire, transition] = COMMON_PRE(transition)


    if (strcmp(transition.name,"tslot2_1")||strcmp(transition.name,"tslot2_1")||strcmp(transition.name,"tslot2_1"))
        tokenRrobot = tokenAny('pslot2', 1); 
        colors = get_color('pslot2',tokenRobot);
        
        tokCylinder = tokenAnyColor('pslot2',1,{'cylinder'})
        transition.selected_tokens = tokCylinder;

        transition.override=1;
        for i=1:length(colors)
            cylinder=0;
            if(not(strcmp(colors{i},'cylinder'))||cylinder==1)
                transition.new_color{1,length(transition)+1}=colors{i};
            else
                cylinder=1;
            end
        end
        transition.new_color{1,length(transition)+1}='openTong'
        fire = (tokCylinder)
    
    else
        transition.new_color='wheels';
        transition.override = 1;
        fire=1;
    end
end

