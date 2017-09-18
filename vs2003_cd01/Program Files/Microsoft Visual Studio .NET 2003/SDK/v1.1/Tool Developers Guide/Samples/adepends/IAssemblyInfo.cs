/**
 * Information about Assembly Manifests.
 *
 * @author  Jonathan Pryor
 */

namespace ADepends
  {
  using System;
  using System.Collections;

  /**
   * Makes information about an Assembly available.
   *
   * Exists because we needed to expose "invalid" assemblies. For example,
   * a valid (could be loaded) assembly could reference an invalid (can't 
   * be loaded) assembly.  Instead of aborting the entire operation, it
   * would be preferrable to accept the "invalid" assembly, and continue.
   *
   * Doing this requires at least two implementations--one for valid a
   * assemblies and one for invalid assemblies.  Inheritence could have
   * been used, but it didn't make sense to have the 
   * AssemblyExceptionInfo class inherit from the AssemblyInfo class.
   * The use of an interface made more sense, so this is what's being used.
   */
  internal interface IAssemblyInfo
    {
    /** 
     * @return Returns the assembly that this information was generated for.
     *  If the assembly couldn't be loaded, this should return null.
     */
    AssemblyRef GetAssembly ();

    /** @return The full name of the assembly. */
    String Name
      {get;}

    /** 
     * @return If an error occurred, the reason for the error.  If no
     *  error occurred, then null is returned.
     */
    Exception Error
      {get;}

    /** 
     * Makes available the full names (as String objects) of all assemblies
     * that the Assembly returned by GetAssembly() is dependant on.
     */
    ICollection ReferencedAssemblies
      {get;}

    /** 
     * Makes available the Modules (as Module objects) of all modules
     * that the Assembly returned by GetAssembly() contains.
     */
    ICollection ReferencedModules
      {get;}

    } /* interface IAssemblyInfo */
  } /* namespace ADepends */

