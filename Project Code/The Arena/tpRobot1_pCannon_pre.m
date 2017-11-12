function [fire, transition] = tpRobot1_pCannon_pre(transition)

tokID = tokenAnyColor('pRobot1',1,{'cannon'});
granted = request(transition.name, {'robot1',1});
transition.selected_tokens = tokID;

fire = (tokID)&&(granted);
end

