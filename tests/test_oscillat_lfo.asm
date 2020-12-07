%include "sointu/header.inc"

BEGIN_SONG BPM(100),OUTPUT_16BIT(0),CLIP_OUTPUT(0),DELAY_MODULATION(0),HOLD(1)

BEGIN_PATTERNS
    PATTERN 64,0,68,0,32,0,0,0,75,0,78,0,0,0,0,0
END_PATTERNS

BEGIN_TRACKS
    TRACK VOICES(1),0
END_TRACKS

BEGIN_PATCH
    BEGIN_INSTRUMENT VOICES(1)
        SU_ENVELOPE   STEREO(0),ATTACK(32),DECAY(32),SUSTAIN(64),RELEASE(64),GAIN(128)
        SU_ENVELOPE   STEREO(0),ATTACK(32),DECAY(32),SUSTAIN(64),RELEASE(64),GAIN(128)
        SU_OSCILLATOR STEREO(0),TRANSPOSE(90),DETUNE(64),PHASE(0),COLOR(128),SHAPE(96),GAIN(128),TYPE(0),LFO(1),UNISON(0)
        SU_OSCILLATOR STEREO(0),TRANSPOSE(100),DETUNE(64),PHASE(0),COLOR(64),SHAPE(96),GAIN(128),TYPE(2),LFO(1),UNISON(0)
        SU_MULP       STEREO(1)
        SU_OUT        STEREO(1),GAIN(128)
    END_INSTRUMENT
END_PATCH

END_SONG
