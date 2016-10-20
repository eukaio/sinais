function varargout = sinal_senoidal_amos_recons(varargin)
% sinal_senoidal_amos_recons MATLAB code for sinal_senoidal_amos_recons.fig
%      sinal_senoidal_amos_recons, by itself, creates a new sinal_senoidal_amos_recons or raises the existing
%      singleton*.
%
%      H = sinal_senoidal_amos_recons returns the handle to a new sinal_senoidal_amos_recons or the handle to
%      the existing singleton*.
%
%      sinal_senoidal_amos_recons('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in sinal_senoidal_amos_recons.M with the given input arguments.
%
%      sinal_senoidal_amos_recons('Property','Value',...) creates a new sinal_senoidal_amos_recons or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before sinal_senoidal_amos_recons_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to sinal_senoidal_amos_recons_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help sinal_senoidal_amos_recons

% Last Modified by GUIDE v2.5 15-Oct-2016 18:12:27

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @sinal_senoidal_amos_recons_OpeningFcn, ...
                   'gui_OutputFcn',  @sinal_senoidal_amos_recons_OutputFcn, ...
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


% --- Executes just before sinal_senoidal_amos_recons is made visible.
function sinal_senoidal_amos_recons_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to sinal_senoidal_amos_recons (see VARARGIN)

% Choose default command line output for sinal_senoidal_amos_recons
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes sinal_senoidal_amos_recons wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = sinal_senoidal_amos_recons_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function freq_Callback(hObject, eventdata, handles)
% hObject    handle to freq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of freq as text
%        str2double(get(hObject,'String')) returns contents of freq as a double


% --- Executes during object creation, after setting all properties.
function freq_CreateFcn(hObject, eventdata, handles)
% hObject    handle to freq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in gerar.
function gerar_Callback(hObject, eventdata, handles)
f=str2double(get(handles.freq,'String')); %converte a string da caixa de texto para double
t=0:1/10000:2; %Vetor de tempo de 0 a 2 com espaçamentos tão pequenos que pode-se considerar o sinal contínuo
x=sin(2*pi*f*t); %cria um sinal senoidal com a frequência digitada pelo usuário
plot(t,x); %Plota gráfico do seno
ylabel('Amplitude','Fontsize',8);
xlabel('Tempo (s)','Fontsize',8);

function taxa_Callback(hObject, eventdata, handles)
% hObject    handle to taxa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of taxa as text
%        str2double(get(hObject,'String')) returns contents of taxa as a double


% --- Executes during object creation, after setting all properties.
function taxa_CreateFcn(hObject, eventdata, handles)
% hObject    handle to taxa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in discreto.
function discreto_Callback(hObject, eventdata, handles)
f=str2double(get(handles.freq,'String'));
tx=str2double(get(handles.taxa,'String'));
t2=0:tx:2; %Vetor de tempo de 0 a 2 com espaçamentos de tx (taxa de amostragem)
x=sin(2*pi*f*t2);
stem(t2,x); %Plota gráfico para um conjunto discreto de dados ligando pontos
ylabel('Amplitude','Fontsize',8);
xlabel('Tempo (s)','Fontsize',8);

% --- Executes on button press in reconstruir.
function reconstruir_Callback(hObject, eventdata, handles)
f=str2double(get(handles.freq,'String'));
tx=str2double(get(handles.taxa,'String'));
t2=0:tx:2; %Vetor de tempo de 0 a 2 com espaçamentos de tx (taxa de amostragem)
x=sin(2*pi*f*t2); 
stairs(t2,x); % plota gráfico utilizando interpolação zero-horder hold
ylabel('Amplitude','Fontsize',8);
xlabel('Tempo (s)','Fontsize',8);


% --- Executes on button press in checkbox.
function checkbox_Callback(hObject, eventdata, handles)
estado = get(handles.checkbox,'Value');
if estado==1
    hold on;
else
    hold off;
end
