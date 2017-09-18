
Namespace VehicleDemo
    Public Class Boat
        'Inherit the Vehicle Class.
        Inherits Vehicle

        'We need to override the ComputeRange function to add support for boats.
        'For boats we want to double the couputed range.  We will call the
        'ComputeRange function on MyBase which is the Vehicle class.
        Overrides Function ComputeRange() As Integer
            'This is a boat so we double the calculated range.
            ComputeRange = MyBase.ComputeRange * 2
        End Function

    End Class

End Namespace