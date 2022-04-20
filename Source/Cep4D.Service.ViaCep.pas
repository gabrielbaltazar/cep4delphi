unit Cep4D.Service.ViaCep;

interface

uses
  System.SysUtils,
  System.JSON,
  Cep4D.Service.Interfaces,
  Cep4D.Service.ApiCep,
  Cep4D.Model.Interfaces,
  Cep4D.Component.Interfaces,
  Cep4D.Helper.JSON;

type TCep4DServiceViaCep = class(TInterfacedObject, ICep4DService)

  private
    FAddress: ICep4DModelAddress;
    FZipCode: String;
    FComponent: ICep4DComponentRequest;
    FDecorator: ICep4DService;

  protected
    function ZipCode(AValue: String): ICep4DService;
    function Search: ICep4DModelAddress;

    function Address: ICep4DModelAddress;
    function Component(AValue: ICep4DComponentRequest): ICep4DService;

  public
    constructor Create;
    class function New: ICep4DService;

end;

implementation

{ TCep4DServiceViaCep }

function TCep4DServiceViaCep.Address: ICep4DModelAddress;
begin
  if not Assigned(FAddress) then
    FAddress := NewAddress;
  result := FAddress;
end;

function TCep4DServiceViaCep.Component(AValue: ICep4DComponentRequest): ICep4DService;
begin
  result := Self;
  FComponent := AValue;
  FDecorator.Component(AValue);
end;

constructor TCep4DServiceViaCep.Create;
begin
  FDecorator := TCep4DServiceApiCep.New;
end;

class function TCep4DServiceViaCep.New: ICep4DService;
begin
  result := Self.Create;
end;

function TCep4DServiceViaCep.ZipCode(AValue: String): ICep4DService;
begin
  result := Self;
  FZipCode := AValue;
  FDecorator.ZipCode(AValue);
end;

function TCep4DServiceViaCep.Search: ICep4DModelAddress;
var
  LUrl: string;
  LError: Boolean;
  LJSON: TJSONObject;
begin
  try
    FAddress := NewAddress;
    FAddress.ZipCode(FZipCode);
    LUrl := Format('https://viacep.com.br/ws/%s/json', [FAddress.ZipCode]);

    FComponent
      .BaseUrl(LUrl)
      .Send;

    LJSON := FComponent.Response.GetJSONObject;
    if Assigned(LJSON) then
    begin
      LError := LJSON.ValueAsBoolean('erro', False);
      if LError then
        raise Exception.Create('Postal Code not found.');

      FAddress
        .Address(LJSON.valueAsString('logradouro'))
        .Complement(LJSON.valueAsString('complemento'))
        .District(LJSON.valueAsString('bairro'))
        .IbgeCode(LJSON.ValueAsInteger('ibge'))
        .City(LJSON.valueAsString('localidade'))
        .State(LJSON.valueAsString('uf'))
        .DDD(LJSON.ValueAsInteger('ddd'));
    end;
  except
    FAddress := FDecorator.Search;
  end;

  result := FAddress;
end;

end.

