program DequeOfLong;
unit ds_deque;

type
    LongItem2Ptr = ^LongItem2;
    LongItem2 = record
        data: longint;
        prev, next: LongItem2Ptr;
    end;

    LongDeque = record
        first, last: LongItem2Ptr;
    end;

procedure LongDequeInit(var deque: LongDeque);
begin
    deque.first := nil;
    deque.last := nil;
end;

procedure InsertLeft(var deque: LongDeque; var current: LongItem2Ptr; n: longint);
var
    tmp: LongItem2Ptr;
begin
    new(tmp);
    if current = nil then
        tmp^.prev := last
    else 
        tmp^.prev := current^.prev;
    tmp^.next := current;
    tmp^.data := n;

    if tmp^.prev = nil then
        first := tmp;
    else 
        tmp^.prev^.next := tmp;

    if tmp^.next = nil then
        last := tmp;
    else
        tmp^.next^.prev := tmp;
end;

procedure InsertRight(var deque: LongDeque; var current: LongItem2Ptr; n: longint);
var
    tmp: LongItem2Ptr;
begin
   new(tmp);
   if current = nil then
   else   
end;

procedure LongDequePushFront(var deque: LongDeque; n: longint);
begin
    InsertLeft(deque, deque.first, n);
end;

procedure LongDequePushBack(var deque: LongDeque; n: longint);
begin
    InsertRight(deque, deque.last, n);
end;

function LongDequePopFront(var deque: LongDeque; var n: longint): boolean;
var
    tmp: LongItem2Ptr;
begin
    if deque.first = nil then
    begin
        LongDequePopFront := false;
        exit;
    end;
    n := deque.first^.data; 
    tmp := deque.first;
    deque.first := deque.first^.next;
    if deque.first <> nil then
        deque.first^.prev := nil;
    dispose(tmp);
    LongDequePopFront := true;   
end;

function LongDequePopBack(var deque: LongDeque; var n: longint): boolean;
var
    tmp: LongItem2Ptr;
begin
    if deque.last = nil then
    begin
        LongDequePopBack := false;
        exit;
    end;
    n := deque.last^.data; 
    tmp := deque.last;
    if deque.first = deque.last then
        begin
            deque.first := nil;
            deque.last := nil;
        end
    else
        begin
            deque.last := deque.last^.prev;
            deque.last^.next := nil;
        end;
    dispose(tmp);
    LongDequePopBack := true;
end;

function LongDequeIsEmpty(var deque: LongDeque): boolean;
begin
    LongDequeIsEmpty := deque.first = nil;
end;