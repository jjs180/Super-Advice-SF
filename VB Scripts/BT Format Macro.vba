Sub BT_Format_Macro()

Dim sht As Worksheet
Dim LastRow As Long

Set sht = ThisWorkbook.ActiveSheet
LastRow = sht.Cells(sht.Rows.Count, "A").End(xlUp).Row
    
    'Delete NULL values
    sht.Cells.Replace what:="NULL", Replacement:="", LookAt:=xlPart, SearchOrder:=xlByRows, MatchCase:=False

    'Format bad date and number fields.
    Range("N2:N" & LastRow).NumberFormat = "m/d/yyyy;@"
    Range("V2:W2" & LastRow).NumberFormat = "m/d/yyyy;@"
    Range("AG2:AG" & LastRow).NumberFormat = "m/d/yyyy;@"
    Range("AQ2:AQ" & LastRow).NumberFormat = "m/d/yyyy;@"
    Range("DD2:DD" & LastRow).NumberFormat = "m/d/yyyy;@"
    
    
    'Concatent Address Fields
    For Each cCell In Range("AJ2:AJ" & LastRow)
    'concatenate
    cCell.Value = cCell.Value & " " & cCell.Offset(0, 1)
    Next cCell
    
    'Add necessary salesforce fields
    Range("DE1").Value = "RecordTypeId"
    Range("DE2:DE" & LastRow).Value = "012900000019VHw"
    Range("DF1").Value = "IsMember"
    Range("DF2:DF" & LastRow).Value = "TRUE"
    Range("DG1").Value = "IsActive"
    Range("DG2:DG" & LastRow).Value = "TRUE"

    MsgBox "Finished!"
    
End Sub
