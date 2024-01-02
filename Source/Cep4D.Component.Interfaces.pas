unit Cep4D.Component.Interfaces;

interface

uses
  System.JSON;

type
  ICep4DComponentResponse = interface;

  ICep4DComponentRequest = interface
    ['{05FF57D1-2FCF-4859-93BF-64A6469925C0}']
    function BaseUrl(AValue: string): ICep4DComponentRequest;
    function Send: ICep4DComponentResponse;

    function Response: ICep4DComponentResponse;
  end;

  ICep4DComponentResponse = interface
    ['{2614ACDA-A74E-44BA-BF6D-06B45D313042}']
    function StatusCode: Integer;
    function StatusText: string;
    function GetJSONObject: TJSONObject;
  end;

function GetComponent: ICep4DComponentRequest;

implementation

uses
  Cep4D.Component.RestClient;

function GetComponent: ICep4DComponentRequest;
begin
  Result := TCep4DComponentRestClient.New;
end;

end.
