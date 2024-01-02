unit Cep4D.Exceptions;

interface

uses
  System.JSON,
  System.SysUtils;

type
  ECep4DException = class(Exception)
  private
    FStatusCode: Integer;
    FStatusText: string;
    FContent: string;
    FJSONValue: TJSONValue;
  public
    constructor Create(AStatusCode: Integer; AStatusText, AContent: string; AJSON: TJSONValue);
    destructor Destroy; override;

    property StatusCode: Integer read FStatusCode;
    property StatusText: string read FStatusText;
    property Content: string read FContent;
    property JSONValue: TJSONValue read FJSONValue;
  end;

implementation

{ ECep4DException }

constructor ECep4DException.Create(AStatusCode: Integer; AStatusText, AContent: string; AJSON: TJSONValue);
begin
  FStatusCode := AStatusCode;
  FStatusText := AStatusText;
  FContent := AContent;

  Self.Message := Format('%s %s: %s', [FStatusCode.ToString,
    FStatusText, FContent]);

  if Assigned(AJSON) then
    FJSONValue := AJSON.Clone as TJSONValue;
end;

destructor ECep4DException.Destroy;
begin
  FJSONValue.Free;
  inherited;
end;

end.
