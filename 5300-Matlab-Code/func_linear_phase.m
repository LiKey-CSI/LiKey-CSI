function linear_phase = func_linear_phase(unwrap_phase)
    fk = [-28:2:-2 -1 1:2:27 28];
    linear_phase = zeros(length(unwrap_phase),30);
    for i = 1:length(unwrap_phase)
        b = (unwrap_phase(30,i)-unwrap_phase(1,i))/(fk(30)-fk(1));
        a = mean(unwrap_phase(:,i),1);
        linear_phase(i,:) = unwrap_phase(:,i).'-b*fk-a;
    end
    linear_phase = linear_phase.';
end