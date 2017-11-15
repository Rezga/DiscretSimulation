function [fire, transition] = tpRobotOrder_pRobot1_pre(transition)

tokID = tokenAnyColor('pRobotOrder',1,'robot1');

transition.selected_tokens = tokID;
granted = request(transition.name, {'robot1',1});        

if(tokID)
    colors=get_color('pRobotOrder',tokID);
end

fire = tokID&&granted;
end