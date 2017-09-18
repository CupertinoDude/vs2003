Customer Debug Probes
===========================================================

Overview:
  . Customer Debug Probes (CDP) are switches in the runtime which will help you
    inspect runtime state which you would not otherwise be able to inspect and 
    to receive notice of runtime events you could not otherwise trap.


  . This project provides a code snippet to demo each probe. Each demo has a static
    entry point called from the Main method which takes a Boolean. The probe will "fire"
    if and only if the probe is enabled and the Boolean is set to true. The Boolean
    helps to isolate exactly what code is causing the probe to fire. 
    
    
  . To build the solution and register the COM object select 
        Build -> Batch Build... -> Rebuild.
  
  
  . Messages from the probes are sent as log messages to a managed debugger if one
    is attached. Otherwise, messages are sent to OutputDebugString. In visual studio
    the output window (cntl-alt-o) traps and displays messages sent via either 
    mechanism.
    
    
Enabling CDP:
  . The probes are enabled by adding attributes to the developerSettings element 
    in the machine config file and the application config file. These files are 
    parsed when the runtime is loaded and hence the CDP must be enabled before the 
    managed application starts and cannot be enabled for applications already started.
    If the developerSettings or runtime element is not present in the config file 
    you will need to add them as shown below.


  . To locate the machine.config file first discover from what directory the application 
    is loading mscorlib.dll. The machine.config file is located there in a subdirectory 
    named config. 


  . For the purposes of this demo you will only need to edit your machine.config file as
    an application config file, ManagedApp.exe.config, is provided for you. When you decide
    to use the CDP with your application you can use the provided config file as a template.
    
    
  . There are two global switches which can only be added to the machine.config file:
  
        CDP.AllowDebugProbes - enables and disables all the probes. 
        CDP.AllowDebugBreak - allows probes to trigger retail asserts on critical failures.
 
    Here is an example of how to set these attributes in your machine.config file:
    
        <configuration>
            ...
            <runtime>
                ...
                <developerSettings
                    ...
                    CDP.AllowDebugProbes="true"
                    CDP.AllowDebugBreak="false"
                />
                ...
            </runtime>
            ...
        </configuration>


  . Individual probes can be enabled or disabled globally by adding attribute value pairs to 
    the machine.config or for a specific application by adding attribute value pairs to the application 
    config file. The former will override settings in the latter. 
    
    
  . Every probe is enabled by adding
  
        CDP.ProbeName="true" 
        
    to either the machine.config or the application.config file. A probe is disabled by setting 
    the value to anything other than "true". A listing of all probes is provided below along with 
    descriptions of what they do.
    
    
  . You will receive feedback in the output window for every probe you enable. 
    

Probes:
  . CollectedDelegate
        This probe prevents the collection of stubs created when a delegate is marshaled as a
        function pointer. This way if unmanaged code attempts to place a call back on function pointer 
        to a collected delegate the call can be intercepted by this probe. This probe will raise a 
        debug break if they are enabled. 
        
        When delegates are marshaled to unmanaged code as function pointers the runtime is unable
        to keep track of when the unmanaged code is finished with the function pointer. This is
        because the unmanaged code has no way to report its references to the GC. If the managed
        code neglects to keep a reference to the delegate for the lifetime of the function pointer
        a garbage collection could occur collect the delegate and invalidate the function pointer 
        causing calls on that function pointer to fail. 
        
        PInvokeProbes\CollectedDelegate.cs demonstrates this probe
        
        
  . PInvokeCallConvMismatch
        On x86, this probe compares the EBP register before and after a PInvoke call to determine
        if the unmanaged function executed the calling convention specified by the DllImport 
        custom attribute. This probe will raise a debug break if the calling conventions do not match.
        
        The common calling conventions, stdcall, cdecl and this, specify if the callee or the caller
        should remove the arguments from the stack and whether the this pointer should be 
        passed on the stack or in ECX. If the caller and callee do not agree on the calling convention
        the stack could become corrupted. 
        
        PInvokeProbes\CallConv.cs demonstrates this probe
        
  
  . Marshaling
        This probe logs what unmanaged type a managed object is marshaled as when a unmanaged function
        is called from managed code. The filter can be used to limit which functions have their
        marshaling logged. See the included AppConfig file for the format.
        
        COMProbes\Marshalling\ComMarshaling.cs demonstrates this probe


  . NotMarshalable
        This probe reports if an IMarshal provided by a COM object fails when the runtime attempts
        to marshal the object. 
        
        When the runtime tries to marshal an object it first looks to see if the object implements
        IMarshal and then, if not, looks for a registered stub. If the runtime cannot marshal the
        object for whatever reason it simply breaks COM protocol and places the call using whatever 
        thread requested the RPC. This probe reports when that protocol is broken in the case of
        an IMarshal failing.
        
        COMProbes\ContextProbes\NotMarshalable.cs demonstrates this probe
        
  
  . InvalidIUnknown   
        This probe reports if a call to Query Interface fails. See the demo for details.
        
        COMProbes\ContextProbes\FailedQI.cs demonstrates this probe     
  
  
  . ObjNotKeptAlive
        This probe forces a garbage collection just before a call from managed to unmanaged code is
        made in an effort to collect all COM objects whose counts have fallen to zero. 
        
        If unmanaged code neglects to ref count a COM object correctly the count could drop to zero 
        prematurely, the object will delete itself and the next access to the object will fail. These
        bugs are difficult to track down because it's not clear which AddRef does not have a 
        corresponding release. This problem is even harder to track down when the COM object is an
        exported managed object because they are not deleted when their ref count drops to zero
        but rather during the next garbage collection. 
        
        There is no demo for this probe.
        
        
  . BufferOverrun 
        This probe triggers a garbage collection after a call from managed to unmanaged code. 
        
        Unmanaged code can corrupt the state of the runtime. This frequently happen as a result of
        a stack buffer overrun during an call from managed to unmanaged code. If a pointer the GC is 
        responsible for has been corrupted then when the GC compresses the heap it will attempt 
        to dereference the corrupted pointer likely resulting in an access violation. This probe 
        attempts to reduce the time between the corruption of the GC pointer and the access violation.  
        
        There is no demo for this probe.
    
  
  . DisconnectedContext 
        This probe fires if the runtime cannot place a call in the correct apartment because the
        apartment thread is dead. See NotMarshalable for further explanation.
        
        COMProbes\ContextProbes\DisconnectedContext.cs demonstrates the problem.
        
        
  . Apartment
        This probe causes the runtime to check to see if the apartment state of a thread has
        changed behind the runtime's back. 
  
        COM identifies a thread as STA or MTA by storing a bit of information in the thread local
        storage for the thread. COM clients set that bit when they call CoInitialize and CoUninitialize.
        The runtime also identifies a thread as STA or MTA by storing a bit of information in a private 
        data structure. Currently COM does not provide notification when a threads state changes 
        from MTA to STA and hence the those two bits of information can become inconsistent.        
    
        COMProbes\ContextProbes\Apartment.cs demonstrates the problem.
                  
                  
        
  
  


    




