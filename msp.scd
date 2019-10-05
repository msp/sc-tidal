(
//s.quit;

s.options.numBuffers = 1024 * 256; // increase this if you need to load more samples
s.options.memSize = 8192 * 128; // increase this if you get "alloc failed" messages
s.options.maxNodes = 1024 * 32; // increase this if you are getting drop outs and the message "too many nodes"


s.options.numOutputBusChannels = 32; // Loopback composite devices
// s.options.numOutputBusChannels = 4; // Multi channel
s.options.numInputBusChannels = 2;

// boot the server and start SuperDirt

// Mixing in Live
// s.options.device = "JackRouter";
// s.options.device = "RME + ES-8 + SC 2";
// s.options.device = "Work dammit";
// s.options.device = "Supercollider";
s.options.device = "Fireface UCX (23733485)";


~dirt.free; // free old instance

s.waitForBoot {
    ~dirt = SuperDirt(2, s);
    // ~dirt = SuperDirt(8, s);   // 8 channel
    // ~dirt = SuperDirt(4, s);
    ~dirt.loadSoundFiles;
    // ~dirt.loadSoundFiles("/data/music/AudioSources/Samples/leve-tidal-samples/*");
    // don't run sync if running one line at a time!
    s.sync; // wait until all soundfiles are really loaded

    ~dirt.start(57120, (0, 2 .. 31)); // SC -> Live
    // ~dirt.start(57120, (0, 2 .. 4));	// additive play time
    // ~dirt.start(57120, [0, 0, 0, 0, 0, 0, 0, 0]); // 8 channel
    // ~dirt.start(57120, [0, 0, 0, 0, 0]); // 4 channel
}
)






















