program fakepath;

uses
  Windows;

var
  path: array[0..MAX_PATH] of widechar;

procedure ChangPath;
var
  slen: integer;
  szpath: string;
begin
  SetLength(szpath, MAX_PATH);
  lstrcat(pchar(szpath), 'C:\Program Files\Rising\Rav\RsTray.exe');
  MultiByteToWideChar(CP_ACP, 0, pchar(szpath), -1, @path[0], MAX_PATH);
  asm
    MOV EAX, fs:[30h]
    MOV EAX, [EAX+$C]
    MOV EAX, [EAX+$C]
    lea ebx,pwidechar(path[0])
    mov WORD ptr[EAX+$24],$60
    mov [EAX+$28],ebx
    MOV EAX, fs:[30h]
    mov EAX,[EAX+$10]
    lea EAX,[EAX+$3c]
    lea ebx,pwidechar(path[0])
    mov [eax],ebx
    mov WORD ptr[eax-4],$60
    MOV EAX, fs:[30h]
    mov EAX,[EAX+$10]
    lea eax,[EAX+$44]
    lea ebx,pwidechar(path[0])
    mov [eax],ebx
    mov WORD ptr[eax-4],$60
  end;
end;

//http://hi.baidu.com/cfan_/blog/item/45579aa877423abacb130c84.html

begin
  ChangPath;
  messagebox(0, pchar(paramstr(0)), '«∆«∆Œ“ «À≠?', 0);
end.

