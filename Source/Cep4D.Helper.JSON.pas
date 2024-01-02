unit Cep4D.Helper.JSON;

interface

uses
  System.SysUtils,
  System.JSON;

type
  TCep4DHelperJSONObject = class helper for TJSONObject
  public
    function ValueAsBoolean(AName: string; ADefault: Boolean = false): Boolean;
    function ValueAsString(AName: string; ADefault: string = ''): string;
    function ValueAsInteger(AName: string; ADefault: Integer = 0): Integer;
    function ValueAsFloat(AName: string; ADefault: Double = 0): Double;
    function ValueAsJSONObject(AName: string): TJSONObject;
  end;

implementation

{ TCep4DHelperJSONObject }

function TCep4DHelperJSONObject.ValueAsBoolean(AName: string; ADefault: Boolean): Boolean;
var
  LStrValue: string;
begin
  Result := ADefault;
  if GetValue(AName) <> nil then
  begin
    LStrValue := GetValue(AName).ToString;
    Result := not LStrValue.Equals('false');
  end;
end;

function TCep4DHelperJSONObject.ValueAsFloat(AName: string; ADefault: Double): Double;
var
  LStrValue: string;
begin
  LStrValue := ValueAsString(AName, ADefault.ToString);
  LStrValue := LStrValue.Replace('.', FormatSettings.DecimalSeparator)
    .Replace(',', FormatSettings.DecimalSeparator);
  Result := StrToFloatDef(LStrValue, ADefault);
end;

function TCep4DHelperJSONObject.ValueAsInteger(AName: string; ADefault: Integer): Integer;
var
  LStrValue: string;
begin
  LStrValue := ValueAsString(AName, ADefault.ToString);
  Result := StrToIntDef(LStrValue, ADefault);
end;

function TCep4DHelperJSONObject.ValueAsJSONObject(AName: string): TJSONObject;
begin
  Result := nil;
  if GetValue(AName) is TJSONObject then
    Result := TJSONObject( GetValue(AName) );
end;

function TCep4DHelperJSONObject.ValueAsString(AName, ADefault: string): string;
begin
  Result := ADefault;
  if GetValue(AName) <> nil then
    Result := GetValue(AName).Value;
end;

end.
