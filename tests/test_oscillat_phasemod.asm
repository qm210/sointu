%include "sointu/header.inc"

BEGIN_SONG BPM(100),OUTPUT_16BIT(0),CLIP_OUTPUT(0),DELAY_MODULATION(0)

BEGIN_PATTERNS
    PATTERN 80,HLD,HLD,HLD,HLD,HLD,HLD,HLD,HLD,HLD,HLD,0,0,0,0,0
END_PATTERNS

BEGIN_TRACKS
    TRACK VOICES(1),0
END_TRACKS

BEGIN_PATCH
    BEGIN_INSTRUMENT VOICES(1)
        SU_ENVELOPE   STEREO(0),ATTACK(80),DECAY(80),SUSTAIN(64),RELEASE(80),GAIN(128)
        SU_OSCILLATOR STEREO(0),TRANSPOSE(64),DETUNE(64),PHASE(0),COLOR(128),SHAPE(64),GAIN(128),TYPE(SINE),LFO(0),UNISON(0)
        SU_MULP       STEREO(0)
        SU_PUSH       STEREO(0)
        SU_OSCILLATOR STEREO(0),TRANSPOSE(70),DETUNE(64),PHASE(64),COLOR(128),SHAPE(64),GAIN(128),TYPE(SINE),LFO(1),UNISON(0)
        SU_SEND       STEREO(0),AMOUNT(128),VOICE(0),UNIT(1),PORT(2),SENDPOP(1)
        SU_OUT        STEREO(1),GAIN(128)
    END_INSTRUMENT
END_PATCH

END_SONG
