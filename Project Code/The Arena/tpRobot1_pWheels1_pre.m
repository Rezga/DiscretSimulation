function [fire, transition] = tpRobot1_pWheels1_pre(transition)

tokID = tokenAnyColor('pRobot1',1,{'wheels'});
granted = request(transition.name, {'robot1',1});
transition.selected_tokens = tokID;

fire = (tokID)&&(granted);
end

