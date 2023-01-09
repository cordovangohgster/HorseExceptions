program Exceptions;
{  Ejemplo tomado del repo:
   https://github.com/HashLoad/handle-exception
}
{$APPTYPE CONSOLE}

{$R *.res}

uses
  Horse,
  Horse.Jhonson, // It's necessary to use the unit
  Horse.HandleException, // It's necessary to use the unit
  System.JSON;

begin
  // It's necessary to add the middlewares in the Horse:
  THorse
    .Use(Jhonson) // It has to be before the exceptions middleware
    .Use(HandleException);

  THorse.Post('/ping',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    begin
      // Manage your exceptions:
      raise EHorseException.New.Error('Error personalizado!');
    end);

  THorse.Listen(9000);
end.
