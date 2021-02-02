(
// s.quit;

var workingDir = "/data/development/tidal-cycles/201805/sc/";
var synthDefsFile = "20210128.scd";
var synthDefs;
var includePath;

// configure the audio outputs
~out1 = 0;
~out2 = 2;
~out3 = 4;
~out4 = 6;
~out5 = 8;
~out6 = 10;
~out7 = 12;
~out8 = 14;
~out9 = 16;
~out10 = 18;
~out11 = 20;
~out12 = 22;
~out13 = 24;
~out14 = 26;
~out15 = 28;
~out16 = 30;

s.options.numBuffers = 1024 * 1024; // increase this if you need to load more samples
// s.options.memSize = 8192 * 128; // increase this if you get "alloc failed" messages
s.options.memSize = 8192 * 256; // increase this if you get "alloc failed"
s.options.maxNodes = 1024 * 32; // increase this if you are getting drop outs and the message "too many nodes"


s.options.numOutputBusChannels = 32; // Loopback composite devices
//s.options.numOutputBusChannels = 2; // Multi channel
s.options.numInputBusChannels = 2;

// boot the server and start SuperDirt

// Mixing in Live
// s.options.device = "JackRouter";
// s.options.device = "RME + ES-8 + SC 2";
// s.options.device = "Work dammit";
// s.options.device = "Supercollider";
// s.options.device = "Fireface UCX (23733485)";
// s.options.device = "Saffire 6USB";
s.options.device = "Tidal into Live";
// s.options.device = "MacBook Pro Speakers";
// s.options.device = "External Headphones";

~dirt.free; // free old instance

s.waitForBoot {
    ~dirt = SuperDirt(2, s);
    // ~dirt = SuperDirt(8, s);   // 8 channel
	// ~dirt = SuperDirt(4, s);
    ~dirt.loadSoundFiles;
	// ~dirt.loadSoundFiles("/data/music/AudioSources/Samples/leve-tidal-samples/*");
    ~dirt.loadSoundFiles("/data/Dropbox-spatial/Dropbox/spatial/music/AudioSources/oily-cart-awu-samples/*");

	// s.sync; // optionally: wait for samples to be read
	// ~dirt.start(57120, 0 ! 12);   // start listening on port 57120, create two busses each sending audio to channel 0
	~dirt.start(57120, (0, 2 .. 31));

	// optional, needed for convenient access from sclang:
	(
		~d1 = ~dirt.orbits[0]; ~d2 = ~dirt.orbits[1]; ~d3 = ~dirt.orbits[2];
		~d4 = ~dirt.orbits[3]; ~d5 = ~dirt.orbits[4]; ~d6 = ~dirt.orbits[5];
		~d7 = ~dirt.orbits[6]; ~d8 = ~dirt.orbits[7]; ~d9 = ~dirt.orbits[8];
		~d10 = ~dirt.orbits[9]; ~d11 = ~dirt.orbits[10]; ~d12 = ~dirt.orbits[11];
	);

    // // don't run sync if running one line at a time!
    // s.sync; // wait until all soundfiles are really loaded
    //
    //
    // ~dirt.start(57120, (0, 2 .. 31)); // SC -> Live
    // // ~dirt.start(57120, (0, 2 .. 4));	// additive play time
    // // ~dirt.start(57120, [0, 0, 0, 0, 0, 0, 0, 0]); // 8 channel
    // // ~dirt.start(57120, [0, 0, 0, 0, 0]); // 4 channel

	includePath = PathName.new(thisProcess.nowExecutingPath.dirname+/+"include/");

	includePath.postln;
	includePath.entries.postln;

	includePath.files.do{|aFile|
		"\nloading >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>".postln;
		aFile.fullPath.postln;
		load(aFile.fullPath);
	};

	synthDefs = PathName.new(workingDir+/+synthDefsFile);
	"\nloading >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>".postln;
	synthDefs.postln;

	load(synthDefs.fullPath);
}
)

// s.latency = 0.3; // increase this if you get "late" messages











