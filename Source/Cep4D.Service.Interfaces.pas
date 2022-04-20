unit Cep4D.Service.Interfaces;

interface

uses
  Cep4D.Model.Interfaces,
  Cep4D.Component.Interfaces;

type
  ICep4DService = interface
    ['{A3043859-B1F7-40DB-A6A6-136DAFEF5474}']
    function ZipCode(AValue: String): ICep4DService;
    function Search: ICep4DModelAddress;

    function Address: ICep4DModelAddress;
    function Component(AValue: ICep4DComponentRequest): ICep4DService;
  end;

function GetService: ICep4DService;

implementation

uses
  Cep4D.Service.Awesomeapi;

function GetService: ICep4DService;
begin
  result := TCep4DServiceAwesomeapi.New;
  Result.Component(GetComponent);
end;

end.
