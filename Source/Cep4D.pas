unit Cep4D;

interface

uses
  Cep4D.Model.Interfaces,
  Cep4D.Service.Interfaces,
  Cep4D.Exceptions;

type
  ICep4DService = Cep4D.Service.Interfaces.ICep4DService;
  ICep4DModelAddress = Cep4D.Model.Interfaces.ICep4DModelAddress;
  ECep4DException = Cep4D.Exceptions.ECep4DException;

function GetCep4D: ICep4DService;

implementation

function GetCep4D: ICep4DService;
begin
  result := GetService;
end;

end.
