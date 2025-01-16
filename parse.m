function data = parse(file_path)
  % Open the file and read its contents
  fid = fopen(file_path, 'r');
  if fid == -1
    error('Could not open file: %s', file_path);
  end
  content = fscanf(fid, '%c');
  fclose(fid);

  % Initialize the data structure
  data = struct();

  % Parse the dimension
  dim_match = regexp(content, 'dim\s+(\d+)', 'tokens');
  if ~isempty(dim_match)
    data.dimension = str2double(dim_match{1}{1});
  else
    data.dimension = NaN;
  end

  % Parse the degree
  degree_match = regexp(content, 'degree\s+(\d+)', 'tokens');
  if ~isempty(degree_match)
    data.degree = str2double(degree_match{1}{1});
  else
    data.degree = NaN;
  end
  % Parse the knots
  knots_match = regexp(content, 'knots\s*\{([^\}]*)\}', 'tokens');
  if ~isempty(knots_match)
    clean = strrep(knots_match{1}{1}, " ", "");
    string_cells = strsplit(clean, ",");
    float_list = str2double(string_cells);
    data.knots = float_list;
  else
    data.knots = [];
  end
  % Parse the control points
  start_index = strfind(content, 'cpoints {');
  end_index = strfind(content, '}}');
  if ~(isempty(start_index) || isempty(end_index))
    text = content(start_index:end_index);
    pairs = regexp(text, '\{([-+]?\d*\.\d+),([-+]?\d*\.\d+)\}', 'tokens');
    list = [];
    for i = 1:length(pairs)
      vals = [str2num(pairs{i}{1}), str2num(pairs{i}{2})];
      list = [list; vals];
    end
    data.control_points = list;
  else
    data.control_points = [];
  end

end


