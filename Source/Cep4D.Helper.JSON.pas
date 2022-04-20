unit Cep4D.Helper.JSON;

interface

uses
  System.SysUtils,
  System.JSON;

type TCep4DHelperJSONObject = class helper for TJSONObject

  public
    function ValueAsBoolean(AName: string; ADefault: Boolean = false): Boolean;
    function ValueAsString(AName: string; ADefault: string = ''): string;
    function ValueAsInteger(AName: string; ADefault: Integer = 0): Integer;
    function ValueAsFloat(AName: string; ADefault: Double = 0): Double;
    function ValueAsJSONObject(AName: String): TJSONObject;
end;

implementation

{ TCep4DHelperJSONObject }

function TCep4DHelperJSONObject.ValueAsBoolean(AName: string; ADefault: Boolean): Boolean;
var
  LStrValue: string;
begin
  result := ADefault;
  if GetValue(AName) <> nil then
  begin
    LStrValue := GetValue(AName).ToString;
    result := not LStrValue.Equals('false');
  end;
end;

function TCep4DHelperJSONObject.ValueAsFloat(AName: string; ADefault: Double): Double;
var
  LStrValue: string;
begin
  LStrValue := ValueAsString(AName, ADefault.ToString);
  LStrValue := LStrValue
                .Replace('.', FormatSettings.DecimalSeparator)
                .Replace(',', FormatSettings.DecimalSeparator);

  result := StrToFloatDef(LStrValue, ADefault);
end;

function TCep4DHelperJSONObject.ValueAsInteger(AName: string; ADefault: Integer): Integer;
var
  LStrValue: string;
begin
  LStrValue := ValueAsString(AName, ADefault.ToString);
  result := StrToIntDef(LStrValue, ADefault);
end;

function TCep4DHelperJSONObject.ValueAsJSONObject(AName: String): TJSONObject;
begin
  result := nil;
  if GetValue(AName) is TJSONObject then
    result := TJSONObject( GetValue(AName) );
end;

function TCep4DHelperJSONObject.ValueAsString(AName, ADefault: string): string;
begin
  result := ADefault;
  if GetValue(AName) <> nil then
    result := GetValue(AName).Value;
end;

end.
