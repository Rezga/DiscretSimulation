function [fire, transition] = tpRobot2_pWheels2_pre(transition)

tokID = tokenAnyColor('pRobot2',1,{'wheels'});
transition.selected_tokens = tokID;

fire = (tokID);
end