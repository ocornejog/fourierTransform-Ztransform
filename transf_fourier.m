function varargout = transf_fourier(varargin)
% TRANSF_FOURIER MATLAB code for transf_fourier.fig
%      TRANSF_FOURIER, by itself, creates a new TRANSF_FOURIER or raises the existing
%      singleton*.
%
%      H = TRANSF_FOURIER returns the handle to a new TRANSF_FOURIER or the handle to
%      the existing singleton*.
%
%      TRANSF_FOURIER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TRANSF_FOURIER.M with the given input arguments.
%
%      TRANSF_FOURIER('Property','Value',...) creates a new TRANSF_FOURIER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before transf_fourier_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to transf_fourier_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help transf_fourier

% Last Modified by GUIDE v2.5 04-Sep-2019 01:29:44

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @transf_fourier_OpeningFcn, ...
                   'gui_OutputFcn',  @transf_fourier_OutputFcn, ...
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


% --- Executes just before transf_fourier is made visible.
function transf_fourier_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to transf_fourier (see VARARGIN)

% Choose default command line output for transf_fourier
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes transf_fourier wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = transf_fourier_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



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



function INTERVALOS_Callback(hObject, eventdata, handles)
% hObject    handle to INTERVALOS (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of INTERVALOS as text
%        str2double(get(hObject,'String')) returns contents of INTERVALOS as a double


% --- Executes during object creation, after setting all properties.
function INTERVALOS_CreateFcn(hObject, eventdata, handles)
% hObject    handle to INTERVALOS (see GCBO)
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
global A f ctrl
syms x t

clc
axes(handles.axes1)
set(handles.axes1, 'visible', 'on')
cla
A = str2num(get(handles.INTERVALOS, 'String'));
f = eval(get(handles.ECUACION, 'String'));
x = linspace(min(A), max(A), 1000);
fx = 0;
for i=1:length(A)-1
    if mod(i, 2) == 1
    fx = fx+((x>=A(i))&(x<=A(i+1))).*subs(f(i),x);
    else
    fx = fx+((x>A(i))&(x<A(i+1))).*subs(f(i),x);
    end
end
plot(x, fx, 'Linewidth', 2);
grid on
xlabel('\bfTIEMPO');
ylabel('\bfAMPLITUD');
%title('\bfGRAFICA DE LA FUNCION');
T = max(x)-min(x);

% --- Executes on button press in CALCULAR.
function CALCULAR_Callback(hObject, eventdata, handles)
% hObject    handle to CALCULAR (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global A f  
syms Fw t w

Fw=fourier(f,w)
clc
axes(handles.axes2)
set(handles.axes2, 'visible', 'off')
cla
P = strcat('$$', 'F(\omega) = ', char(latex(Fw)),'$$');
text('Interpreter','latex',...
	'String',P,...
	'Position',[0 .9],...
	'FontSize',16);

axes(handles.axes3) %Activamos la grafica para el espectro de magnitud
set(handles.axes3, 'visible', 'on') %Convertimos visible el espacio del grafico
cla %Limpiamos el espacio para  el grafico
Fwm=abs(Fw); %Generamos el espectro de magnitud
w=A(1):1/100:A(2);  %Generamos el vector de frecuencia angular
if Fwm~=Fw %Verificamos si la funcion es constante
 plot(w,eval(Fwm),'Color', 'red', 'Linewidth', 1.3);hold on %Graficamos el espectro de magnitud
else
 plot(w,eval(Fwm*power(w,0)),'Color', 'red', 'Linewidth', 1.3);hold on %Graficamos el espectro de magnitud
end
xlim auto %limite del eje x de la grafica
ylim auto %limite del eje y de la grafica
grid on %Establecemos cuadriculas al grafico
xlabel('\bfFRECUENCIA \omega'); %Leyenda del eje x
ylabel('\bfAMPLITUD'); %Leyenda del eje y
title('\bf|F(\omega)|') %Titulo del grafico

axes(handles.axes4) %Activamos la grafica para el espectro de fase
set(handles.axes4, 'visible', 'on') %Convertimos visible el espacio del grafico
cla %Limpiamos el espacio para  el grafico
Fwf=angle(Fw)%Generamos el espectro de fase
w=A(1):1/100:A(2); %Generamos el vector de frecuencia angular
%if Xwf~=Xw  %Verificamos si la funcion es constante
Fwf=subs(Fwf,w)    
plot(w,Fwf,'Color', 'green', 'Linewidth', 1);hold on %Graficamos el espectro de fase
%else
% plot(w,eval(Xwf*power(w,0)),'Color', 'green', 'Linewidth', 1);hold on %Graficamos el espectro de fase
%end
xlim auto %limite del eje x de la grafica
ylim auto %limite del eje y de la grafica
grid on %Establecemos cuadriculas al grafico
xlabel('\bfFRECUENCIA \omega'); %Leyenda del eje x
ylabel('\bfFASE'); %Leyenda del eje y
title('\bf\phi(\omega)') %Titulo del grafico
