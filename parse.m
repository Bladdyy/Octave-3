% Open the file for reading
filename = 'sinus_taki.bs';
fid = fopen(filename, 'r');

% Initialize variables
knots = [];
cpoints = [];
degree = 0;

% Read the file line by line
while ~feof(fid)
    line = strtrim(fgetl(fid)); % Get a line and trim whitespace
    line
    if startsWith(line, 'degree')
        degree = sscanf(line, 'degree %d'); % Extract the degree
    elseif startsWith(line, 'knots')
        % Extract the knots
        knots_start = strfind(line, '{') + 1;
        knots_end = strfind(line, '}') - 1;
        knots = sscanf(line(knots_start:knots_end), '%f,');
    elseif startsWith(line, 'cpoints')
        % Read control points in the next lines
        while ~startsWith(line, 'cpointsmk')
            if startsWith(line, '{') && ~startsWith(line, 'cpoints')
                % Remove braces and extract point values
                line = strrep(line, '{', '');
                line = strrep(line, '}', '');
                cpoint = sscanf(line, '%f,');
                cpoints = [cpoints; cpoint'];
            end
            line = strtrim(fgetl(fid));
        end
    end
end

% Close the file
fclose(fid);

% Save the variables in an Octave .mat file
save('points.mat', 'knots', 'cpoints', 'degree');

% Display the results
disp('Knots:');
disp(knots);
disp('Control Points:');
disp(cpoints);
disp('Degree:');
disp(degree);
