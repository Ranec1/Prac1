function [ error ] = get_distance( vector1, vector2 )
% Matches the elements of vector1 with closest element of vector2, then
% returns the average error (total error / size of vector1)
% I chose to implement errors as relative errors.

    error = 0;
    for i=1:size(vector1)
        % zoek per element van de estimate naar de dichtbijzijnde echte
        % eigenwaarde
        smallest_error = Inf;
        for j=1:size(vector2)
            % relatieve error berekenen
            current_error = norm(vector1(i) - vector2(j))/norm(vector2(j));
            if current_error < smallest_error
                smallest_error = current_error;
            end
        end
        error = error + smallest_error;    % Toevoegen aan totale error
    end
    error = error/length(vector1);  % totale error relatief maken
    % om de verschillende iteraties te kunnen vergelijken
end
