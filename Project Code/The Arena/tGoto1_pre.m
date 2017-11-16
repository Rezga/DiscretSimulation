function [fire, transition] = tGoto1_pre(transition)

granted = request(transition.name, {'robot1',1});

fire=granted;

end