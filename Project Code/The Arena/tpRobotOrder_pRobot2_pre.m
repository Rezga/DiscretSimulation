function [fire, transition] = tpRobotOrder_pRobot2_pre(transition)

tokID = tokenAnyColor('pRobotOrder',1,{'robot2'});
transition.selected_tokens = tokID;

fire = (tokID);
end

