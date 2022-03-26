function varargout = transfinversa(varargin)
% TRANSFINVERSA MATLAB code for transfinversa.fig
%      TRANSFINVERSA, by itself, creates a new TRANSFINVERSA or raises the existing
%      singleton*.
%
%      H = TRANSFINVERSA returns the handle to a new TRANSFINVERSA or the handle to
%      the existing singleton*.
%
%      TRANSFINVERSA('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TRANSFINVERSA.M with the given input arguments.
%
%      TRANSFINVERSA('Property','Value',...) creates a new TRANSFINVERSA or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before transfinversa_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to transfinversa_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help transfinversa

% Last Modified by GUIDE v2.5 15-Jun-2019 21:12:32

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @transfinversa_OpeningFcn, ...
                   'gui_OutputFcn',  @transfinversa_OutputFcn, ...
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
% End initialization code - DO NOT EDIT


% --- Executes just before transfinversa is made visible.
function transfinversa_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to transfinversa (see VARARGIN)

% Choose default command line output for transfinversa
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes transfinversa wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = transfinversa_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in exit.
function exit_Callback(hObject, eventdata, handles)
% hObject    handle to exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(transfinversa);

% --- Executes on button press in reset.
function reset_Callback(hObject, eventdata, handles)
% hObject    handle to reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.func,'String','');
set(handles.transfor,'String','-');
set(handles.fase,'String','-');
set(handles.magnitud,'String','-');
set(handles.inf,'String','-');
set(handles.sup,'String','-');




function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function inf_Callback(hObject, eventdata, handles)
% hObject    handle to inf (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of inf as text
%        str2double(get(hObject,'String')) returns contents of inf as a double


% --- Executes during object creation, after setting all properties.
function inf_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inf (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in inicio.
function inicio_Callback(hObject, eventdata, handles)
% hObject    handle to inicio (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global FUNC;
syms MAGNITUD FASE w t;
func=eval((get(handles.func,'String')));
FUNC=func;
if isempty(func)
        msgbox('Introduzca alguna función','Error');
else
end
TRANSFORMADAF=ifourier(func,t);
MAGNITUD=abs(TRANSFORMADAF);
FASE=angle(TRANSFORMADAF);
transformada=evalc('pretty(TRANSFORMADAF)');
magnit=evalc('pretty(MAGNITUD)');
fas=evalc('pretty(FASE)');
set(handles.transfor,'Min',0,'Max',20);
set(handles.transfor,'String',transformada);
set(handles.magnitud,'Min',0,'Max',20);
set(handles.magnitud,'String',magnit);
set(handles.fase,'Min',0,'Max',20);
set(handles.fase,'String',fas);



function func_Callback(hObject, eventdata, handles)
% hObject    handle to func (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of func as text
%        str2double(get(hObject,'String')) returns contents of func as a double


% --- Executes during object creation, after setting all properties.
function func_CreateFcn(hObject, eventdata, handles)
% hObject    handle to func (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function transfor_Callback(hObject, eventdata, handles)
% hObject    handle to transfor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of transfor as text
%        str2double(get(hObject,'String')) returns contents of transfor as a double


% --- Executes during object creation, after setting all properties.
function transfor_CreateFcn(hObject, eventdata, handles)
% hObject    handle to transfor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in menu.
function menu_Callback(hObject, eventdata, handles)
% hObject    handle to menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns menu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from menu
syms w t;
func=str2sym(get(handles.func,'String'));
lim1=str2num(get(handles.inf,'String'));
lim2=str2num(get(handles.sup,'String'));
if isempty(func)
        msgbox('Introduzca algo en la función','Error');
else
end
if isempty(lim1)
        msgbox('Introduzca un numero en lugar de un caracter en el límite inferior','Error');
else
end
if isempty(lim2)
        msgbox('Introduzca un numero en lugar de un caracter en el límite superior','Error');
else
end
opcion=get(handles.menu,'Value');
FUNCION=inline(func);
TRANSFORMADAF=inline(ifourier(func,t));
MAGNITUD=inline(abs(ifourier(func,t)));
FASE=inline(phase(ifourier(func,t)));
for i=1:200
    FAS(i)=FASE(i/200);
end
t=linspace(lim1,lim2,200);
w=linspace(lim1,lim2,200);
switch opcion
    case 1
        axes(handles.axes1)
        plot(w,TRANSFORMADAF(w))
        grid on
        title('Gráfica de la transformada de Fourier');
        xlabel('Frecuencia angular w');
        ylabel('F(w)');
    case 2
        axes(handles.axes1)
        plot(t,FUNCION(t))
        grid on
        title('Gráfica de la función original');
        xlabel('tiempo t');
        ylabel('f(t)');
    case 3
        axes(handles.axes1)
        plot(w,MAGNITUD(w))
        grid on
        title('Espectro de magnitud');
        xlabel('Frecuencia angular w');
        ylabel('|F(w)|');
    case 4
        axes(handles.axes1)
        plot(w,unwrap(FAS))
        grid on
        title('Espectro de fase');
        xlabel('Frecuencia angular w');
        ylabel('Fase(F(w))');
end

% --- Executes during object creation, after setting all properties.
function menu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function fase_Callback(hObject, eventdata, handles)
% hObject    handle to fase (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of fase as text
%        str2double(get(hObject,'String')) returns contents of fase as a double


% --- Executes during object creation, after setting all properties.
function fase_CreateFcn(hObject, eventdata, handles)
% hObject    handle to fase (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function magnitud_Callback(hObject, eventdata, handles)
% hObject    handle to magnitud (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of magnitud as text
%        str2double(get(hObject,'String')) returns contents of magnitud as a double


% --- Executes during object creation, after setting all properties.
function magnitud_CreateFcn(hObject, eventdata, handles)
% hObject    handle to magnitud (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
