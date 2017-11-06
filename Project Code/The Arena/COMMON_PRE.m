function [fire, transition] = COMMON_PRE(transition)

    global global_info;

    if (strcmp(transition.name,"tslot2_1")||strcmp(transition.name,"tslot2_2")||strcmp(transition.name,"tslot2_3"))
        tokenRobot = tokenAnyColor('pslot2', 1,'cylinder'); 
        if tokenRobot
            colors = get_color('pslot2',tokenRobot);
   
            transition.override=1;
            transition.new_color={};
            for i=1:length(colors)
                cylinder=0;
                if((not(strcmp(colors{i},'cylinder'))||cylinder==1)&&(not(isOrder(colors{i}))))
                    transition.new_color{1,length(transition.new_color)+1}=colors{i};
                elseif(strcmp(colors{i},'cylinder'))
                    cylinder=1;
                end
            end
            transition.new_color{1,length(transition.new_color)+1}='openThong';
        end
        fire =tokenRobot;
        
    elseif(strcmp(transition.name,'tmCylinder1')||strcmp(transition.name,'tmCylinder2')||strcmp(transition.name,'tmCylinder3')||strcmp(transition.name,'tyCylinder1')||strcmp(transition.name,'tyCylinder2')) 
        place=strcat('p',transition.name(2),'c',transition.name(11));
        tokTake=tokenWOAnyColor(place,'1',{'cylinder','cylinder'});
        tokTake=tokTake(1);
        if(tokTake)
            colors=get_color(place,tokTake);
            transition.new_color={};     
            for i=1:length(colors)
                if(not(strcmp(colors{i},'closeThong'))&&(not(strcmp(colors{i},'openThong'))&&not(strcmp(colors{i},'wheels'))&&not(strcmp(colors{i},'cannon'))&&not(strcmp(colors{i},'brush'))))
                    transition.new_color{1,length(transition.new_color)+1}=colors{i};
                end
            end
            transition.override=1;        
            transition.new_color={'cylinder','closeThong'};
        end
        fire=tokTake;
    elseif(strcmp(transition.name,'tStartRobot1'))
        transition.new_color={'robot1'};
        fire=1;
    elseif(strcmp(transition.name,'tStartRobot2'))
        transition.new_color={'robot2'};
        fire=1;
    elseif(strcmp(transition.name,'tpRobotOrder_pRobot1')||strcmp(transition.name,'tpRobot1_pCannon')||strcmp(transition.name,'tpRobot1_pBrush')||strcmp(transition.name,'tpRobot1_pWheels1')||strcmp(transition.name,'tpRobotOrder_pRobot2')||strcmp(transition.name,'tpRobot2_pWheels2')||strcmp(transition.name,'tpRobot2_pThongs')||strcmp(transition.name,'tpThongs_prThongClose')||strcmp(transition.name,'trThongs_plThongClose')||strcmp(transition.name,'tpThongs_plThongOpen')||strcmp(transition.name,'tpThongs_prThongOpen'))
        fire=1;
    else
        places=strsplit(transition.name(2:end),'_');
        tokenRobot = tokenAny(places{1}, 1); 
        colors = get_color(places{1},tokenRobot);
  
        transition.override=1;
        transition.new_color={};
        for i=1:length(colors)
            if(not(isOrder(colors{i})))
                transition.new_color{1,length(transition.new_color)+1}=colors{i};
            end
        end
        transition.new_color{1,length(transition.new_color)+1}='wheels';
        fire =1;
    end
    
    function order=isOrder(color)
       if(strcmp(color,'closeThong')||strcmp(color,'openThong')||strcmp(color,'wheels')||strcmp(color,'cannon')||strcmp(color,'brush'))
          order=true;
       else
          order=false;
       end
    end
end

