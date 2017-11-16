function [fire, transition] = tGoto2_pre(transition)

granted = request(transition.name, {'robot2',1});

fire=granted;

end