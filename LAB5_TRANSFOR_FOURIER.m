%UNIVERSIDAD MAYOR DE SAN ANDRÉS-------------------------------------------
%FACULTAD DE INGENIERÍA----------------------------------------------------
%DEPARTAMENTO DE CURSO BÁSICO----------------------------------------------
%--------------------------------------------------------------------------
%----------------TRANSFROMADAS INTEGRALES(MAT-315L)------------------------
%-----------------------LABORATORIO #5-------------------------------------
%------------------ TRANSFORMADA DE FOURIER -------------------------------
%--------------------------------------------------------------------------
function varargout = fourier(varargin)
% FOURIER MATLAB code for fourier.fig
%      FOURIER, by itself, creates a new FOURIER or raises the existing
%      singleton*.
%
%      H = FOURIER returns the handle to a new FOURIER or the handle to
%      the existing singleton*.
%
%      FOURIER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FOURIER.M with the given input arguments.
%
%      FOURIER('Property','Value',...) creates a new FOURIER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before fourier_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to fourier_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help fourier

% Last Modified by GUIDE v2.5 01-Dec-2016 08:08:35

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @fourier_OpeningFcn, ...
                   'gui_OutputFcn',  @fourier_OutputFcn, ...
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


% --- Executes just before fourier is made visible.
function fourier_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to fourier (see VARARGIN)

% Choose default command line output for fourier
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
% set(handles.axes1,'Visible','off');
% set(handles.axes2,'Visible','off');


% UIWAIT makes fourier wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = fourier_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in CALCULAR.
function CALCULAR_Callback(hObject, eventdata, handles)
% hObject    handle to CALCULAR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global A xt  %Declaramos variables globales
syms Xw t w %Declaramos variables simbolicas

Xw=fourier(xt,w)
axes(handles.axes2) %Activamos la grafica para las constantes
set(handles.axes2,'visible','off') %Convertimos invisible el espacio del grafico
cla %Limpiamos el espacio para  el grafico
P = strcat('$$', 'X(\omega) = ', char(latex(Xw)),'$$'); %Construimos la cadena que imprimira F(w)
text('Interpreter','latex',... %Posicionamos para imprimir en pantalla F(w)
	'String',P,...
	'Position',[0 .5],...
	'FontSize',14)
axes(handles.axes3) %Activamos la grafica para el espectro de magnitud
set(handles.axes3, 'visible', 'on') %Convertimos visible el espacio del grafico
cla %Limpiamos el espacio para  el grafico
Xwm=abs(Xw); %Generamos el espectro de magnitud
w=A(1):1/100:A(2);  %Generamos el vector de frecuencia angular
if Xwm~=Xw %Verificamos si la funcion es constante
 plot(w,eval(Xwm),'Color', 'red', 'Linewidth', 1.3);hold on %Graficamos el espectro de magnitud
else
 plot(w,eval(Xwm*power(w,0)),'Color', 'red', 'Linewidth', 1.3);hold on %Graficamos el espectro de magnitud
end
xlim auto %limite del eje x de la grafica
ylim auto %limite del eje y de la grafica
grid on %Establecemos cuadriculas al grafico
xlabel('\bfFRECUENCIA \omega'); %Leyenda del eje x
ylabel('\bfAMPLITUD'); %Leyenda del eje y
title('\bf|X(\omega)|') %Titulo del grafico

axes(handles.axes11) %Activamos la grafica para el espectro de fase
set(handles.axes11, 'visible', 'on') %Convertimos visible el espacio del grafico
cla %Limpiamos el espacio para  el grafico
Xwf=angle(Xw)%Generamos el espectro de fase
w=A(1):1/100:A(2); %Generamos el vector de frecuencia angular
%if Xwf~=Xw  %Verificamos si la funcion es constante
Xwf=subs(Xwf,w)    
plot(w,Xwf,'Color', 'green', 'Linewidth', 1);hold on %Graficamos el espectro de fase
%else
% plot(w,eval(Xwf*power(w,0)),'Color', 'green', 'Linewidth', 1);hold on %Graficamos el espectro de fase
%end
xlim auto %limite del eje x de la grafica
ylim auto %limite del eje y de la grafica
grid on %Establecemos cuadriculas al grafico
xlabel('\bfFRECUENCIA \omega'); %Leyenda del eje x
ylabel('\bfFASE'); %Leyenda del eje y
title('\bf\phi(\omega)') %Titulo del grafico

guidata(hObject, handles);

function ECUACION_Callback(hObject, eventdata, handles)
% hObject    handle to ECUACION (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Hints: get(hObject,'String') returns contents of ECUACION as text
%        str2double(get(hObject,'String')) returns contents of ECUACION as a double
% --- Executes during object creation, after setting all properties.
function ECUACION_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ECUACION (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
% --- Executes on button press in GRAFICAR.
function GRAFICAR_Callback(hObject, eventdata, handles)
% hObject    handle to GRAFICAR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global A xt t  %Definimos variables globales
syms t %Activamos la grafica para el espectro de Fase
clc %limpia los comandos y posicion anteriores del cursor
axes(handles.axes1) %Activamos la grafica para el grafico de la funcion
set(handles.axes1, 'visible', 'on')%establece visibles los ejes
cla %Limpiamos el espacio para  el grafico

A(1)= str2num(get(handles.editor_linf, 'String')); %Limite inferior del primer tramo de la señal
A(2)= str2num(get(handles.editor_lsup, 'String')); %Limite superior del primer tramo de la señal
xt=eval(get(handles.ECUACION, 'String')); %Se obtiene la ecuacion de la señal del primer tramo
xtp=abs(xt);
t=A(1):1/100:A(2); %Generamos el vector del tiempo para la señal completa
if xtp~=xt %Verificamos si la funcion es constante
 plot(t,eval(xt),'Color', 'blue', 'Linewidth', 1.3);hold on %Graficamos el espectro de magnitud
else
 xti=subs(xt,t);
 plot(t,eval(xti),'Color', 'blue', 'Linewidth', 1.3);hold on %Graficamos el espectro de magnitud
end
xlim auto%limite del eje x de la grafica
ylim auto%limite del eje y de la grafica
grid on  %Establecemos cuadriculas al grafico
xlabel('\bfTIEMPO t'); %Leyenda del eje x
ylabel('\bfAMPLITUD'); %Leyenda del eje y
title('\bfx(t)','FontName','Cambria','FontSize',12); %titulo del grafico
guidata(hObject, handles);
function editor_linf_Callback(hObject, eventdata, handles)
% hObject    handle to editor_linf (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editor_linf as text
%        str2double(get(hObject,'String')) returns contents of editor_linf as a double


% --- Executes during object creation, after setting all properties.
function editor_linf_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editor_linf (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ARMONICOS_Callback(hObject, eventdata, handles)
% hObject    handle to ARMONICOS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ARMONICOS as text
%        str2double(get(hObject,'String')) returns contents of ARMONICOS as a double


% --- Executes during object creation, after setting all properties.
function ARMONICOS_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ARMONICOS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function axes3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes3


% --- Executes on mouse press over axes background.
function axes2_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to axes2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function axes2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes2



function editor_lsup_Callback(hObject, eventdata, handles)
% hObject    handle to editor_lsup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editor_lsup as text
%        str2double(get(hObject,'String')) returns contents of editor_lsup as a double


% --- Executes during object creation, after setting all properties.
function editor_lsup_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editor_lsup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ECUACION2_Callback(hObject, eventdata, handles)
% hObject    handle to ECUACION2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ECUACION2 as text
%        str2double(get(hObject,'String')) returns contents of ECUACION2 as a double


% --- Executes during object creation, after setting all properties.
function ECUACION2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ECUACION2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editor_linf2_Callback(hObject, eventdata, handles)
% hObject    handle to editor_linf2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editor_linf2 as text
%        str2double(get(hObject,'String')) returns contents of editor_linf2 as a double


% --- Executes during object creation, after setting all properties.
function editor_linf2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editor_linf2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editor_lsup2_Callback(hObject, eventdata, handles)
% hObject    handle to editor_lsup2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editor_lsup2 as text
%        str2double(get(hObject,'String')) returns contents of editor_lsup2 as a double


% --- Executes during object creation, after setting all properties.
function editor_lsup2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editor_lsup2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ECUACION3_Callback(hObject, eventdata, handles)
% hObject    handle to ECUACION3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ECUACION3 as text
%        str2double(get(hObject,'String')) returns contents of ECUACION3 as a double


% --- Executes during object creation, after setting all properties.
function ECUACION3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ECUACION3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editor_linf3_Callback(hObject, eventdata, handles)
% hObject    handle to editor_linf3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editor_linf3 as text
%        str2double(get(hObject,'String')) returns contents of editor_linf3 as a double


% --- Executes during object creation, after setting all properties.
function editor_linf3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editor_linf3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function editor_lsup3_Callback(hObject, eventdata, handles)
% hObject    handle to editor_lsup3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of editor_lsup3 as text
%        str2double(get(hObject,'String')) returns contents of editor_lsup3 as a double


% --- Executes during object creation, after setting all properties.
function editor_lsup3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editor_lsup3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in boton_reiniciar.
function boton_reiniciar_Callback(hObject, eventdata, handles)
% hObject    handle to boton_reiniciar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global A x1 x2 x3 ti xi T amptx ampx %variables globales para todo el programa
A=zeros(1,6);%Reiniciamos los valores de los intervalos
x2=0;
x3=0;
set(handles.ECUACION,'string',' ') %Limpiamos ecuaciones anteriores 
set(handles.editor_linf,'string',' ') %Limpiamos limite inferior 
set(handles.editor_lsup,'string',' ') %Limpiamos limite superior
axes(handles.axes1) %Establecemos en el grafico de la señal
cla %Limpiamos el grafico correspondiente
axes(handles.axes2) %Establecemos en la grafica de constantes
set(handles.axes2, 'visible', 'off') %Desactivamos la visibilidad de la grafica de constantes
cla %Limpiamos el grafico correspondiente
axes(handles.axes3) %Establecemos en el grafico del espectro de magnitud
cla %Limpiamos el grafico correspondiente
axes(handles.axes11) %Establecemos en el grafico del espectro de fase
cla %Limpiamos el grafico correspondiente
