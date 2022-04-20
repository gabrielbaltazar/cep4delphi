program Cep4DelphiVCLSample;

uses
  Vcl.Forms,
  FCep4DelphiVCLSample in 'FCep4DelphiVCLSample.pas' {Form1},
  Cep4D.Model.Interfaces in '..\..\Source\Cep4D.Model.Interfaces.pas',
  Cep4D.Model.Address in '..\..\Source\Cep4D.Model.Address.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
