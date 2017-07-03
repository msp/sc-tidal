Quarks.gui

Quarks.folder

/* INIT SUPERDIRT */
(
s.quit;
s.options.numOutputBusChannels = 10;
s.options.numBuffers = 1024 * 16;
s.options.memSize = 8192 * 16;
~dirt.free; // free old instance
s.waitForBoot {
	~dirt = SuperDirt(2, s);
	~dirt.loadSoundFiles;
	s.sync; // wait until all soundfiles are really loaded
	~dirt.start(57120, (0, 2 .. 9)); // play two orbits
}
)

~dirt.start


~dirt.stop;

OSCFunc.trace(true, true); // see if network messages are coming in from tidal
OSCFunc.trace(false); // stop tracing



Platform.userExtensionDir