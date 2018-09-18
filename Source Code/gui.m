function varargout = gui(varargin)
% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @gui_OpeningFcn, ...
    'gui_OutputFcn',  @gui_OutputFcn, ...
    'gui_LayoutFcn',  [] , ...
    'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end

end %end of function
% End initialization code - DO NOT EDIT


% --- Executes just before gui is made visible.
function gui_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

end %end of function


% --- Outputs from this function are returned to the command line.
function varargout = gui_OutputFcn(hObject, eventdata, handles)
varargout{1} = handles.output;
startGame(handles);  % main game controller
end



% --- Executes on button press in restart.
function restart_Callback(hObject, eventdata, handles)
close('gui');
gui;
end


function humanText_Callback(hObject, eventdata, handles)

end

% --- Executes during object creation, after setting all properties.
function humanText_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

end


function agentText_Callback(hObject, eventdata, handles)

end

% --- Executes during object creation, after setting all properties.
function agentText_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

end


function close_Callback(hObject, eventdata, handles)

close all;
end



function humanScore_Callback(hObject, eventdata, handles)

end

% --- Executes during object creation, after setting all properties.
function humanScore_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


function edit4_Callback(hObject, eventdata, handles)
end

% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


function agentScore_Callback(hObject, eventdata, handles)
end

% --- Executes during object creation, after setting all properties.
function agentScore_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end



function humanGameStatus_Callback(hObject, eventdata, handles)

end

% --- Executes during object creation, after setting all properties.
function humanGameStatus_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


function agentGameStatus_Callback(hObject, eventdata, handles)

end
% --- Executes during object creation, after setting all properties.
function agentGameStatus_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end



function humanWinner_Callback(hObject, eventdata, handles)
% hObject    handle to humanWinner (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of humanWinner as text
%        str2double(get(hObject,'String')) returns contents of humanWinner as a double

end
% --- Executes during object creation, after setting all properties.
function humanWinner_CreateFcn(hObject, eventdata, handles)
% hObject    handle to humanWinner (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


function agentWinner_Callback(hObject, eventdata, handles)
% hObject    handle to agentWinner (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of agentWinner as text
%        str2double(get(hObject,'String')) returns contents of agentWinner as a double
end

% --- Executes during object creation, after setting all properties.
function agentWinner_CreateFcn(hObject, eventdata, handles)
% hObject    handle to agentWinner (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end
