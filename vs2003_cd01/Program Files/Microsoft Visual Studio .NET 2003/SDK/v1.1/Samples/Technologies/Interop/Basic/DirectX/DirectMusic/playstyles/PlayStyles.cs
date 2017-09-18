using System;
using System.Drawing;
using System.ComponentModel;
using System.Windows.Forms;
using DxVBLib;

public class PlayStyles : Form
{
	private Container components;
	private Button [] button;

	private DirectX7 directX;
	private DirectMusicChordMap chordMap;
	private DirectMusicComposer composer;
	private DirectMusicPerformance performance;
	private DirectMusicSegment segment;
	private DirectMusicLoader loader;
	private DirectMusicStyle style;

	public PlayStyles()
	{
		InitializeComponent();

		directX = new DirectX7();
		performance = directX.DirectMusicPerformanceCreate();
		composer = directX.DirectMusicComposerCreate();
		loader = directX.DirectMusicLoaderCreate();

		performance.Init(null, 0);
		performance.SetPort(-1, 4);
		performance.SetMasterAutoDownload(true);

		try
		{
			chordMap = loader.LoadChordMap("CHORDMAP.CDM");
		}
		catch (Exception)
		{
			MessageBox.Show("Could not load ChordMap.  Please ensure that CHORDMAP.CDM is in the directory of this executable.");
		}
        }

	protected override void Dispose( bool disposing )
	{
		if (performance != null) performance.CloseDown();
		if( disposing )
		{
			if (components != null)
			{
				components.Dispose();
			}
		}
		base.Dispose( disposing );
	}

	[STAThread()]
        public static void Main()
	{
		Application.Run(new PlayStyles());
	}

	private void OnClick(object sender, EventArgs e)
	{
		try
		{
			style = loader.LoadStyle(((Button)sender).Text + ".sty");
			segment = composer.ComposeSegmentFromShape(style, 64, 0, 2, false, false, chordMap);
			composer.AutoTransition(performance, segment, (int)CONST_DMUS_COMMANDT_TYPES.DMUS_COMMANDT_FILL, (int)CONST_DMUS_COMPOSEF_FLAGS.DMUS_COMPOSEF_IMMEDIATE, chordMap);
			this.Text = "C# JukeBox - playing " + ((Button)sender).Text;
		}
		catch (Exception)
		{
			MessageBox.Show("Could not make the transition to your selection.  Please ensure that " + ((Button)sender).Text + ".sty is in the directory of this executable.");
		}
	}

	private void InitializeComponent()
	{
		components = new Container();
		button = new Button[18];

		for (int i = 0; i < 18; i++)
		{
			button[i] = new Button();
			button[i].Size = new System.Drawing.Size(72, 32);
			button[i].TabIndex = i;
			button[i].FlatStyle = FlatStyle.Flat;
			button[i].Click += (new EventHandler(this.OnClick));
			button[i].BackColor = Color.MidnightBlue;
			button[i].ForeColor = Color.White;
		}

		button[0].Text = "acidtek";

		button[1].Location = new System.Drawing.Point(0, 32);
		button[1].Text = "bigband";

		button[2].Location = new System.Drawing.Point(0, 64);
		button[2].Text = "boids2";

		button[3].Location = new System.Drawing.Point(0, 96);
		button[3].Text = "boids3";

		button[4].Location = new System.Drawing.Point(0, 128);
		button[4].Text = "cartoonrag";

		button[5].Location = new System.Drawing.Point(0, 160);
		button[5].Text = "classical";

		button[6].Location = new System.Drawing.Point(72, 0);
		button[6].Text = "dance";

		button[7].Location = new System.Drawing.Point(72, 32);
		button[7].Text = "dancemix";

		button[8].Location = new System.Drawing.Point(72, 64);
		button[8].Text = "disco";

		button[9].Location = new System.Drawing.Point(72, 96);
		button[9].Text = "donuts";

		button[10].Location = new System.Drawing.Point(72, 128);
		button[10].Text = "donutz";

		button[11].Location = new System.Drawing.Point(72, 160);
		button[11].Text = "drums!";

		button[12].Location = new System.Drawing.Point(144, 0);
		button[12].Text = "heartland";

		button[13].Location = new System.Drawing.Point(144, 32);
		button[13].Text = "jazz";

		button[14].Location = new System.Drawing.Point(144, 64);
		button[14].Text = "meshel";

		button[15].Location = new System.Drawing.Point(144, 96);
		button[15].Text = "minimald";

		button[16].Location = new System.Drawing.Point(144, 128);
		button[16].Text = "mix";

		button[17].Location = new System.Drawing.Point(144, 160);
		button[17].Text = "sample";

		this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
		this.Text = "C# JukeBox - playing nothing";
		this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedToolWindow;
		this.MaximizeBox = false;
		this.MinimizeBox = false;
		this.ClientSize = new System.Drawing.Size(216, 192);

		for (int i = 0; i < 18; i++)
		{
			this.Controls.Add(button[i]);
		}
	}
}
