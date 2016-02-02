Sub IOOF_Format()
'
' IOOF_Format Macro
'

'
Dim sht As Worksheet
Dim LastRow As Long

Set sht = ThisWorkbook.ActiveSheet
LastRow = sht.Cells(sht.Rows.Count, "A").End(xlUp).Row
    
    'Format bad date and number fields
    Range("K2:K" & LastRow).NumberFormat = "m/d/yyyy;@"
    Range("P2:P" & LastRow).NumberFormat = "0.00"
    Range("Z2:AD" & LastRow).NumberFormat = "m/d/yyyy;@"
    Range("AE2:AL" & LastRow).NumberFormat = "0.00"
    Range("AN2:AN" & LastRow).NumberFormat = "0.00"
    Range("AU2:AV" & LastRow).NumberFormat = "0.00"
    Range("AX2:AX" & LastRow).NumberFormat = "0.00"
    
    'Remove bad text fields from Last Contrib DT
    For Each cCell In Range("AD2:AD" & LastRow)
    'perform action if cell value is bad
    If cCell.Value = "No data available" Then
        'change the cell value to ""
        cCell.Value = ""
    End If
    Next cCell
    
    'Add necessary salesforce fields
    Range("AY1").Value = "RecordTypeId"
    Range("AY2:AY" & LastRow).Value = "012900000019VI2"
    Range("AZ1").Value = "IsMember"
    Range("AZ2:AZ" & LastRow).Value = "TRUE"
    Range("BA1").Value = "IsActive"
    Range("BA2:BA" & LastRow).Value = "TRUE"

    MsgBox "Finished!"
    
End Sub
