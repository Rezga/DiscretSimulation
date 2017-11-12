function [fire, transition] = COMMON_PRE(transition)

    global global_info;

    if (strcmp(transition.name,"tslot2_1")||strcmp(transition.name,"tslot2_2")||strcmp(transition.name,"tslot2_3"))
        tokenRobot = tokenAllColor('pslot2', 1,{'cylinder','robot2'}); 
        if tokenRobot
            colors = get_color('pslot2',tokenRobot);
   
            transition.override=1;
            transition.new_color={};
            j=1;
            for i=1:length(colors)
                cylinder=0;
                if((not(strcmp(colors{i},'cylinder'))||cylinder==1)&&(not(isOrder(colors{i}))))
                    transition.new_color{1,j}=colors{i};
                    j=j+1;
                elseif(strcmp(colors{i},'cylinder'))
                    cylinder=1;
                end
            end
            transition.new_color{1,j}='openThong';
        end
        fire =tokenRobot;
        
    elseif(strcmp(transition.name,'tmCylinder1')||strcmp(transition.name,'tmCylinder2')||strcmp(transition.name,'tmCylinder3')||strcmp(transition.name,'tyCylinder1')||strcmp(transition.name,'tyCylinder2')) 
        place=strcat('p',transition.name(2),'c',transition.name(11));
        tokTake=tokenAllColor(place,'1',{'robot2'});
        tokTake=tokTake(1);
        if(tokTake)
            colors=get_color(place,tokTake);
            transition.new_color={};     
            j=1;
            for i=1:length(colors)
                if(not(isOrder(colors{i})))
                    transition.new_color{1,j}=colors{i};
                    j=j+1;
                end
            end
            transition.override=1;        
            transition.new_color{1,j}='cylinder';
            transition.new_color{1,j+1}='closeThong';
        end
        fire=tokTake;
    elseif(strcmp(transition.name,'tyTower')||strcmp(transition.name,'tc2Tower'))
        place=strcat('p',transition.name(2:end));
        tokTake=tokenAllColor(place,'1',{'robot2'});
        tokTake=tokTake(1);
        if(tokTake)
            colors=get_color(place,tokTake);
            transition.new_color={};     
            j=1;
            for i=1:length(colors)
                if(not(isOrder(colors{i})))
                    transition.new_color{1,j}=colors{i};
                    j=j+1;
                end
            end
            transition.override=1;        
            transition.new_color{1,j}='cylinder';
            transition.new_color{1,j+1}='closeThong';
        end
        fire=tokTake;
    elseif(strcmp(transition.name,'tsba2')||strcmp(transition.name,'tsba4')||strcmp(transition.name,'tbba2'))
        place=strcat('p',transition.name(2:end));
        tokTake=tokenAllColor(place,'1','robot1');
        granted = request(transition.name, {'robot1',1});
        tokTake=tokTake(1);
        if(tokTake&&granted)
            colors=get_color(place,tokTake);
            transition.new_color={};     
            j=1;
            for i=1:length(colors)
                if(not(isOrder(colors{i})))
                    transition.new_color{1,j}=colors{i};
                    j=j+1;
                end
            end
            transition.override=1;        
            transition.new_color{1,j}='balls';
            transition.new_color{1,j+1}='brush';
        end
        fire=tokTake&&granted;
    elseif(strcmp(transition.name,'tStartRobot1'))
        transition.new_color={'robot1'};
        fire=1;
    elseif(strcmp(transition.name,'tStartRobot2'))
        transition.new_color={'robot2'};
        fire=1;
    elseif(strcmp(transition.name,'tpRobotOrder_pRobot1')||strcmp(transition.name,'tpRobot1_pCannon')||strcmp(transition.name,'tpRobot1_pBrush')||strcmp(transition.name,'tpRobot1_pWheels1')||strcmp(transition.name,'tpRobotOrder_pRobot2')||strcmp(transition.name,'tpRobot2_pWheels2')||strcmp(transition.name,'tpRobot2_pThongs')||strcmp(transition.name,'tpThongs_prThongClose')||strcmp(transition.name,'tpThongs_plThongClose')||strcmp(transition.name,'tpThongs_plThongOpen')||strcmp(transition.name,'tpThongs_prThongOpen'))
        fire=1;
    else
        places=strsplit(transition.name(2:end),'_');
        robot=strcat('robot',places{3});
        granted = request(transition.name, {robot,1});        
        tokenRobot = tokenAnyColor(places{1}, 1,robot); 
        if(tokenRobot&&granted)
            global_info.nbfire=global_info.nbfire+1;
            colors = get_color(places{1},tokenRobot);

            transition.override=1;
            transition.new_color={};
            j=1;
            for i=1:length(colors)
                if(not(isOrder(colors{i})))
                    transition.new_color{1,j}=colors{i};
                    j=j+1;
                end
            end
            transition.new_color{1,j}='wheels';
        end
        fire=tokenRobot&&granted;
    end
    
    function order=isOrder(color)
       if(strcmp(color,'closeThong')||strcmp(color,'openThong')||strcmp(color,'wheels')||strcmp(color,'cannon')||strcmp(color,'brush'))
          order=true;
       else
          order=false;
       end
    end
end

