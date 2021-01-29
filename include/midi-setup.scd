////////////////////////////////////////////////////////////////////////////////
// MIDI SETUP
////////////////////////////////////////////////////////////////////////////////
(
"\n running local MIDI SETUP...".postln;

MIDIClient.init;

// ~midiOut = MIDIOut.newByName("IAC Driver", "Bus 1");
~rytmOut = MIDIOut.newByName("Elektron Analog Rytm", "Elektron Analog Rytm");
~ana4Out = MIDIOut.newByName("Elektron Analog Four", "Elektron Analog Four");

~rytmOut.latency = 0;
~ana4Out.latency = 0;

~dirt.soundLibrary.addMIDI(\rytm, ~rytmOut);
~dirt.soundLibrary.addMIDI(\ana4, ~ana4Out);
)