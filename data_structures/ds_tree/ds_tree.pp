program TreeOfLong;
unit ds_tree;

interface
type
    TreeNodePtr = ^TreeNode;
    TreeNode = record
        data: longint;
        left, right: TreeNodePtr;
    end;

function SumTree(p: TreeNodePtr): longint;
function AddToTree(var p: TreeNodePtr; value: longint): boolean;
function IsInTree(p: TreeNodePtr; value: longint): boolean;

implementation
function SumTree(p: TreeNodePtr): longint;
begin
    if p = nil then
        SumTree := 0;
    else 
        SumTree := SumTree(p^.left) + p^.data + SumTree(p^.right)
end;

function AddToTree(var p: TreeNodePtr; value: longint): boolean;
begin
    if p = nil then
    begin
        new(p);
        p^.data := value;
        p^.left := nil;
        p^.right := nil;
        AddToTree := true;
    end
    else
    if value < p^.data then
        AddToTree := AddToTree(p^.left, value)
    else
    if value > p^.data then
        AddToTree := AddToTree(p^.right, value)
    else
        AddToTree := false
end;

function IsInTree(p: TreeNodePtr; value: longint): boolean;
begin
    if p = nil then
        IsInTree := false
    else
    if value < p^.data then
        IsInTree := IsInTree(p^.left, value)
    else
    if value > p^.data then
        IsInTree := IsInTree(p^.right, value) 
    else
        IsInTree := true
end;

end. //end of the module
