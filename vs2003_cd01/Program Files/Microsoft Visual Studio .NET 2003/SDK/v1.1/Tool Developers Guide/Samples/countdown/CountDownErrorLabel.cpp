#using <mscorlib.dll>
#using <System.dll>
#using <System.Windows.Forms.dll>
#using <System.Drawing.dll>

/* Label that shows error message at top of window in big, red characters
   __gc declares that instances of the class will be garbage collected */
__gc public class ErrorLabel : public System::Windows::Forms::Label {

public:
	/* constructor */
	ErrorLabel(System::Windows::Forms::Form* parent) : System::Windows::Forms::Label() {
		Initialize();
		// add to form
		parent->get_Controls()->Add(this);
	}

private:
	/* initializes this label */
	virtual void Initialize() {
		// set position
		set_Location(System::Drawing::Point(10,25));

		// set anchor
		set_Anchor((System::Windows::Forms::AnchorStyles)(System::Windows::Forms::AnchorStyles::Top | System::Windows::Forms::AnchorStyles::Bottom | System::Windows::Forms::AnchorStyles::Left | System::Windows::Forms::AnchorStyles::Right));

		// set the size of the label
		set_Size(System::Drawing::Size(400,50));

		// set the color
		set_ForeColor(System::Drawing::Color::get_Red());

		// set the font height
		set_Font(new System::Drawing::Font("Arial Black",20));

		// set the text of the label
		set_Text("");
	}
};
