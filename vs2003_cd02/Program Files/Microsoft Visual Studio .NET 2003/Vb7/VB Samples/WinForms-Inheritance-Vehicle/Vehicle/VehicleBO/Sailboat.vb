Namespace VehicleDemo
    Public Class Sailboat
        'Inherit the Vehicle class.
        Inherits Vehicle

        'We need to override the ComputeRange function to add support for sailboats.
        'For sailboats we want to triple the couputed range.  We will call the
        'ComputeRange function on MyBase which is the Vehicle class.
        Overrides Function ComputeRange() As Integer
            'This is a sailboat so we triple the calculated range.
            ComputeRange = MyBase.ComputeRange * 3
        End Function

    End Class
End Namespace
