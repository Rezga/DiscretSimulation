function [fire, transition] = tpRobotOrder_pRobot1_pre(transition)

tokID = tokenAnyColor('pRobotOrder',1,'robot1');

transition.selected_tokens = tokID;

fire = (tokID);
end