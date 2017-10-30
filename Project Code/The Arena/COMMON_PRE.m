function [fire, transition] = COMMON_PRE(transition)

    global global_info;

    if (strcmp(transition.name,"tslot2_1")||strcmp(transition.name,"tslot2_2")||strcmp(transition.name,"tslot2_3"))
        tokenRobot = tokenAny('pslot2', 1); 
        colors = get_color('pslot2',tokenRobot);
        
    %    tokCylinder = tokenAnyColor('pslot2',1,{'cylinder'});
    %    global_info.token= tokCylinder;
    %    transition.selected_tokens = tokCylinder;

        transition.override=1;
        transition.new_color={};
        for i=1:length(colors)
            cylinder=0;
            if(not(strcmp(colors{i},'cylinder'))||cylinder==1)
                transition.new_color{1,length(transition.new_color)+1}=colors{i};
            else
                cylinder=1;
            end
        end
        transition.new_color{1,length(transition.new_color)+1}='openTong';
        fire =1;
    
    else
        if(strcmp(transition.name,'tmCylinder1')||strcmp(transition.name,'tmCylinder2')||strcmp(transition.name,'tmCylinder3')||strcmp(transition.name,'tyCylinder1')||strcmp(transition.name,'tyCylinder2')) 
   %         place=strcat('p',transition.name(2),'c',transition.name(11));
    %        tokTake=tokenWOAnyColor(place,'2','cylinder');
            transition.new_color='cylinder';
            fire=1;
        else
            transition.new_color='wheels';
          %  transition.override = 1;
            fire=1;
        end
    end
end

