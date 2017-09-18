#using <mscorlib.dll>
using namespace System;
using namespace System::Reflection; // For Missing.Value and BindingFlags
using namespace System::Runtime::InteropServices; // For COMException

#using "Excel.dll" // The following two #using statements are obligatory for Microsoft Visual C++ v7.0
#using "VBIDE.dll"
#using "Office.dll"
using namespace Excel;

int main () {
	Console::WriteLine ("Creating new Excel.Application");
	Application* app = dynamic_cast<Application *>( new ApplicationClass());
	if (app == 0) {
		Console::WriteLine("ERROR: EXCEL couldn't be started!");
		return 0;
	}
	
	Console::WriteLine ("Making application visible");		
	app->Visible = true;
	
	Console::WriteLine ("Getting the workbooks collection");
	Workbooks* workbooks = app->Workbooks;

	Console::WriteLine ("Adding a new workbook");
	
	_Workbook* workbook = workbooks->Add(Missing::Value);

	Console::WriteLine ("Getting the worksheets collection");
	Sheets* sheets = workbook->Worksheets;

	int SheetIndex(1);
	_Worksheet* worksheet = __try_cast<_Worksheet*>(sheets->Item[__box(1)]);
	if (worksheet == 0) {
		Console::WriteLine ("ERROR: worksheet == null");
	}
	
	Console::WriteLine ("Setting the value for cell");
	// This paragraph puts the value 5 to the cell A10
    Range* range1 = worksheet->get_Range(S"G1", Missing::Value);
	if (range1 == 0) {
		Console::WriteLine ("ERROR: range == null");
	}
	range1->Value2 = __box(5);
	
	// This paragraph sends single dimension array to Excel
    Range* range2 = worksheet->get_Range(S"A1", S"E1");
	int array2 __gc[] = new int __gc[5];
	for (int i=0; i < array2->GetLength(0); i++) {
		array2[i] = i+1;
	}
	range2->Value2 = array2;
    
	// This paragraph sends two dimension array to Excel
    Range* range3 = worksheet->get_Range(S"A2", S"E3");
	int array3 __gc[,] = new int __gc[2, 5];
	for (int i=0; i < array3->GetLength(0); i++) {
		for (int j=0; j < array3->GetLength(1); j++) {
			array3[i, j] = i*10 + j;
		}
	}
	Object* args3[] = new Object*[1];
	args3[0] = array3;
	range3->Value2 = array3;
    
	// This paragraph reads two dimension array from Excel
    Range* range4 = worksheet->get_Range(S"A2", S"E3");
	Object* array4[,];
	array4 = (Object* [,]) range4->Value2;
	
	for (int i=array4->GetLowerBound(0); i <= array4->GetUpperBound(0); i++) {
		for (int j=array4->GetLowerBound(1); j <= array4->GetUpperBound(1); j++) {
			double d = *dynamic_cast<Double*>(array4[i, j]);
			if (d != array3[i-1, j-1]) {
				Console::WriteLine ("Test FAILED!");
				return 0;
			}
		}
	}

	// This paragraph sends two dimension array to Excel
    Range* range5 = worksheet->get_Range(S"A5", S"J6");
	double array5 __gc[,] = new double __gc[2, 10];
	for (int j=0; j < array5->GetLength(1); j++) {
		double arg = Math::PI/array5->GetLength(1) * j;
		array5[0, j] = Math::Sin(arg);
		array5[1, j] = Math::Cos(arg);
	}
	range5->Value2 = array5;
	
	// The following code draws the chart
	range5->Select();

	ChartObjects* chartobjects = __try_cast<ChartObjects*>(worksheet->ChartObjects(Missing::Value));
	
	ChartObject* chartobject = __try_cast<ChartObject*>(chartobjects->Add(10 /*Left*/, 100 /*Top*/, 450 /*Width*/, 250 /*Height*/));
	_Chart* chart = __try_cast<_Chart*>(chartobject->Chart);
	
	// Call to chart.ChartWizard() is shown using late binding technique solely for the demonstration purposes
	Object* args7[] = new Object*[11];
	args7[0] = range5; // Source
	args7[1] = __box(XlChartType::xl3DColumn); // Gallery
	args7[2] = Missing::Value; // Format
	args7[3] = __box(XlRowCol::xlRows); // PlotBy
	args7[4] = 0; // CategoryLabels
	args7[5] = 0; // SeriesLabels
	args7[6] = __box(true); // HasLegend
	args7[7] = S"Sample Chart"; // Title
	args7[8] = S"Sample Category Type"; // CategoryTitle
	args7[9] = S"Sample Value Type"; // ValueTitle
	args7[10] = Missing::Value; // ExtraTitle
	// The last parameter is lcid, but as we use late binding here it should be omited
	//args7[11] = 0; // lcid
	chart->GetType()->InvokeMember("ChartWizard", BindingFlags::InvokeMethod, 0, chart, args7);
    
	Console::WriteLine ("Press ENTER to finish the sample:");
	Console::ReadLine();		
	
	try {
		// If user interacted with Excel it will not close when the app object is destroyed, so we close it explicitely
		workbook->Saved = true; // To be able to close it without being asked to save it
		app->UserControl = false;
		app->Quit();
	} catch (COMException*) {
		Console::WriteLine ("User closed Excel manually, so we don't have to do that");
	}
	
	// The following line is necessary to be sure that app object is released when we finish, because
	// the Garbage Collector is non-deterministic and by default can leave app unreleased. 
	GC::Collect();
	
	Console::WriteLine ("Test successfully passed!");
	return 100;
}
