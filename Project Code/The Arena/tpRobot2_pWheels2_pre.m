function [fire, transition] = tpRobot2_pWheels2_pre(transition)

tokID = tokenAnyColor('pRobot2',1,{'wheels'});
transition.selected_tokens = tokID;
granted = request(transition.name, {'robot2',1});
transition.selected_tokens = tokID;

fire = (tokID)&&(granted);
end