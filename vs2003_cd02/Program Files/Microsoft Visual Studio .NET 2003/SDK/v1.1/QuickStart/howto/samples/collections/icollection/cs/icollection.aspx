<%@ Import Namespace="System" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Collections" %>

<script language="C#" runat=server>

void Page_load(Object src, EventArgs ea) {

	StringWriter strWriter = new StringWriter();
	Console.SetOut(strWriter);

	EmployeeCollection ec = new EmployeeCollection();

	Console.WriteLine("Adding elements to the EmployeeCollection");
	Console.WriteLine("---------------------------------------------------------------");
	ec.AddEmployee( 1234, "John" );
	ec.AddEmployee( 5678, "Lisa" );
	ec.AddEmployee( 3283, "Max" );
	ec.AddEmployee( 1928, "Regina" );
	ec.AddEmployee( 4019, "Clarence" );

	foreach(Employee e in ec)
		Console.WriteLine(ec.GetEmployee(e.ID));

	Console.WriteLine();

	//AddEmployee is set to return a value indicating if the item already existed
	//all employees must be unique...
	Console.WriteLine("Attempting to add a duplicate employee id...");
	Console.WriteLine("---------------------------------------------------------------");
	if (ec.AddEmployee(5678, "Katherine")) {
		Console.WriteLine("Sorry, the employee id {0} already existed in the collection.", 5678);
	}

	Console.WriteLine();
	Console.WriteLine("Setting the name of existing employee with id 5678...");
	Console.WriteLine("---------------------------------------------------------------");
	ec.SetName(5678, "Katherine");

	foreach(Employee e in ec)
		Console.WriteLine(ec.GetEmployee(e.ID));


	//getting a particular employee
	Console.WriteLine();
	Console.WriteLine("Retrieving the employee with id 4019...");
	Console.WriteLine("---------------------------------------------------------------");
	Console.WriteLine(ec.GetEmployee(4019).ToString());

	//clearing the collection...
	ec.Clear();
	Console.WriteLine();
	Console.WriteLine("Clearing the collection...displaying the elements (no elements left...)");	
	Console.WriteLine("---------------------------------------------------------------");
	foreach(Employee e in ec)
		Console.WriteLine(ec.GetEmployee(e.ID));


	lblOut.Text = "<pre>" + strWriter.ToString() + "</pre>";
}

class EmployeeCollection : ICollection {

        private Employee[] _array;
	private int _size;
        private int _capacity;       // Last valid element in the collection
    	
        private const int _MinimumGrow = 4;

        public EmployeeCollection() {

            _array = new Employee[16];
            _capacity = 0;
            _size = 0;
        }

//These are the set of methods which must be provided through the implementation...
//----------------------------
    	public virtual void CopyTo(Array array, int index)
    	{
		//not supported in this demonstration...
                throw new Exception("This method is not supported in this implementation");
	}

    	public virtual int Count {
    		get { return _size; }
    	}

    	public virtual Object SyncRoot {
    		get { return this; }
    	}

    	public virtual bool IsSynchronized {
    		get { return false; }
    	}

    	public virtual IEnumerator GetEnumerator()
    	{
    		return new EmployeeEnumerator(this);
    	}
//----------------------------

	//returns a true if the value already existed...
        public virtual bool AddEmployee(int id, String name) {

	    //ensure the element does not already exist...
	    foreach (Employee e in _array) {
		if (!(e == null)) {

			if ( id == e.ID) {
				//indicate the person already existed...
				return true;
			}
		}
	    }

	    Employee emp = new Employee(id, name);

            if (_size == _array.Length) {
                int newcapacity = _array.Length * 2;
                if (newcapacity < _array.Length + _MinimumGrow) {
                    newcapacity = _array.Length + _MinimumGrow;
                }
                SetCapacity(newcapacity);
            }
    
            _array[_capacity] = emp;
            _capacity = (_capacity + 1) % _array.Length;
            _size++;

	    return false;
        }

        public void Clear() {
            if (_capacity > 0)
                Array.Clear(_array, 0, _size);
            else {
                Array.Clear(_array, 0, _array.Length);
                Array.Clear(_array, 0, _capacity);
            }
 
            _capacity = 0;
            _size = 0;
        }

        public Employee GetEmployee(int id) {
            if (_size == 0)
                throw new InvalidOperationException("You cannot get an employee when the collection is empty.");
    
	    foreach (Employee e in _array) {
		if ( id == e.ID) {
			//this is the one...
			return e;			
		}
	    }

	    return null;
        }

	public bool SetName(int id, String name) {
	    foreach (Employee e in _array) {
		if ( id == e.ID) {
			//update this one!
			
			e.Name = name;
			return true;
		}
	    }			

	    return false;
	}

        private void SetCapacity(int capacity) {
            Employee[] newarray = new Employee[capacity];
            if (_size > 0) {
                if (_capacity > 0) {
                    Array.Copy(_array, 0, newarray, 0, _size);
                } else {
                    Array.Copy(_array, 0, newarray, 0, _array.Length);
                    Array.Copy(_array, 0, newarray, _array.Length, _capacity);
                }
            }
    
            _array = newarray;
            _capacity = _size;
        }


        internal Object GetElement(int i)
        {
            return _array[i % _array.Length];
        }

	class EmployeeEnumerator : IEnumerator {

		private EmployeeCollection _ec;
		private int _index;
		private Object currentElement;

		internal EmployeeEnumerator(EmployeeCollection ec) {
			_ec = ec;

			_index = 0;
			currentElement = _ec._array;

			if (_ec._size == 0)
				_index = -1;
		}

		public virtual bool MoveNext() {
	
			if (_index < 0) {  
				currentElement = _ec._array;

				return false;
			}
			currentElement = _ec.GetElement(_index);
			_index++;

			if (_index == _ec._size)
				_index = -1;

			return true;
		}

		public virtual void Reset() {

			if (_ec._size == 0)
				_index = -1;
			else
				_index = 0;

			currentElement = _ec._array;
		}

		public virtual Object Current {
			get {
				if (currentElement == _ec._array)
				{
					if (_index == 0)
						throw new InvalidOperationException("Invalid Operation");
                	        	else
						throw new InvalidOperationException("Invalid operation");
				}

				return currentElement;
			}
		}
	}
}


class Employee {

	String _name;
	int _id;

	public Employee( int id, String name ) {
		this._name = name;
		this._id = id;

	}

	public String Name {
		get { return  _name; }
		set { _name = value; }
	}

	public int ID {
		get { return  _id; }
		set { _id = value; }
	}

	override public string ToString ()
	{
		return _id + ", " + _name;
	}
}
</script>


<html>
<head>
          <link rel="stylesheet" href="intro.css">
</head>

<body style="background-color:f6e4c6">

<form runat="server">
    <p>

<table>
    <tr><td><b>The following example demonstrates implementing the ICollection interface</b>. In this example we make a fictitious EmployeeCollection, for a company which likes employing people, but doesn't like them leaving. Therefore, we allow elements to be added and modified, but you can't actually remove any elements from the collection unless you clear the entire collection. If you have a look at the code, you will see that we can use a foreach loop to parse the information in the collection, a reflection of the fact we have included an IEnumerator for the collection.
		<hr>
    </td></tr>
</table>

<table>
    <tr><td><h4><asp:label id="lblOut" runat="server"/></h4></td>
    </tr>
</table>


</form>
</body>
</html>
