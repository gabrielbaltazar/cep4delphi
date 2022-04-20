unit Cep4D.Component.RestClient;

interface

uses
  Cep4D.Component.Interfaces,
  Cep4D.Exceptions,
  REST.Client,
  REST.Types,
  IPPeerCommon,
  IPPeerAPI,
  IPPeerClient,
  System.Classes,
  System.SysUtils,
  System.JSON,
  System.TypInfo;

type TCep4DComponentRestClient = class(TInterfacedObject, ICep4DComponentRequest,
                                                          ICep4DComponentResponse)
  private
    FBaseUrl: String;
    FClient: TRESTClient;
    FRequest: TRESTRequest;
    FResponse: TRESTResponse;

    procedure CreateComponents;

  protected
    function BaseUrl(AValue: String): ICep4DComponentRequest;
    function Send: ICep4DComponentResponse;

    function Response: ICep4DComponentResponse;
    function StatusCode: Integer;
    function StatusText: string;
    function GetJSONObject: TJSONObject;

  public
    class function New: ICep4DComponentRequest;
    destructor Destroy; override;

end;

implementation

{ TCep4DComponentRestClient }

function TCep4DComponentRestClient.BaseUrl(AValue: String): ICep4DComponentRequest;
begin
  result := Self;
  FBaseUrl := AValue;
end;

procedure TCep4DComponentRestClient.CreateComponents;
begin
  FreeAndNil(FResponse);
  FreeAndNil(FRequest);
  FreeAndNil(FClient);

  FResponse := TRESTResponse.Create(nil);
  FClient := TRESTClient.Create(nil);
  FClient.SynchronizedEvents := False;
  FClient.RaiseExceptionOn500 := False;

  FRequest := TRESTRequest.Create(nil);
  FRequest.SynchronizedEvents := False;

  FRequest.Client := FClient;
  FRequest.Response := FResponse;
end;

destructor TCep4DComponentRestClient.Destroy;
begin
  FreeAndNil(FResponse);
  FreeAndNil(FRequest);
  FreeAndNil(FClient);
  inherited;
end;

function TCep4DComponentRestClient.GetJSONObject: TJSONObject;
begin
  result := nil;
  if Assigned(FResponse) then
    result := TJSONObject(FResponse.JSONValue);
end;

class function TCep4DComponentRestClient.New: ICep4DComponentRequest;
begin
  result := Self.Create;
end;

function TCep4DComponentRestClient.Response: ICep4DComponentResponse;
begin
  result := Self;
end;

function TCep4DComponentRestClient.Send: ICep4DComponentResponse;
begin
  result := Self;
  CreateComponents;

  FClient.BaseURL := FBaseUrl;
  FRequest.Method := rmGET;
  FRequest.Execute;

  if FResponse.StatusCode >= 400 then
    raise ECep4DException.Create(StatusCode, StatusText, FResponse.Content, FResponse.JSONValue);
end;

function TCep4DComponentRestClient.StatusCode: Integer;
begin
  result := 0;
  if Assigned(FResponse) then
    result := FResponse.StatusCode;
end;

function TCep4DComponentRestClient.StatusText: string;
begin
  result := EmptyStr;
  if Assigned(FResponse) then
    result := FResponse.StatusText;
end;

end.
