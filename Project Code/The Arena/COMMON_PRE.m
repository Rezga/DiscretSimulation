function [fire, transition] = COMMON_PRE(transition)

   global global_info;

    if (strcmp(transition.name(1:5),"tslot"))
        place=strcat('p',transition.name(2:6));
        tokenRobot = tokenAllColor(place, 1,{'robot2'}); 
        tokenCylen = tokenAnyColor(place, 1,{'cylinder','2cylinder'});
        
       
        
        if tokenRobot&&(tokenRobot==tokenCylen)
            granted = request(transition.name, {'robot2',1});        
            if granted
                colors = get_color(place,tokenRobot);
   
                transition.override=1;
                transition.new_color={};
                j=1;
                for i=1:length(colors)
                    if(not(strcmp(colors{i},'cylinder'))&&not(strcmp(colors{i},'2cylinder'))&&(not(isOrder(colors{i}))))
                        transition.new_color{1,j}=colors{i};
                        j=j+1;
                    elseif(strcmp(colors{i},'2cylinder'))
                        transition.new_color{i,j}='cylinder';
                        j=j+1;
                    end
                end
                transition.new_color{1,j}='openThong';
            end
            priority_cylinder()
        end
        fire =tokenRobot&&(tokenRobot==tokenCylen)&&granted;
        
    elseif(strcmp(transition.name,'tmCylinder1')||strcmp(transition.name,'tmCylinder2')||strcmp(transition.name,'tmCylinder3')||strcmp(transition.name,'tyCylinder1')||strcmp(transition.name,'tyCylinder2')) 
        place=strcat('p',transition.name(2),'c',transition.name(11));
        tokRobot=tokenAnyColor(place,'1',{'robot2'});
        tokCylin=tokenWOAnyColor(place,'1',{'2cylinder'});
        if(tokRobot(1)==tokCylin(1))
            tokRobot=tokRobot(1);
        else
            tokRobot=0;
        end
        if(tokRobot)
            granted = request(transition.name, {'robot2',1});        
            if granted
                colors=get_color(place,tokRobot);
                transition.new_color={};     
                j=1;
                cylinder=0;
                for i=1:length(colors)
                    if(not(isOrder(colors{i}))&&not(strcmp(colors{i},'cylinder')))
                        transition.new_color{1,j}=colors{i};
                        j=j+1;
                    elseif(strcmp(colors{i},'cylinder'))
                        cylinder=1;
                    end
                end
                transition.override=1;
                if cylinder
                    transition.new_color{1,j}='2cylinder';
                else
                    transition.new_color{1,j}='cylinder';
                end
                transition.new_color{1,j+1}='closeThong';
                if(place=='pmc1')
                    global_info.mc1=0;
                elseif(place=='pmc3')
                    global_info.mc3=0;
                elseif(place=='pmc2')
                    global_info.mc2=0;
                elseif(place=='pyc2')
                    global_info.yc2=0;
                elseif(place=='pyc1')
                    global_info.yc1=0;
                end
                priority_slot()
            end
        end
        fire=tokRobot&&granted;
        
    elseif(strcmp(transition.name,'tyTower')||strcmp(transition.name,'tc2Tower'))
        place=strcat('p',transition.name(2:end));
        tokRobot=tokenAnyColor(place,'1',{'robot2'});
        tokCylin=tokenWOAnyColor(place,'1',{'2cylinder'});
        if(tokRobot(1)==tokCylin(1))
            tokRobot=tokRobot(1);
        else
            tokRobot=0;
        end
        if(tokRobot)
            granted = request(transition.name, {'robot2',1});        
            if granted
                colors=get_color(place,tokRobot);
                transition.new_color={};     
                j=1;
                cylinder=0;
                for i=1:length(colors)
                    if(not(isOrder(colors{i}))&&not(strcmp(colors{i},'cylinder')))
                        transition.new_color{1,j}=colors{i};
                        j=j+1;
                    elseif(strcmp(colors{i},'cylinder'))
                        cylinder=1;
                    end
                end
                transition.override=1;
                if cylinder
                    transition.new_color{1,j}='2cylinder';
                else
                    transition.new_color{1,j}='cylinder';
                end
                transition.new_color{1,j+1}='closeThong';
                if(place(1)=='pyTower')
                    global_info.yTower=global_info.yTower-1;
                elseif(place(1)=='pmc2Tower')
                    global_info.c2Tower=global_info.c2Tower-1;
                end
                priority_slot()
            end
        end
        fire=tokRobot&&granted;
        
    elseif(strcmp(transition.name,'tsba2')||strcmp(transition.name,'tsba4')||strcmp(transition.name,'tbba2'))
        place=strcat('p',transition.name(2:end));
        tokTake=tokenAllColor(place,'1','robot1');
        tokTake=tokTake(1);
        if(tokTake)
            granted = request(transition.name, {'robot1',1});
            if granted
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
                if(strcmp(transition.name,'tbba2'))
                    transition.new_color{1,j}='balls_20';
                    global_info.bba2=0;
                else
                    transition.new_color{1,j}='balls_5';
                    if(strcmp(transition.name,'tsba2'))
                        global_info.sba2=0;
                    else
                        global_info.sba4=0;
                    end
                end
                transition.new_color{1,j+1}='brush';
                priority_Basket();
            end
        end
        fire=tokTake&&granted;
    elseif(strcmp(transition.name,'tyBasket'))
        tokenRobot=tokenAllColor('pyBasket','1',{'robot1'});
        tokenBall=tokenAnyColor('pyBasket','1',{'balls_5','balls_20'});
        tokenRobot=tokenRobot(1);
        tokenBall=tokenBall(1);
        if(tokenRobot&&(tokenBall==tokenRobot))
            granted = request(transition.name, {'robot1',1});
            if granted
                colors=get_color('pyBasket',tokenRobot);
                transition.new_color={};     
                j=1;
                for i=1:length(colors)
                    if(not(isOrder(colors{i}))&&not(strcmp(colors{i},'balls_5')||strcmp(colors{i},'balls_20')))
                        transition.new_color{1,j}=colors{i};
                        j=j+1;
                    end
                end
                transition.override=1;
                transition.new_color{1,j}='cannon';
                priority_Balls();
            end
        end
        fire=(tokenRobot&&(tokenBall==tokenRobot)&&granted);
                 
    elseif(strcmp(transition.name,'tStartRobot1'))
        transition.new_color={'robot1'};
        fire=1;
        
    elseif(strcmp(transition.name,'tStartRobot2'))
        transition.new_color={'robot2'};
        fire=1;
        
    elseif(strcmp(transition.name,'tpRobotOrder_pRobot1')||strcmp(transition.name,'tpRobot1_pCannon')||strcmp(transition.name,'tpRobot1_pBrush')||strcmp(transition.name,'tpRobot1_pWheels1')||strcmp(transition.name,'tpRobotOrder_pRobot2')||strcmp(transition.name,'tpRobot2_pWheels2')||strcmp(transition.name,'tpRobot2_pThongs')||strcmp(transition.name,'tpThongs_prThongClose')||strcmp(transition.name,'tpThongs_plThongClose')||strcmp(transition.name,'tpThongs_plThongOpen')||strcmp(transition.name,'tpThongs_prThongOpen')||strcmp(transition.name,'tGoto1')||strcmp(transition.name,'tMoving1')||strcmp(transition.name,'tReStart1')||strcmp(transition.name,'tStop1')||strcmp(transition.name,'tCaptor1')||strcmp(transition.name,'tFinish1')||strcmp(transition.name,'tGoto2')||strcmp(transition.name,'tMoving2')||strcmp(transition.name,'tReStart2')||strcmp(transition.name,'tStop2')||strcmp(transition.name,'tCaptor2')||strcmp(transition.name,'tFinish2')||strcmp(transition.name,'tQuit1')||strcmp(transition.name,'tQuit2'))
        fire=1;
        
    else
        places=strsplit(transition.name(2:end),'_');
        coordinates=values(global_info.distance, {places{1},places{2}});
        robot=strcat('robot',places{3});
        tokenRobot = tokenAnyColor(places{1}, 1,robot); 
        if(tokenRobot)
            granted = request(transition.name, {robot,1});        
            if(granted)
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
                distance=euclidianDistance(coordinates{1}{1},coordinates{1}{2},coordinates{2}{1},coordinates{2}{2});
                transition.new_color{1,j+1}=strcat('goto_X',num2str(coordinates{2}{1}),'_Y',num2str(coordinates{2}{1}),'_D',num2str(distance));
            end
        end
        fire=tokenRobot&&granted;
    end
    
    function [distance]=euclidianDistance(x1,y1,x2,y2)
        distance=ceil(sqrt((x1-y1)^2+(x2-y2)^2));
    end
    
    function order=isOrder(color)
       if(strcmp(color,'closeThong')||strcmp(color,'openThong')||strcmp(color,'wheels')||strcmp(color,'cannon')||strcmp(color,'brush')||strcmp(color(1:4),'goto'))
          order=true;
       else
          order=false;
       end
    end

    function priority_Basket()
        priorset('tpy1_pyRamp_1', 1)
        priorset('tpyRamp_py2_1', 1)
        priorset('tpy2_pyTower_1', 1)
        priorset('tpyc1_pyBasket_1', 4)
        priorset('tpsba2_pyc1_1', 4)
        priorset('tpmc1_psba2_1', 3)
        priorset('tpmc3_psba2_1', 3)
        priorset('tpslot4_psba2_1', 3)
        priorset('tpmc2_psba2_1', 3)
        priorset('tpc2Tower_psba2_1', 3)
        priorset('tpslot2_psba2_1', 3)
        priorset('tpbba2_psba2_1', 3)
        priorset('tpslot5_pmc3_1', 2)
        priorset('tpsba4_pbba2_1', 2)
        
        priorset('tpy1_pyRamp_1', 0)
        priorset('tpyRamp_py2_1', 0)
        priorset('tpy2_pyTower_1', 0)
        priorset('tpmc1_psba2_1', 0)
        priorset('tpmc3_psba2_1', 0)
        priorset('tpslot4_psba2_1', 0)
        priorset('tpmc2_psba2_1', 0)
        priorset('tpc2Tower_psba2_1', 0)
        priorset('tpslot2_psba2_1', 0)
        priorset('tpyc1_psba2_1', 0)
        priorset('tpsba4_pbba2_1', 0)
        priorset('tpyc2_pbba2_1', 0)
        priorset('tpc2Tower_pbba2_1',0)
        priorset('tpsba2_pbba2_1', 0)
        priorset('tpslot5_psba4_1', 0)
        priorset('tpyc2_psba4_1', 0)

    end

    function priority_Balls()
        priorset('tpy1_pyRamp_1', 1)
        priorset('tpyRamp_py2_1', 1)
        priorset('tpy2_pyTower_1', 1)
        
        if(global_info.sba2)
            priorset('tpmc1_psba2_1', 3)
            priorset('tpmc3_psba2_1', 3)
            priorset('tpslot4_psba2_1', 3)
            priorset('tpmc2_psba2_1', 3)
            priorset('tpc2Tower_psba2_1', 3)
            priorset('tpslot2_psba2_1', 3)
            priorset('tpyc1_psba2_1', 3)
        end
        if(global_info.bba2)
            priorset('tpsba4_pbba2_1', 4)
            priorset('tpyc2_pbba2_1', 4)
            priorset('tpc2Tower_pbba2_1', 4)
            priorset('tpsba2_pbba2_1', 4)
        end
        if(global_info.sba4)
            priorset('tpslot5_psba4_1', 3)
            priorset('tpyc2_psba4_1', 3)
        end
        priorset('tpy1_pyRamp_1', 0)
        priorset('tpyRamp_py2_1', 0)
        priorset('tpy2_pyTower_1', 0)
        priorset('tpyc1_pyBasket_1', 0)
        priorset('tpsba2_pyc1_1', 0)
        priorset('tpmc1_psba2_1', 0)
        priorset('tpmc3_psba2_1', 0)
        priorset('tpslot4_psba2_1', 0)
        priorset('tpmc2_psba2_1', 0)
        priorset('tpc2Tower_psba2_1', 0)
        priorset('tpslot2_psba2_1', 0)
        priorset('tpbba2_psba2_1', 0)
        priorset('tpslot5_pmc3_1', 0)
        priorset('tpsba4_pbba2_1', 0)
    end

    function priority_cylinder()
        priorset('tpy1_pyRamp_2', 1)
        priorset('tpyRamp_py2_2', 1)
        if(global_info.yTower)
            priorset('tpy2_pyTower_2', 4)
            priorset('tpslot4_pyTower_2', 4)
            priorset('tpmc1_pyTower_2', 4)
        end
        if(global_info.mc1)
            priorset('tpyTower_pmc1_2', 3)
            priorset('tpsba2_pmc1_2', 3)
            priorset('tpmc3_pmc1_2', 3)
        end
        if(global_info.mc3)
            priorset('tpmc1_pmc3_2', 3)
            priorset('tpslot5_pmc3_2', 3)
            priorset('tpsba2_pmc3_2', 3)
            priorset('tpmc2_pmc3_2', 3)
            priorset('tpslot2_pmc3_2', 3)
        end
        if(global_info.mc2)
            priorset('tpmc3_pmc2_2', 3)
            priorset('tpsba2_pmc2_2', 3)
            priorset('tpslot2_pmc2_2', 3)
            priorset('tpc2Tower_pmc2_2', 3)
        end
        if(global_info.c2Tower)
            priorset('tpmc2_pc2Tower_2', 3)
            priorset('tpbba2_pc2Tower_2', 3)
            priorset('tpslot2_pc2Tower_2', 3)
            priorset('tpsba2_pc2Tower_2', 3)
        end
        if(global_info.yc2)
            priorset('tpsba4_pyc2_2', 4)
            priorset('tpbba2_pyc2_2', 4)
        end
        if(global_info.yc1)
            priorset('tpsba2_pyc1_2', 4)
            priorset('tpyBasket_pyc1_2', 4)
        end
        
        priorset('tpy2_pyTower_2', 0)
        priorset('tpmc1_pyTower_2', 0)
        priorset('tpyc1_psba2_2', 0)
        priorset('tpyTower_pslot4_2', 0)
        priorset('tpslot5_pslot4_2', 0)
        priorset('tpsba2_pslot4_2', 0)

        priorset('tpmc1_pmc3_2', 0)
        priorset('tpsba2_pmc3_2', 0)
        priorset('tpmc2_pmc3_2', 0)
        priorset('tpyc2_psba4_2', 0)
        priorset('tpbba2_psba4_2', 0)
        priorset('tpslot4_pslot5_2', 0)
        priorset('tpmc3_pslot5_2', 0)

        priorset('tpsba2_pc2Tower_2', 0)
        priorset('tpmc2_pc2Tower_2', 0)
        priorset('tpbba2_pc2Tower_2', 0)
        priorset('tpmc3_pslot2_2', 0)
        priorset('tpsba2_pslot2_2', 0)
        priorset('tpmc2_pslot2_2', 0)
        priorset('tpc2Tower_pslot2_2', 0)
    end

    function priority_slot()
        priorset('tyTower',10)
        
        priorset('tpy2_pyTower_2', 2)
        priorset('tpmc1_pyTower_2', 2)
        priorset('tpyc1_psba2_2', 2)
        priorset('tpyTower_pslot4_2', 3)
        priorset('tpslot5_pslot4_2', 3)
        priorset('tpsba2_pslot4_2', 3)

        priorset('tpmc1_pmc3_2', 2)
        priorset('tpsba2_pmc3_2', 2)
        priorset('tpmc2_pmc3_2', 2)
        priorset('tpyc2_psba4_2', 2)
        priorset('tpbba2_psba4_2', 2)
        priorset('tpslot4_pslot5_2', 3)
        priorset('tpmc3_pslot5_2', 3)
        priorset('tpsba4_pslot5_2', 3)

        priorset('tpsba2_pc2Tower_2', 2)
        priorset('tpmc2_pc2Tower_2', 2)
        priorset('tpbba2_pc2Tower_2', 2)
        priorset('tpmc3_pslot2_2', 3)
        priorset('tpsba2_pslot2_2', 3)
        priorset('tpmc2_pslot2_2', 3)
        priorset('tpc2Tower_pslot2_2', 3)
        
        priorset('tpy2_pyTower_2', 0)
        priorset('tpslot4_pyTower_2', 0)
        priorset('tpmc1_pyTower_2', 0)
        priorset('tpyTower_pmc1_2', 0)
        priorset('tpsba2_pmc1_2', 0)
        priorset('tpmc3_pmc1_2', 0)
        priorset('tpmc1_pmc3_2', 0)
        priorset('tpslot5_pmc3_2', 0)
        priorset('tpsba2_pmc3_2', 0)
        priorset('tpmc2_pmc3_2', 0)
        priorset('tpslot2_pmc3_2', 0)
        priorset('tpmc3_pmc2_2', 0)
        priorset('tpsba2_pmc2_2', 0)
        priorset('tpslot2_pmc2_2', 0)
        priorset('tpc2Tower_pmc2_2', 0)
        priorset('tpmc2_pc2Tower_2', 0)
        priorset('tpbba2_pc2Tower_2', 0)
        priorset('tpslot2_pc2Tower_2', 0)
        priorset('tpsba2_pc2Tower_2', 0)
        priorset('tpsba4_pyc2_2', 0)
        priorset('tpbba2_pyc2_2', 0)
        priorset('tpsba2_pyc1_2', 0)
        priorset('tpyBasket_pyc1_2', 0)
                
    end
end

