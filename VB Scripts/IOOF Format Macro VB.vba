Sub IOOF_Format()
'
' IOOF_Format Macro
'

'
Dim sht As Worksheet
Dim LastRow As Long

Set sht = ThisWorkbook.ActiveSheet
LastRow = sht.Cells(sht.Rows.Count, "A").End(xlUp).Row
    
    'Format bad date and number fields.
    Range("O2:O" & LastRow).NumberFormat = "m/d/yyyy;@"
    Range("R2:R" & LastRow).NumberFormat = "m/d/yyyy;@"
    Range("AD2:AD" & LastRow).NumberFormat = "m/d/yyyy;@"
    Range("AK2:AK" & LastRow).NumberFormat = "m/d/yyyy;@"
    Range("BN2:BN" & LastRow).NumberFormat = "m/d/yyyy;@"
    
    
    'Concatent Address Fields
    For Each cCell In Range("H2:H" & LastRow)
    'concatenate
    cCell.Value = cCell.Value & " " & cCell.Offset(0, 1) & " " & cCell.Offset(0, 2)
    Next cCell
    
    'Add necessary salesforce fields
    Range("BX1").Value = "RecordTypeId"
    Range("BX2:BX" & LastRow).Value = "012900000019VI1"
    Range("BY1").Value = "IsMember"
    Range("BY2:BY" & LastRow).Value = "TRUE"
    Range("BZ1").Value = "IsActive"
    Range("BZ2:BZ" & LastRow).Value = "TRUE"

    MsgBox "Finished!"
End Sub


