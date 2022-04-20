program Cep4DelphiVCLSample;

uses
  Vcl.Forms,
  FCep4DelphiVCLSample in 'FCep4DelphiVCLSample.pas' {Form1},
  Cep4D.Model.Interfaces in '..\..\Source\Cep4D.Model.Interfaces.pas',
  Cep4D.Model.Address in '..\..\Source\Cep4D.Model.Address.pas',
  Cep4D.Service.Interfaces in '..\..\Source\Cep4D.Service.Interfaces.pas',
  Cep4D.Component.Interfaces in '..\..\Source\Cep4D.Component.Interfaces.pas',
  Cep4D.Component.RestClient in '..\..\Source\Cep4D.Component.RestClient.pas',
  Cep4D.Exceptions in '..\..\Source\Cep4D.Exceptions.pas',
  Cep4D in '..\..\Source\Cep4D.pas',
  Cep4D.Service.Awesomeapi in '..\..\Source\Cep4D.Service.Awesomeapi.pas',
  Cep4D.Service.ViaCep in '..\..\Source\Cep4D.Service.ViaCep.pas',
  Cep4D.Service.ApiCep in '..\..\Source\Cep4D.Service.ApiCep.pas',
  Cep4D.Helper.JSON in '..\..\Source\Cep4D.Helper.JSON.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
